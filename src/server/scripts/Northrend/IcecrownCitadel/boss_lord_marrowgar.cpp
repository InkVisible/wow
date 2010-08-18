/*
* Copyright (C) 2009 - 2010 TrinityCore <http://www.trinitycore.org/>
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
*/

// Scripted by Lavi & Andu - WoW-Romania Team http://www.wow-romania.ro (if you use this script, do not remove this seal, no matter what other modification you apply to script).

#include "ScriptPCH.h"
#include "icecrown_citadel.h"

enum Yells
{
	SAY_ENTER_ZONE       =    -1665892,
	SAY_AGGRO            =    -1665893,
	SAY_BONE_STORM       =    -1665894,
	SAY_BONESPIKE_1      =    -1665895,
	SAY_BONESPIKE_2      =    -1665896,
	SAY_BONESPIKE_3      =    -1665897,
	SAY_KILL_1           =    -1665898,
	SAY_KILL_2           =    -1665899,
	SAY_DEATH            =    -1665900,
	SAY_BERSERK          =    -1665901,
};

enum Spells
{
	SPELL_SABER_SLASH_10_NORMAL          =  71021, //69055
	SPELL_SABER_SLASH_25_NORMAL          =  40816, //70814
	SPELL_SABER_SLASH_10_HEROIC          =  71021, //70814
	SPELL_SABER_SLASH_25_HEROIC          =  70814, //70814
	SPELL_COLD_FLAME_10_NORMAL           =  69145, //69146 - was the old spell - and it was the wrong one - or maybe not but lets try using this for the given situation
	SPELL_COLD_FLAME_25_NORMAL           =  69145, //
	SPELL_COLD_FLAME_10_HEROIC           =  69145,
	SPELL_COLD_FLAME_25_HEROIC           =  69145,
	SPELL_COLD_DESPAWN                   =  66346,
	SPELL_COLD_FLAME_SPAWN               =  69138,
	SPELL_BONE_SPIKE_GRAVEYARD_10_NORMAL =  69057,
	SPELL_BONE_SPIKE_GRAVEYARD_25_NORMAL =  70826,
	SPELL_BONE_SPIKE_IMPALING            =  69065,
	SPELL_BONE_STORM_CHANNEL             =  69076,
	SPELL_BONE_STORM_10_NORMAL           =  69075,
	SPELL_BONE_STORM_25_NORMAL           =  70834,
	SPELL_BONE_STORM_10_HEROIC           =  70835,
	SPELL_BONE_STORM_25_HEROIC           =  70836,
	SPELL_BONE_SHIELD                    =  70207,
	SPELL_BERSERK                        =  26662,
};

enum NPC
{
	CREATURE_BONE_SPIKE    =    38711,
	CREATURE_COLD_FLAME    =    36672,
};


class npc_bone_spike : public CreatureScript
{
public:
	npc_bone_spike() : CreatureScript("npc_bone_spike") { }

	struct npc_bone_spikeAI : public Scripted_NoMovementAI
	{
		npc_bone_spikeAI(Creature *pCreature) : Scripted_NoMovementAI(pCreature)
		{
			BoneSpikeGUID = 0;
		}

		uint64 BoneSpikeGUID;

		void SetPrisoner(Unit* uPrisoner)
		{
			BoneSpikeGUID = uPrisoner->GetGUID();
		}

		void Reset()
		{
			BoneSpikeGUID = 0;
		}

		void JustDied(Unit *killer)
		{
			if (killer->GetGUID() != me->GetGUID())

				if (BoneSpikeGUID)
				{
					Unit* Bone = Unit::GetUnit((*me), BoneSpikeGUID);
					if (Bone)
						Bone->RemoveAurasDueToSpell(SPELL_BONE_SPIKE_IMPALING);
				}
		}

		void KilledUnit(Unit *pVictim)
		{
			if (pVictim->GetGUID() != me->GetGUID())

				if (BoneSpikeGUID)
				{
					Unit* Bone = Unit::GetUnit((*me), BoneSpikeGUID);
					if (Bone)
						Bone->RemoveAurasDueToSpell(SPELL_BONE_SPIKE_IMPALING);
				}
		}

		void UpdateAI(const uint32 diff)
		{
			Unit* temp = Unit::GetUnit((*me),BoneSpikeGUID);
			if ((temp && temp->isAlive() && !temp->HasAura(SPELL_BONE_SPIKE_IMPALING)) || !temp)
				me->DealDamage(me, me->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_bone_spikeAI(pCreature);
	}

};

class boss_lord_marrowgar : public CreatureScript
{
public:
	boss_lord_marrowgar() : CreatureScript("boss_lord_marrowgar") { }

	struct boss_lord_marrowgarAI : public ScriptedAI
	{
		boss_lord_marrowgarAI(Creature *pCreature) : ScriptedAI(pCreature)
		{
			pInstance = pCreature->GetInstanceScript();
		}

		InstanceScript* pInstance;

		uint32 m_uiSaberSlashTimer;
		uint32 m_uiBoneSpikeGraveyardTimer;
		uint32 m_uiBoneStormChanelTimer;
		uint32 m_uiBoneStormTimer;
		uint32 m_uiBoneStormRemoveTimer;
		uint32 m_uiColdFlameTimer;
		uint32 m_uiBerserkTimer;
		uint32 m_uiMove;

		bool Intro;

		void Reset()
		{
			m_uiSaberSlashTimer = 6000;
			m_uiBoneSpikeGraveyardTimer  = 15000;
			m_uiColdFlameTimer  = 15000;
			m_uiBoneStormChanelTimer = 45000;
			m_uiBoneStormTimer = 1500;
			m_uiBoneStormRemoveTimer = 20000;
			m_uiBerserkTimer = 600000;

			me->SetSpeed(MOVE_RUN, 2.5f, true);
			me->SetSpeed(MOVE_WALK, 1.8f, true);

			Intro = false;

			if (pInstance)
				pInstance->SetData(DATA_MARROWGAR_EVENT, NOT_STARTED);
		}

		void EnterCombat(Unit* who)
		{
			DoScriptText(SAY_AGGRO, me);

			if (pInstance)
				pInstance->SetData(DATA_MARROWGAR_EVENT, IN_PROGRESS);
		}

		void JustDied(Unit* killer)
		{
			DoScriptText(SAY_DEATH, me);

			if (pInstance)
				pInstance->SetData(DATA_MARROWGAR_EVENT, DONE);
		}

		void JustReachedHome()
		{
			if(pInstance)
				pInstance->SetData(DATA_MARROWGAR_EVENT, FAIL);
		}

		void KilledUnit(Unit *victim)
		{
			DoScriptText(RAND(SAY_KILL_1,SAY_KILL_2), me);
		}

		void MoveInLineOfSight(Unit *who)
		{
			if (!Intro && me->IsWithinDistInMap(who,60.0f))
			{
				DoScriptText(SAY_ENTER_ZONE, me);
				Intro = true;
			}

			ScriptedAI::MoveInLineOfSight(who);
		}

		void boneStormDamage()
		{
			uint32 absorb = 0;
			uint32 resist = 0;
			uint32 damage = 0;

			Map* pMap = me->GetMap();
			if (pMap && pMap->IsDungeon())
			{
				Map::PlayerList const &PlayerList = pMap->GetPlayers();
				for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
				{
					//check if target is allive
					if (i->getSource() && i->getSource()->isAlive())
					{
						//target is closer than 4 yards
						if (i->getSource()->GetDistance2d(me) <= 4)
							damage = RAID_MODE(8000, 12000, 10500, 14000);

						//target is closer than 8 yards but at least 4 yards away
						if (i->getSource()->GetDistance2d(me) <= 8 && i->getSource()->GetDistance2d(me) > 4)
							damage = RAID_MODE(7000, 10000, 9500, 12000);

						//target is closer than 12 yards but at least 8 yards away
						if (i->getSource()->GetDistance2d(me) <= 12 && i->getSource()->GetDistance2d(me) > 8)
							damage = RAID_MODE(6000, 8000, 7500, 10000);
					}

					//checking if damage should be deald
					if (i->getSource()->GetDistance2d(me) <= 12)
					{            
						//calculating the amount of absorbed and rested damage
						i->getSource()->CalcAbsorbResist(i->getSource(),SPELL_SCHOOL_MASK_NORMAL, SPELL_DIRECT_DAMAGE, damage, &absorb, &resist);
						//generating new amount of damage that should be given to target
						damage -= (absorb + resist);
						/*check if damage is less than 1 
						( but i think this is not correct, 
						becouse it should be possible to doge / parry, 
						so it must be possible to get 0 damage even if you are in the 4 yard range)
						needs more test and review
						*/
						if (damage <= 1)
							damage = 1;

						//deal damage to target
						me->DealDamage(i->getSource(), damage, NULL, SPELL_DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
						me->SpellNonMeleeDamageLog(i->getSource(), RAID_MODE(SPELL_BONE_STORM_10_NORMAL,SPELL_BONE_STORM_25_NORMAL,SPELL_BONE_STORM_10_HEROIC,SPELL_BONE_STORM_25_HEROIC), damage);
					}
				}
			}
		}

		void UpdateAI(const uint32 uiDiff)
		{
			if (!UpdateVictim())
				return;

			if (m_uiBerserkTimer <= uiDiff)
			{
				DoScriptText(SAY_BERSERK, me);
				DoCast(SPELL_BERSERK);
				m_uiBerserkTimer = 600000;
			} else m_uiBerserkTimer -= uiDiff;

			if (getDifficulty() == RAID_DIFFICULTY_10MAN_NORMAL || getDifficulty() == RAID_DIFFICULTY_25MAN_NORMAL)
			{
				if (!me->HasAura(SPELL_BONE_STORM_CHANNEL))
				{
					if (m_uiBoneSpikeGraveyardTimer < uiDiff)
					{
						DoScriptText(RAND(SAY_BONESPIKE_1,SAY_BONESPIKE_2,SAY_BONESPIKE_3), me);
						uint32 count = RAID_MODE(1,3,1,3);
						for (uint8 i = 1; i <= count; i++)
						{
							Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 200, true);
							if (pTarget && !pTarget->HasAura(SPELL_BONE_SPIKE_IMPALING))
							{
								Creature* Bone = me->SummonCreature(CREATURE_BONE_SPIKE, pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 999999);
								CAST_AI(npc_bone_spike::npc_bone_spikeAI, Bone->AI())->SetPrisoner(pTarget);
								Bone->CastSpell(pTarget, SPELL_BONE_SPIKE_IMPALING, true);
							}
						}
						m_uiBoneSpikeGraveyardTimer = 15000;
					} else m_uiBoneSpikeGraveyardTimer -= uiDiff;

					if (m_uiColdFlameTimer <= uiDiff)
					{
						me->SummonCreature(CREATURE_COLD_FLAME, me->GetPositionX()+20, me->GetPositionY()+20, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 8000);
						me->SummonCreature(CREATURE_COLD_FLAME, me->GetPositionX()-20, me->GetPositionY()-20, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 8000);
						me->SummonCreature(CREATURE_COLD_FLAME, me->GetPositionX()+20, me->GetPositionY()-20, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 8000);
						me->SummonCreature(CREATURE_COLD_FLAME, me->GetPositionX()-20, me->GetPositionY()+20, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 8000);
						m_uiColdFlameTimer = 15000;
					} else m_uiColdFlameTimer -= uiDiff;
				}
			}

			if (getDifficulty() == RAID_DIFFICULTY_10MAN_HEROIC || getDifficulty() == RAID_DIFFICULTY_25MAN_HEROIC)
			{
				if (m_uiBoneSpikeGraveyardTimer < uiDiff)
				{
					DoScriptText(RAND(SAY_BONESPIKE_1,SAY_BONESPIKE_2,SAY_BONESPIKE_3), me);
					uint32 count = RAID_MODE(1,3,1,3);
					for (uint8 i = 1; i <= count; i++)
					{
						Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 1, 200, true);
						if (pTarget && !pTarget->HasAura(SPELL_BONE_SPIKE_IMPALING))
						{
							Creature* Bone = me->SummonCreature(CREATURE_BONE_SPIKE, pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 999999);
							CAST_AI(npc_bone_spike::npc_bone_spikeAI, Bone->AI())->SetPrisoner(pTarget);
							Bone->CastSpell(pTarget, SPELL_BONE_SPIKE_IMPALING, true);
						}
					}
					m_uiBoneSpikeGraveyardTimer = 15000;
				} else m_uiBoneSpikeGraveyardTimer -= uiDiff;
			}

			if (!me->HasAura(SPELL_BONE_STORM_CHANNEL))
			{
				if (m_uiBoneStormChanelTimer <= uiDiff)
				{
					me->SetSpeed(MOVE_WALK, 0.4f, true);
					me->SetSpeed(MOVE_RUN, 0.6f, true);
					DoCast(SPELL_BONE_STORM_CHANNEL);
					DoScriptText(SAY_BONE_STORM, me);
					m_uiBoneStormChanelTimer = 45000;
					m_uiMove = 4000;
				} else m_uiBoneStormChanelTimer -= uiDiff;

				if (m_uiSaberSlashTimer <= uiDiff)
				{
					Unit* pTarget = SelectUnit(SELECT_TARGET_TOPAGGRO, 0);
					me->CastCustomSpell(RAID_MODE(SPELL_SABER_SLASH_10_NORMAL,SPELL_SABER_SLASH_25_NORMAL,SPELL_SABER_SLASH_10_HEROIC,SPELL_SABER_SLASH_10_HEROIC) , SPELLVALUE_RADIUS_MOD, 20);
					DoCast(pTarget, RAID_MODE(SPELL_SABER_SLASH_10_NORMAL,SPELL_SABER_SLASH_25_NORMAL,SPELL_SABER_SLASH_10_HEROIC,SPELL_SABER_SLASH_10_HEROIC));
					m_uiSaberSlashTimer = 9000;
				} else m_uiSaberSlashTimer -= uiDiff;

				if (me->HasAura(SPELL_BONE_STORM_CHANNEL))
				{
					if (m_uiMove <= uiDiff)
					{
						Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 1);
						me->GetMotionMaster()->MovePoint(0, pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ());
						m_uiMove = 9500;
					}
				} else m_uiMove -= uiDiff;

			}

			if (me->HasAura(SPELL_BONE_STORM_CHANNEL))
			{
				if (m_uiBoneStormTimer <= uiDiff)
				{
					boneStormDamage();
					DoCastAOE(RAID_MODE(SPELL_BONE_STORM_10_NORMAL,SPELL_BONE_STORM_25_NORMAL,SPELL_BONE_STORM_10_HEROIC,SPELL_BONE_STORM_25_HEROIC));
					m_uiBoneStormTimer = 1500;
				} else m_uiBoneStormTimer -= uiDiff;

				if (m_uiBoneStormRemoveTimer <= uiDiff)
				{
					me->RemoveAurasDueToSpell(SPELL_BONE_STORM_CHANNEL);
					m_uiBoneStormRemoveTimer = 20000;
				} else m_uiBoneStormRemoveTimer -= uiDiff;
			}

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new boss_lord_marrowgarAI(pCreature);
	}

};

class npc_cold_flame : public CreatureScript
{
public:
	npc_cold_flame() : CreatureScript("npc_cold_flame") { }

	struct npc_cold_flameAI : public ScriptedAI
	{
		npc_cold_flameAI(Creature *pCreature) : ScriptedAI(pCreature)
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
			DoCast(me,RAID_MODE(SPELL_COLD_FLAME_10_NORMAL,SPELL_COLD_FLAME_25_NORMAL,SPELL_COLD_FLAME_10_HEROIC,SPELL_COLD_FLAME_25_HEROIC));
			me->SetReactState(REACT_PASSIVE);
			me->SetSpeed(MOVE_WALK, 0.7f, true);
			m_uiColdDespawn    = RAID_MODE(4000,9000,4000,9000);
			m_uiColdFlameTimer = 1000;
		}
		void UpdateAI(const uint32 uiDiff)
		{
			if(m_uiColdFlameTimer <= uiDiff)
			{
				DoCast(me,RAID_MODE(SPELL_COLD_FLAME_10_NORMAL,SPELL_COLD_FLAME_25_NORMAL,SPELL_COLD_FLAME_10_HEROIC,SPELL_COLD_FLAME_25_HEROIC));
				m_uiColdFlameTimer = 1000;
			} else m_uiColdFlameTimer -= uiDiff;

			if(m_uiColdDespawn <= uiDiff)
			{
				DoCast(me, SPELL_COLD_DESPAWN);
				me->ForcedDespawn();
			} m_uiColdDespawn -= uiDiff;
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_cold_flameAI(pCreature);
	}

};

void AddSC_boss_marrowgar()
{
	new boss_lord_marrowgar;
	new npc_cold_flame;
	new npc_bone_spike;
}