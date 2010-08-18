/* Copyright (C) 2010 /dev/rsa for ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include "ScriptPCH.h"
#include "ruby_sanctum.h"

enum eTexts
{
        SAY_SPAWN = -1752027,
        SAY_AGGRO = -1752028,
        SAY_SLAY1 = -1752029,
        SAY_SLAY2 = -1752030,
        SAY_DEATH = -1752031,
        SAY_BERSERK = -1752032,
        SAY_SPECIAL1 = -1752033,
        SAY_SPECIAL2 = -1752034,
        SAY_PHASE2 = -1752035,
        SAY_PHASE3 = -1752036
};

enum eHalionSpells
{
        SPELL_ROOT = 42716,
		SPELL_TWILIGHT_PRECISION = 78243,
		SPELL_CLEAVE = 74524,
		SPELL_TAILLASH = 74531,
		SPELL_METEORSTRIKE = 75877,
		SPELL_METEORSTRIKE_VISUAL = 74641,
		SPELL_METEORSTRIKE_FLAME = 74713,
		SPELL_FLAMEBREATH = 74525,
                SPELL_FLAMEBREATH_H = 74526,
		SPELL_FIERYCOMBUSTION = 74562,
		SPELL_MARK_OF_COMBUSTION = 74567,
		SPELL_COMBUSTION_SUMMON = 74610, //should be casted on player when FIERYCOMBUSTION is removed => spell link
		SPELL_COMBUSTION = 74629,
		SPELL_COMBUSTION_KNOCKBACK = 74607, //should be cast on self by player => spell link
        SPELL_BERSERK = 26662,
		SPELL_DARKBREATH = 74806,
                SPELL_DARKBREATH_H = 75954,
		SPELL_DUSK_SHROUD = 75476,
		SPELL_SOULCONSUMPTION = 74792,
		SPELL_MARK_OF_CONSUMPTION = 74795,
		SPELL_CONSUMPTION = 74803,
		SPELL_SOULCONSUMPTION_VISUAL = 74799,
		SPELL_CONSUMPTION_SUMMON = 74800, //should be casted on player when SOULCONSUMPTION is removed => spell link
		SPELL_TWILIGHT_DIVISION = 75063,
		SPELL_SUMMON_PORTAL = 74809,
		SPELL_PHASE2 = 74808,
		SPELL_TWILIGHT_AURA = 74807,
		//CORPOREALITY
		SPELL_CORPOREALITY_EVEN = 74826, // Deals & receives normal damage
		SPELL_CORPOREALITY_20I = 74827, // Damage dealt increased by 15% & Damage taken increased by 20%
		SPELL_CORPOREALITY_40I = 74828, // Damage dealt increased by 30% & Damage taken increased by 50%
		SPELL_CORPOREALITY_60I = 74829, // Damage dealt increased by 60% & Damage taken increased by 100%
		SPELL_CORPOREALITY_80I = 74830, // Damage dealt increased by 100% & Damage taken increased by 200%
		SPELL_CORPOREALITY_100I = 74831, // Damage dealt increased by 200% & Damage taken increased by 400%
		SPELL_CORPOREALITY_20D = 74832, // Damage dealt reduced by 10% & Damage taken reduced by 15%
		SPELL_CORPOREALITY_40D = 74833, // Damage dealt reduced by 20% & Damage taken reduced by 30%
		SPELL_CORPOREALITY_60D = 74834, // Damage dealt reduced by 30% & Damage taken reduced by 50%
		SPELL_CORPOREALITY_80D = 74835, // Damage dealt reduced by 50% & Damage taken reduced by 80%
		SPELL_CORPOREALITY_100D = 74836, // Damage dealt reduced by 70% & Damage taken reduced by 100%
};

enum NPCs
{
		NPC_METEOR_STRIKE = 40055,
		NPC_COMBUSTION = 40001,
		NPC_CONSUMPTION = 40135,
		NPC_METEOR_FLAME = 40044,
		NPC_SHADOW_PULSAR = 40083,
};

enum GameObjects
{
		PhysicalRealmPortal = 202795,
};

Creature* pHalion;
Creature* pHalionTwilight;
uint8 Phase;

class boss_halion : public CreatureScript
{
public:
    boss_halion() : CreatureScript("boss_halion") { }

    struct boss_halionAI : public ScriptedAI
    {
            boss_halionAI(Creature *pCreature) : ScriptedAI(pCreature)
            {
                pInstance = me->GetInstanceScript();
    			pHalion = me;
            }

            InstanceScript* pInstance;

            uint32 m_uiFieryCombustionTimer;
            uint32 m_uiMeteorStrikeTimer;
            uint32 m_uiFlameBreathTimer;
            uint32 m_uiBerserkTimer;
            uint32 m_uiTailLashTimer;
    		uint32 m_uiCleaveTimer;
    		uint32 CombustionTick;
    		uint32 dps_last;
    		uint32 damage_count;
    		uint32 check_Timer;

            bool bIntro;
            bool isMode25;

            void Reset()
            {
                    m_uiFieryCombustionTimer = 15000;
                    m_uiMeteorStrikeTimer = 30000;
                    m_uiFlameBreathTimer = 20000;
                    m_uiBerserkTimer = RAID_MODE(480000,600000,480000,600000);
                    m_uiTailLashTimer = 10000;
    				m_uiCleaveTimer = 15000;
    				CombustionTick = 9999999;
    				Phase = 1;
    				dps_last = 0;
    				damage_count = 0;
    				check_Timer = 5000;
    				
    				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
    				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                
                    if(pInstance->instance->GetDifficulty() == RAID_DIFFICULTY_10MAN_NORMAL)
                            isMode25 = false;
                    else
                            isMode25 = true;

                    bIntro = false;
            }
    		
    		void MoveInLineOfSight(Unit *who)
    		{
    			me->SummonGameObject(203007, 3154.56, 535.418, 72.8889, 4.47206, 0, 0, 0.786772, -0.617243, 300);     
    		}

            void EnterCombat(Unit*)
            {
                    pInstance->SetData(DATA_HALION_EVENT, IN_PROGRESS);
    				DoCast(me, SPELL_TWILIGHT_PRECISION);
    				pHalionTwilight->SetInCombatWithZone();          
                    DoScriptText(SAY_AGGRO, me);
            }
    		
    		void FieryCombustion()
    		{
    			uint32 count = RAID_MODE(1,2,1,2);
    			for ( uint8 i = 1; i<=count; i++ )
    			{
    				Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0);
    				if (pTarget && !pTarget->HasAura(SPELL_FIERYCOMBUSTION))
    				{
    					DoCast(pTarget, SPELL_FIERYCOMBUSTION);
    				}
    			}
    		}
    		
    		void CombustionMark()
    		{
    			Map* pMap = me->GetMap();
    			Map::PlayerList const &PlayerList = pMap->GetPlayers();
    			for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
    				if (Player* i_pl = i->getSource())
    					if (i_pl->isAlive() && i_pl->HasAura(SPELL_FIERYCOMBUSTION))
    						DoCast(i_pl, SPELL_MARK_OF_COMBUSTION);						
    		}
    		
    		void MeteorStrike()
    		{
    			Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0);
    			if (pTarget)
    				me->SummonCreature(NPC_METEOR_STRIKE, pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 999999);
    		}
    		
    		void UpdateDps()
    		{
    			uint32 new_dps = damage_count / 5;
    			dps_last = new_dps;
    			damage_count = 0;
    		}

            void UpdateAI(const uint32 diff)
            {
                if(!bIntro)
                    if((pInstance->GetData(DATA_BALTHARUS_EVENT) == DONE && pInstance->GetData(DATA_ZARITHRIAN_EVENT) == DONE && pInstance->GetData(DATA_RAGEFIRE_EVENT) == DONE) || (pInstance->instance->GetDifficulty() == RAID_DIFFICULTY_10MAN_HEROIC || pInstance->instance->GetDifficulty() == RAID_DIFFICULTY_25MAN_HEROIC))
                        {
                            DoScriptText(SAY_SPAWN, me);
                            bIntro = true;
                        }

                if(!UpdateVictim())
                    return;

    			if (m_uiBerserkTimer <= diff)
    			{
    				DoCast(me, SPELL_BERSERK);
    				DoScriptText(SAY_BERSERK, me);
    				m_uiBerserkTimer = 9999999;
    			} else m_uiBerserkTimer -= diff;
    			
    			if (m_uiCleaveTimer <= diff)
    			{
    				DoCast(me, SPELL_CLEAVE);
    				m_uiCleaveTimer = 15000;
    			} else m_uiCleaveTimer -= diff;
    			
    			if (m_uiTailLashTimer <= diff)
    			{
    				DoCast(me, SPELL_TAILLASH);
    				m_uiTailLashTimer = 10000;
    			} else m_uiTailLashTimer -= diff;
    			
    			if (m_uiFlameBreathTimer <= diff)
    			{
    				DoCast(me, RAID_MODE(SPELL_FLAMEBREATH, SPELL_FLAMEBREATH, SPELL_FLAMEBREATH_H, SPELL_FLAMEBREATH_H));
    				m_uiFlameBreathTimer = 20000;
    			} else m_uiFlameBreathTimer -= diff;
    			
    			if (m_uiFieryCombustionTimer <= diff)
    			{
    				FieryCombustion();
    				m_uiFieryCombustionTimer = 15000;
    				CombustionTick = 2000;
    			} else m_uiFieryCombustionTimer -= diff;
    			
    			if (CombustionTick <= diff)
    			{
    				CombustionMark();
    				CombustionTick = 2000;
    			} else CombustionTick -= diff;
    			
    			if (m_uiMeteorStrikeTimer <= diff)
    			{
    				MeteorStrike();
    				m_uiMeteorStrikeTimer = 30000;
    			} else m_uiMeteorStrikeTimer -= diff;
    			
    			if ((me->GetHealth()*100) / me->GetMaxHealth() <= 75)
    			{
    				Phase = 2;
    				DoScriptText(SAY_PHASE2, me);
    				me->SetReactState(REACT_PASSIVE);
    				me->AttackStop();
    				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
    				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
    				DoCast(me, SPELL_PHASE2);
    				DoCast(me, SPELL_SUMMON_PORTAL);
    			}
    			
    			if ((me->GetHealth()*100) / me->GetMaxHealth() <= 50)
    			{
    				Phase = 3;
    				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
    				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
    				me->RemoveAura(SPELL_PHASE2);
    				me->SetReactState(REACT_AGGRESSIVE);
    			}
                
                DoMeleeAttackIfReady();
            }

            void JustDied(Unit*)
            {
                    if(pHalionTwilight->isAlive())
                        pHalionTwilight->DealDamage(pHalionTwilight, pHalionTwilight->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
    				pInstance->SetData(DATA_HALION_EVENT, DONE);
                    DoScriptText(SAY_DEATH, me);
            }

            void KilledUnit(Unit*)
            {
                    DoScriptText(RAND(SAY_SLAY1, SAY_SLAY2), me);
            }

            void EnterEvadeMode()
            {
                    pInstance->SetData(DATA_HALION, NOT_STARTED);
            }
    		
    		void DamageTaken(Unit *who, uint32 &dmg)
    		{
    			if(who->GetGUID() == me->GetGUID())
    				return;

    			damage_count += dmg;	
    		}
    };

    CreatureAI* GetAI(Creature *pCreature) const
    {
            return new boss_halionAI(pCreature);
    }

};


class boss_twilight_halion : public CreatureScript
{
public:
    boss_twilight_halion() : CreatureScript("boss_twilight_halion") { }

    struct boss_twilight_halionAI : public ScriptedAI
    {
            boss_twilight_halionAI(Creature *pCreature) : ScriptedAI(pCreature)
            {
                pInstance = me->GetInstanceScript();
    			pHalionTwilight = me;
            }

            InstanceScript* pInstance;
    		
    		uint32 m_uiSoulConsumptionTimer;
            uint32 m_uiDarkBreathTimer;
            uint32 m_uiBerserkTimer;
            uint32 m_uiTailLashTimer;
    		uint32 m_uiCleaveTimer;
    		uint32 ConsumptionTick;
    		uint32 dps_last;
    		uint32 damage_count;
    		uint32 check_Timer;
    		
    		void Reset()
    		{
    			m_uiSoulConsumptionTimer = 15000;
    			m_uiDarkBreathTimer = 20000;
    			m_uiTailLashTimer = 10000;
    			m_uiCleaveTimer = 15000;
    			ConsumptionTick = 9999999;
    			m_uiBerserkTimer = RAID_MODE(480000,600000,480000,600000);
    			dps_last = 0;
    			damage_count = 0;
    			check_Timer = 5000;
    			me->SummonGameObject(203624, 3154.56, 535.418, 72.8889, 4.47206, 0, 0, 0.786772, -0.617243, 300);
    			
    			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
    			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
    			
    			me->SetReactState(REACT_PASSIVE);
    			me->AttackStop();
    		}
    		
    		void SoulConsumption()
    		{
    			uint32 count = RAID_MODE(1,2,1,2);
    			for ( uint8 i = 1; i<=count; i++ )
    			{
    				Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0);
    				if (pTarget && !pTarget->HasAura(SPELL_SOULCONSUMPTION))
    				{
    					DoCast(pTarget, SPELL_SOULCONSUMPTION);
    				}
    			}
    		}
    		
    		void ConsumptionMark()
    		{
    			Map* pMap = me->GetMap();
    			Map::PlayerList const &PlayerList = pMap->GetPlayers();
    			for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
    				if (Player* i_pl = i->getSource())
    					if (i_pl->isAlive() && i_pl->HasAura(SPELL_SOULCONSUMPTION))
    						DoCast(i_pl, SPELL_MARK_OF_CONSUMPTION);						
    		}

    		 void UpdateDps()
    		{
    			uint32 new_dps = damage_count / 5;
    			dps_last = new_dps;
    			damage_count = 0;
    		}
    		
            void UpdateAI(const uint32 diff)
            {
                if(!UpdateVictim())
                    return;
    			
    			if ((me->GetHealth()*100) / me->GetMaxHealth() <= 75)
    			{
    				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
    				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
    				DoCast(me, SPELL_TWILIGHT_PRECISION);
    				DoCast(me, SPELL_DUSK_SHROUD);
    				me->SetReactState(REACT_AGGRESSIVE);			
    			}
    			
    			if (m_uiBerserkTimer <= diff)
    			{
    				DoCast(me, SPELL_BERSERK);
    				DoScriptText(SAY_BERSERK, me);
    				m_uiBerserkTimer = 9999999;
    			} else m_uiBerserkTimer -= diff;
    			
    			if (m_uiCleaveTimer <= diff)
    			{
    				DoCast(me, SPELL_CLEAVE);
    				m_uiCleaveTimer = 15000;
    			} else m_uiCleaveTimer -= diff;
    			
    			if (m_uiTailLashTimer <= diff)
    			{
    				DoCast(me, SPELL_TAILLASH);
    				m_uiTailLashTimer = 10000;
    			} else m_uiTailLashTimer -= diff;
    			
    			if (m_uiDarkBreathTimer <= diff)
    			{
    				DoCast(me, RAID_MODE(SPELL_DARKBREATH, SPELL_DARKBREATH, SPELL_DARKBREATH_H, SPELL_DARKBREATH_H));
    				m_uiDarkBreathTimer = 20000;
    			} else m_uiDarkBreathTimer -= diff;
    			
    			if (m_uiSoulConsumptionTimer <= diff)
    			{
    				SoulConsumption();
    				m_uiSoulConsumptionTimer = 15000;
    				ConsumptionTick = 2000;
    			} else m_uiSoulConsumptionTimer -= diff;
    			
    			if (ConsumptionTick <= diff)
    			{
    				ConsumptionMark();
    				ConsumptionTick = 2000;
    			} else ConsumptionTick -= diff;
    					
    			if ((me->GetHealth()*100) / me->GetMaxHealth() <= 50)
    			{
    				DoCast(me, SPELL_TWILIGHT_DIVISION);
    				me->SummonGameObject(202795, 3173.488, 513.578, 72.88, 4.47206, 0, 0, 0, 0, 0);   
    				me->SummonGameObject(202795, 3131.944, 551.508, 72.88, 4.47206, 0, 0, 0, 0, 0);   
    			}
    					
    			if (check_Timer < diff)
    			{
    				UpdateDps();
    				uint32 multiple = 0;
    				if (pHalion)
    				{
    					CAST_AI(boss_halion::boss_halionAI, pHalion->AI())->UpdateDps();
    					uint32 pHalion_dps = CAST_AI(boss_halion::boss_halionAI, pHalion->AI())->dps_last;
    					uint32 dpstotal = pHalion_dps + dps_last;
    					float dpspercent = pHalion_dps / dpstotal * 100;
    					if ( dpspercent<5 ) 
    					{
    						pHalion->CastSpell(pHalion, SPELL_CORPOREALITY_100D, true);
    						DoCast(me, SPELL_CORPOREALITY_100I);
    					}
    					else
    					if ( dpspercent<15 ) 
    					{
    						pHalion->CastSpell(pHalion, SPELL_CORPOREALITY_80D, true);
    						DoCast(me, SPELL_CORPOREALITY_80I);
    					}
    					else
    					if ( dpspercent<25 ) 
    					{
    						pHalion->CastSpell(pHalion, SPELL_CORPOREALITY_60D, true);
    						DoCast(me, SPELL_CORPOREALITY_60I);
    					}
    					else
    					if ( dpspercent<35 ) 
    					{
    						pHalion->CastSpell(pHalion, SPELL_CORPOREALITY_40D, true);
    						DoCast(me, SPELL_CORPOREALITY_40I);
    					}
    					else
    					if ( dpspercent<45 ) 
    					{
    						pHalion->CastSpell(pHalion, SPELL_CORPOREALITY_20D, true);
    						DoCast(me, SPELL_CORPOREALITY_20I);
    					}
    					else
    					if ( dpspercent<55 ) 
    					{
    						pHalion->CastSpell(pHalion, SPELL_CORPOREALITY_EVEN, true);
    						DoCast(me, SPELL_CORPOREALITY_EVEN);
    					}
    					else
    					if ( dpspercent<65 ) 
    					{
    						pHalion->CastSpell(pHalion, SPELL_CORPOREALITY_20I, true);
    						DoCast(me, SPELL_CORPOREALITY_20D);
    					}
    					else
    					if ( dpspercent<75 ) 
    					{
    						pHalion->CastSpell(pHalion, SPELL_CORPOREALITY_40I, true);
    						DoCast(me, SPELL_CORPOREALITY_40D);
    					}
    					else
    					if ( dpspercent<85 ) 
    					{
    						pHalion->CastSpell(pHalion, SPELL_CORPOREALITY_60I, true);
    						DoCast(me, SPELL_CORPOREALITY_60D);
    					}
    					else
    					if ( dpspercent<95 ) 
    					{
    						pHalion->CastSpell(pHalion, SPELL_CORPOREALITY_80I, true);
    						DoCast(me, SPELL_CORPOREALITY_80D);
    					}
    					else
    					{
    						pHalion->CastSpell(pHalion, SPELL_CORPOREALITY_100I, true);
    						DoCast(me, SPELL_CORPOREALITY_100D);
    					}
    				}
    				check_Timer = 5000;
    			} else check_Timer -= diff;
    			
                DoMeleeAttackIfReady();
            }
    		
    		void JustDied(Unit*)
            {
                    if(pHalion->isAlive())
                        pHalion->DealDamage(pHalion, pHalion->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
    				pInstance->SetData(DATA_HALION_EVENT, DONE);
                    DoScriptText(SAY_DEATH, me);
            }

            void KilledUnit(Unit*)
            {
                    DoScriptText(RAND(SAY_SLAY1, SAY_SLAY2), me);
            }

            void EnterEvadeMode()
            {
                    pInstance->SetData(DATA_HALION, NOT_STARTED);
            }
    		
    		void DamageTaken(Unit *who, uint32 &dmg)
    		{
    			if(who->GetGUID() == me->GetGUID())
    				return;

    			damage_count += dmg;	
    			
    			if(pInstance)
    			{
    				if(pHalion->isAlive())
    					pHalion->SetHealth(pHalion->GetHealth() > dmg ? pHalion->GetHealth()-dmg : 1);
    			}
    		}
    };

    CreatureAI* GetAI(Creature *pCreature) const
    {
            return new boss_twilight_halionAI(pCreature);
    }

};


class npc_meteor_strike : public CreatureScript
{
public:
    npc_meteor_strike() : CreatureScript("npc_meteor_strike") { }

    struct npc_meteor_strikeAI : public ScriptedAI
    {
            npc_meteor_strikeAI(Creature *pCreature) : ScriptedAI(pCreature)
            {
                pInstance = me->GetInstanceScript();
            }

            InstanceScript* pInstance;
    		uint32 BlastTimer;

    		void Reset()
    		{
    			me->SetReactState(REACT_PASSIVE);
    			if (!me->HasAura(SPELL_ROOT))
    				DoCast(me, SPELL_ROOT);
    			BlastTimer = 4000;
    			if (!me->HasAura(SPELL_METEORSTRIKE_VISUAL))
    				DoCast(me, SPELL_METEORSTRIKE_VISUAL);
    		}
    		
    		void JustDied(Unit *killer)
    		{
    			me->RemoveAura(SPELL_METEORSTRIKE_VISUAL);
    		}
    		
            void UpdateAI(const uint32 diff)
            {
                if(!UpdateVictim())
                    return;
    				
    			if (BlastTimer <= diff)
    			{
    				DoCast(me, SPELL_METEORSTRIKE);
    				
    				me->SummonCreature(NPC_METEOR_FLAME, me->GetPositionX()+20, me->GetPositionY()+20, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 8000);
                    me->SummonCreature(NPC_METEOR_FLAME, me->GetPositionX()-20, me->GetPositionY()-20, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 8000);
                    me->SummonCreature(NPC_METEOR_FLAME, me->GetPositionX()+20, me->GetPositionY()-20, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 8000);
                    me->SummonCreature(NPC_METEOR_FLAME, me->GetPositionX()-20, me->GetPositionY()+20, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 8000);
    				
    				me->ForcedDespawn();
    			} else BlastTimer -= diff;

                DoMeleeAttackIfReady();
            }
    };

    CreatureAI* GetAI(Creature *pCreature) const
    {
            return new npc_meteor_strikeAI(pCreature);
    }

};


class npc_meteor_flame : public CreatureScript
{
public:
    npc_meteor_flame() : CreatureScript("npc_meteor_flame") { }

    struct npc_meteor_flameAI : public ScriptedAI
    {
        npc_meteor_flameAI(Creature *pCreature) : ScriptedAI(pCreature)
        {
            m_pInstance = pCreature->GetInstanceScript();
        }
        InstanceScript* m_pInstance;
        uint32 m_uiColdFlameTimer;
        uint32 m_uiColdDespawn;
        void Reset()
        {
            float x, y, z;
            me->GetNearPoint(me, x, y, z, 1, 50, M_PI*2*rand_norm());
            me->GetMotionMaster()->MovePoint(0, x, y, z);
    		DoCast(me, SPELL_METEORSTRIKE_FLAME);
            me->SetReactState(REACT_PASSIVE);
            me->SetSpeed(MOVE_WALK, 1.0f, true);
            m_uiColdDespawn = 9000;
            m_uiColdFlameTimer = 1000;
        }
        void UpdateAI(const uint32 diff)
        {
            if(m_uiColdFlameTimer <= diff)
            {
                DoCast(me, SPELL_METEORSTRIKE_FLAME);
                m_uiColdFlameTimer = 1000;
            } else m_uiColdFlameTimer -= diff;

            if(m_uiColdDespawn <= diff)
            {
                //DoCast(me, SPELL_COLD_DESPAWN);
                me->ForcedDespawn();
            } m_uiColdDespawn -= diff;
        }
    };

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_meteor_flameAI(pCreature);
    }

};


class npc_combustion : public CreatureScript
{
public:
    npc_combustion() : CreatureScript("npc_combustion") { }

    struct npc_combustionAI : public ScriptedAI
    {
            npc_combustionAI(Creature *pCreature) : ScriptedAI(pCreature)
            {
                pInstance = me->GetInstanceScript();
            }

            InstanceScript* pInstance;
    		
    		uint32 Duration;

    		void Reset()
    		{
    			Duration = 10000;
    			
    			me->SetReactState(REACT_PASSIVE);
    			if (!me->HasAura(SPELL_ROOT))
    				DoCast(me, SPELL_ROOT);
    			if (!me->HasAura(SPELL_COMBUSTION))
    				DoCast(me, SPELL_COMBUSTION);
    		}
    		
    		void JustDied(Unit *killer)
    		{
    			me->RemoveAura(SPELL_COMBUSTION);
    		}
    		
            void UpdateAI(const uint32 diff)
            {
                if(!UpdateVictim())
                    return;
    				
    			if (Duration <= diff)
    			{
    				me->ForcedDespawn();
    			} else Duration -= diff;

                DoMeleeAttackIfReady();
            }
    };

    CreatureAI* GetAI(Creature *pCreature) const
    {
            return new npc_combustionAI(pCreature);
    }

};


class npc_consumption : public CreatureScript
{
public:
    npc_consumption() : CreatureScript("npc_consumption") { }

    struct npc_consumptionAI : public ScriptedAI
    {
            npc_consumptionAI(Creature *pCreature) : ScriptedAI(pCreature)
            {
                pInstance = me->GetInstanceScript();
            }

            InstanceScript* pInstance;
    		
    		uint32 Duration;

    		void Reset()
    		{
    			Duration = 10000;
    			
    			me->SetReactState(REACT_PASSIVE);
    			if (!me->HasAura(SPELL_ROOT))
    				DoCast(me, SPELL_ROOT);
    			if (!me->HasAura(SPELL_CONSUMPTION))
    				DoCast(me, SPELL_CONSUMPTION);
    		}
    		
    		void JustDied(Unit *killer)
    		{
    			me->RemoveAura(SPELL_CONSUMPTION);
    		}
    		
            void UpdateAI(const uint32 diff)
            {
                if(!UpdateVictim())
                    return;
    				
    			if (Duration <= diff)
    			{
    				me->ForcedDespawn();
    			} else Duration -= diff;

                DoMeleeAttackIfReady();
            }
    };

    CreatureAI* GetAI(Creature *pCreature) const
    {
            return new npc_consumptionAI(pCreature);
    }

};


void AddSC_boss_halion()
{
    new boss_halion;
    new boss_twilight_halion;
    new npc_meteor_strike;
    new npc_combustion;
    new npc_consumption;
    new npc_meteor_flame;
}
