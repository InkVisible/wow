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

// Credit to Bolvor for script. Re-scripted by Lavi & Andu - WoW-Romania Team http://www.wow-romania.ro (if you use this script, do not remove this seal, no matter what other modification you apply to script).

#include "ScriptPCH.h"
#include "icecrown_citadel.h"

enum Yells
{
	SAY_AGGRO                     = -1666063,
	SAY_BELOW_25                  = -1666066,
	SAY_ABOVE_75                  = -1666065,
	SAY_DEATH                     = -1666067,
	SAY_PDEATH                    = -1666068,
	SAY_END                       = -1666070,
	SAY_BERSERK                   = -1666069,
	SAY_OPEN_PORTAL               = -1666064,
	SVALNA_AGGRO     	      = -1900004,
	SVALNA_SLAY 		      = -1900005,
	SVALNA_DEATH 		      = -1900007,
};

enum Spells
{
	SPELL_CORRUPTION                 = 70904,
	SPELL_DREAM_SLIP                 = 71196,
	SPELL_RAGE                       = 71189,
	SPELL_VOLLEY                     = 70759,
	SPELL_COLUMN                     = 70702,
	SPELL_MANA_VOID                  = 71085,
	SPELL_CORRUPTING                 = 70602,
	SPELL_WASTE                      = 69325,
	SPELL_FIREBALL                   = 70754,
	SPELL_SUPRESSION                 = 70588,
	SPELL_CORROSION                  = 70751,
	SPELL_BURST                      = 70744,
	SPELL_SPRAY                      = 71283,
	SPELL_ROT                        = 72963,
	SPELL_DREAM_STATE                = 70766,
	SPELL_PORTAL_VISUAL              = 71304,
	SPELL_VIGOR                      = 70873,
	SPELL_CLOUD_VISUAL               = 70876,
};

enum SvalnaSpells
{
	SPELL_AETHER_BURST_10            = 71468,
	SPELL_AETHER_BURST_25            = 71469,
	SPELL_AETHER_SHIELD		 = 71463,
	SPELL_CARESS_OF_DEATH		 = 70078,
	SPELL_DIVINE_SURGE 		 = 71465,
	SPELL_IMPALING_SPEAR_KILL	 = 70196,
	SPELL_IMPALING_SPEAR		 = 71443,
	SPELL_REVIVE_CHAMPION		 = 70053,	
	SPELL_REMOVE_SPEAR		 = 71462,
};

enum Creatures
{
	CREATURE_WORM                       = 37907,
	CREATURE_PORTAL                     = 37945,
	CREATURE_CLOUD                      = 37985,
	CREATURE_VOID                       = 38068,
	CREATURE_ABOMINATION                = 37886,
	CREATURE_SKELETON                   = 36791,
	CREATURE_ARCHMAGE                   = 37868,
	CREATURE_SUPPRESSER                 = 37863,
	CREATURE_ZOMBIE                     = 37934,
	CREATURE_COMBAT_TRIGGER             = 38752,
	CREATURE_IMPALING_SPEAR 	        = 38248,
	CREATURE_SVALNA 		        = 37126,
};

const Position Pos[4] =
{
	{4166.216797f, 2564.197266f, 364.873047f},
	{4240.688477f, 2405.794678f, 364.868591f},
	{4165.112305f, 2405.872559f, 364.872925f},
	{4239.579102f, 2566.753418f, 364.868439f},

};

Unit* pValithria;
Unit* pPlayer;
Unit* pBuff;
Creature* pSvalna;

Creature* combat_trigger= NULL;

class boss_valithria : public CreatureScript
{
public:
	boss_valithria() : CreatureScript("boss_valithria") { }

	struct boss_valithriaAI : public ScriptedAI
	{
		boss_valithriaAI(Creature* pCreature) : ScriptedAI(pCreature), summons(me)
		{
			m_pInstance = pCreature->GetInstanceScript();
		}

		InstanceScript* m_pInstance;

		uint32 Phase;
		uint32 m_uiPortalTimer;
		uint32 m_uiEndTimer;
		uint32 m_uiEnd3Timer;
		uint32 m_uiSummonTimer;
		uint32 m_uiEnd2Timer;
		uint32 m_uiResetTimer;

		SummonList summons;

		bool valithria;
		bool end;
		bool ABOVEHP;
		bool BELOWHP;

		void InitializeAI()
		{
			Phase = 0;
			DoCast(SPELL_CORRUPTION);
			me->SetHealth(me->GetMaxHealth()/2);

			m_uiSummonTimer = 999999999;
			m_uiPortalTimer = 999999999;
			valithria = false;
			end = false;
			ABOVEHP = false;
			BELOWHP = false;

			ScriptedAI::InitializeAI();
		}

		void MoveInLineOfSight(Unit *who)
		{
			if (!valithria && who->IsWithinDistInMap(me, 40.0f))
			{
				DoScriptText(SAY_AGGRO, me);
				combat_trigger = me->SummonCreature(CREATURE_COMBAT_TRIGGER, me->GetPositionX(), me->GetPositionY(),me->GetPositionZ(), 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 20000);
				me->AddThreat(combat_trigger, 10000000.0f);
				combat_trigger->AddThreat(me, 10000000.0f);
				me->AI()->AttackStart(combat_trigger);
				combat_trigger->AI()->AttackStart(me);
				end = false;
				valithria = true;
				ABOVEHP = false;
				BELOWHP = false;

				ScriptedAI::MoveInLineOfSight(who);
			}
		}

		void EnterCombat(Unit *who)
		{
			me->SetHealth(me->GetMaxHealth() * 0.50);
			m_uiSummonTimer = 20000;
			m_uiPortalTimer = 30000;
			Phase = 1;
		}

		void JustSummoned(Creature* pSummoned)
		{
			if (pSummoned && !pSummoned->HasAura(SPELL_PORTAL_VISUAL))
				pSummoned->AI()->AttackStart(me);
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (!m_pInstance || m_pInstance->GetData(DATA_VALITHRIA_DREAMWALKER_EVENT) != IN_PROGRESS)
				summons.DespawnAll();

			if (m_uiResetTimer <= diff)
			{
				if (me->GetDistance2d(me->GetHomePosition().GetPositionX(), me->GetHomePosition().GetPositionY()) > 90)
					EnterEvadeMode();
				m_uiResetTimer = 5000;
			} else m_uiResetTimer -= diff;


			if (Phase == 1)
			{
				DoStartNoMovement(me->getVictim());
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
				m_uiEndTimer = 999999999;

				if (m_uiSummonTimer <= diff)
				{
					if (getDifficulty() == RAID_DIFFICULTY_10MAN_NORMAL || getDifficulty() == RAID_DIFFICULTY_10MAN_HEROIC)
					{
						DoSummon(CREATURE_ZOMBIE, Pos[RAND(0,4)]);
						DoSummon(CREATURE_SKELETON, Pos[RAND(0,4)]);
						DoSummon(CREATURE_ARCHMAGE, Pos[RAND(0,4)]);
						DoSummon(CREATURE_SUPPRESSER, Pos[RAND(0,4)]);
						DoSummon(CREATURE_ABOMINATION, Pos[RAND(0,4)]);
					}

					if (getDifficulty() == RAID_DIFFICULTY_25MAN_NORMAL || getDifficulty() == RAID_DIFFICULTY_25MAN_HEROIC)
					{
						DoSummon(CREATURE_ZOMBIE, Pos[RAND(0,1,2,3)]);
						DoSummon(CREATURE_SKELETON, Pos[RAND(0,1,2,3)]);
						DoSummon(CREATURE_ARCHMAGE, Pos[RAND(0,1,2,3)]);
						DoSummon(CREATURE_SUPPRESSER, Pos[RAND(0,1,2,3)]);
						DoSummon(CREATURE_ABOMINATION, Pos[RAND(0,1,2,3)]);
					}

					m_uiSummonTimer = 28000;
				} else m_uiSummonTimer -= diff;

				if (m_uiPortalTimer <= diff)
				{
					DoScriptText(SAY_OPEN_PORTAL, me);
					me->SummonCreature(CREATURE_PORTAL, me->GetPositionX()+15, me->GetPositionY()+15, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 15000);
					me->SummonCreature(CREATURE_PORTAL, me->GetPositionX()+10, me->GetPositionY()+25, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 15000);
					me->SummonCreature(CREATURE_PORTAL, me->GetPositionX()+15, me->GetPositionY()-25, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 15000);
					m_uiPortalTimer = 30000;
				} else m_uiPortalTimer -= diff;

				if (!ABOVEHP && (me->GetHealth()*100 / me->GetMaxHealth()) > 75)
				{
					DoScriptText(SAY_ABOVE_75, me);
					ABOVEHP = true;
				}

				if (!BELOWHP && (me->GetHealth()*100 / me->GetMaxHealth()) < 25)
				{
					DoScriptText(SAY_BELOW_25, me);
					BELOWHP = true;
				}

				if ((me->GetHealth()*100 / me->GetMaxHealth()) > 99)
				{
					Phase = 2;
					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
					me->RemoveAurasDueToSpell(SPELL_CORRUPTION);
					end = true;
				}


				if ((me->GetHealth()*100 / me->GetMaxHealth()) > 2)
				{
					Phase = 4;
					m_uiEndTimer = 2000;
					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
					me->SetReactState(REACT_PASSIVE);
					me->RemoveAurasDueToSpell(SPELL_CORRUPTION);
				}
			}

			if (Phase == 2)
			{
				Phase = 3;
				m_uiEnd2Timer = 1000;
				m_uiEnd3Timer = 8000;
				DoScriptText(SAY_END, me);
			}

			if (Phase == 4)
			{
				if (m_uiEndTimer <= diff)
				{
					Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0);
					if(pTarget && !pTarget->IsFriendlyTo(me))
					{
						DoScriptText(SAY_BERSERK , me);
						DoCast(pTarget, SPELL_RAGE);
					}
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
					m_uiEndTimer = 50000;
				} else m_uiEndTimer -= diff;
			}

			if (Phase == 3)
			{
				if (m_uiEnd2Timer <= diff)
				{
					combat_trigger->ForcedDespawn();
					me->CastSpell(me, SPELL_DREAM_SLIP, true, 0, 0, 0);
					m_uiEnd2Timer = 50000;
				} else m_uiEnd2Timer -= diff;

				if (m_uiEnd3Timer <= diff)
				{
					Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0);
					if(pTarget && !pTarget->IsFriendlyTo(me))
					{
						DoCast(pTarget, SPELL_RAGE);
					}
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
					m_uiEnd3Timer = 50000;
				} else m_uiEnd3Timer -= diff;
			}

			if (me->HasAura(SPELL_DREAM_SLIP))
			{
				me->ForcedDespawn();

				if (m_pInstance)
					m_pInstance->SetData(DATA_VALITHRIA_DREAMWALKER_EVENT, DONE);
			}
		}

		void JustDied(Unit* killer)
		{
			DoScriptText(SAY_DEATH, me);

			if (m_pInstance)
				m_pInstance->SetData(DATA_VALITHRIA_DREAMWALKER_EVENT, FAIL);
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new boss_valithriaAI (pCreature);
	}

};

class npc_dreamportal_icc : public CreatureScript
{
public:
	npc_dreamportal_icc() : CreatureScript("npc_dreamportal_icc") { }

	struct npc_dreamportal_iccAI : public ScriptedAI
	{
		npc_dreamportal_iccAI(Creature* pCreature) : ScriptedAI(pCreature)
		{
			m_pInstance = pCreature->GetInstanceScript();
		}

		InstanceScript* m_pInstance;

		uint32 m_uiStateTimer;

		void InitializeAI()
		{
			DoCast(SPELL_PORTAL_VISUAL);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);

			ScriptedAI::InitializeAI();
		}

		void MoveInLineOfSight(Unit *who)
		{
			if (who->IsControlledByPlayer())
			{
				if (me->IsWithinDistInMap(who,5.0f))
				{
					pPlayer = who;
					pPlayer->CastSpell(pPlayer, SPELL_DREAM_STATE, false, 0, 0, 0);
					pPlayer->AddUnitMovementFlag(MOVEMENTFLAG_FLYING);
					pPlayer->SendMovementFlagUpdate();
					m_uiStateTimer = 15000;
					me->ForcedDespawn();
				}
			}
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (m_uiStateTimer <= diff)
			{
				pPlayer->RemoveAurasDueToSpell(SPELL_DREAM_STATE);
				pPlayer->RemoveUnitMovementFlag(MOVEMENTFLAG_FLYING);
				pPlayer->SendMovementFlagUpdate();
			} else m_uiStateTimer -= diff;
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_dreamportal_iccAI (pCreature);
	}

};

class npc_skellmage_icc : public CreatureScript
{
public:
	npc_skellmage_icc() : CreatureScript("npc_skellmage_icc") { }

	struct npc_skellmage_iccAI : public ScriptedAI
	{
		npc_skellmage_iccAI(Creature* pCreature) : ScriptedAI(pCreature)
		{
			m_pInstance = pCreature->GetInstanceScript();
		}

		InstanceScript* m_pInstance;

		uint32 m_uiVolleyTimer;
		uint32 m_uiColumnTimer;
		uint32 m_uiVoidTimer;

		void EnterCombat(Unit* who)
		{
			m_uiVolleyTimer = 12000;
			m_uiColumnTimer = 20000;
			m_uiVoidTimer = 30000;

			if (m_pInstance && m_pInstance->GetData(DATA_VALITHRIA_DREAMWALKER_EVENT != IN_PROGRESS))
				m_pInstance->SetData(DATA_VALITHRIA_DREAMWALKER_EVENT, IN_PROGRESS);
		}

		void KilledUnit(Unit* victim)
		{
			DoScriptText(SAY_PDEATH, pValithria);
		}

		void Reset()
		{
			if (m_pInstance)
				m_pInstance->SetData(DATA_VALITHRIA_DREAMWALKER_EVENT, NOT_STARTED);
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (m_uiVolleyTimer <= diff)
			{
				Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true);
				DoCast(pTarget, SPELL_VOLLEY);
				m_uiVolleyTimer = 15000;
			} else m_uiVolleyTimer -= diff;

			/*        if (m_uiVoidTimer <= diff)
			{
			Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true);
			me->SummonCreature(CREATURE_VOID, pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 15000);
			m_uiVoidTimer = 30000;
			} else m_uiVoidTimer -= diff; */

			if (m_uiColumnTimer <= diff)
			{
				Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true);
				DoCast(pTarget, SPELL_COLUMN);
				m_uiColumnTimer = 27000;
			} else m_uiColumnTimer -= diff;

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_skellmage_iccAI (pCreature);
	}

};

class npc_fireskell_icc : public CreatureScript
{
public:
	npc_fireskell_icc() : CreatureScript("npc_fireskell_icc") { }

	struct npc_fireskell_iccAI : public ScriptedAI
	{
		npc_fireskell_iccAI(Creature* pCreature) : ScriptedAI(pCreature)
		{
			m_pInstance = pCreature->GetInstanceScript();
		}

		InstanceScript* m_pInstance;

		uint32 m_uiWasteTimer;
		uint32 m_uiFireballTimer;

		void EnterCombat(Unit* who)
		{
			m_uiWasteTimer = 37000;
			m_uiFireballTimer = 5000;
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (m_uiWasteTimer <= diff)
			{
				DoCast(SPELL_WASTE);
				m_uiWasteTimer = 20000;
			} else m_uiWasteTimer -= diff;

			if (m_uiFireballTimer <= diff)
			{
				Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true);
				DoCast(pTarget, SPELL_FIREBALL);
				m_uiFireballTimer = 5000;
			} else m_uiFireballTimer -= diff;

			DoMeleeAttackIfReady();
		}

		void KilledUnit(Unit* pVictim)
		{
			DoScriptText(SAY_PDEATH, pValithria);
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_fireskell_iccAI (pCreature);
	}

};

class npc_suppressor_icc : public CreatureScript
{
public:
	npc_suppressor_icc() : CreatureScript("npc_suppressor_icc") { }

	struct npc_suppressor_iccAI : public ScriptedAI
	{
		npc_suppressor_iccAI(Creature* pCreature) : ScriptedAI(pCreature)
		{
			m_pInstance = pCreature->GetInstanceScript();
		}

		InstanceScript* m_pInstance;

		uint32 m_uiCheckTimer;


		void EnterCombat(Unit* who)
		{
			me->SetReactState(REACT_PASSIVE);
			m_uiCheckTimer = 2500;
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (m_uiCheckTimer <= diff)
			{
				me->CastSpell(pValithria, SPELL_SUPRESSION, true, 0, 0, 0);
				m_uiCheckTimer = 100000;
			} else m_uiCheckTimer -= diff;
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_suppressor_iccAI (pCreature);
	}

};

class npc_manavoid_icc : public CreatureScript
{
public:
	npc_manavoid_icc() : CreatureScript("npc_manavoid_icc") { }

	struct npc_manavoid_iccAI : public ScriptedAI
	{
		npc_manavoid_iccAI(Creature* pCreature) : ScriptedAI(pCreature)
		{
			m_pInstance = pCreature->GetInstanceScript();
		}

		InstanceScript* m_pInstance;

		void InitializeAI()
		{
			DoCast(SPELL_MANA_VOID);
		}

		void EnterCombat(Unit* who)
		{
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
			DoStartNoMovement(me->getVictim());
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_manavoid_iccAI (pCreature);
	}

};

class npc_glutabomination_icc : public CreatureScript
{
public:
	npc_glutabomination_icc() : CreatureScript("npc_glutabomination_icc") { }

	struct npc_glutabomination_iccAI : public ScriptedAI
	{
		npc_glutabomination_iccAI(Creature* pCreature) : ScriptedAI(pCreature)
		{
			m_pInstance = pCreature->GetInstanceScript();
		}

		InstanceScript* m_pInstance;

		uint32 m_uiSprayTimer;

		void EnterCombat(Unit* who)
		{
			m_uiSprayTimer = 14000;
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (m_uiSprayTimer <= diff)
			{
				DoCast(me, SPELL_SPRAY);
				m_uiSprayTimer = 20000;
			} else m_uiSprayTimer -= diff;

			DoMeleeAttackIfReady();
		}

		void KilledUnit(Unit* pVictim)
		{
			DoScriptText(SAY_PDEATH, pValithria);
		}

		void JustDied(Unit* killer)
		{
			uint32 count = RAID_MODE(4,6,6,8);
			for (uint8 i = 1; i <= count; i++)
			{
				me->SummonCreature(CREATURE_WORM, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), 0, TEMPSUMMON_CORPSE_DESPAWN);
			}
		}

	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_glutabomination_iccAI (pCreature);
	}

};

class npc_blistzombie_icc : public CreatureScript
{
public:
	npc_blistzombie_icc() : CreatureScript("npc_blistzombie_icc") { }

	struct npc_blistzombie_iccAI : public ScriptedAI
	{
		npc_blistzombie_iccAI(Creature* pCreature) : ScriptedAI(pCreature)
		{
			m_pInstance = pCreature->GetInstanceScript();
		}

		InstanceScript* m_pInstance;

		uint32 m_uiBurstTTimer;
		uint32 m_uiDelayTimer;

		void EnterCombat(Unit* who)
		{
			m_uiBurstTTimer = 20000;
			m_uiDelayTimer = 99999;
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (m_uiBurstTTimer <= diff)
			{
				DoCast(SPELL_BURST);
				m_uiBurstTTimer = 24000;
				m_uiDelayTimer  = 1000;
			} else m_uiBurstTTimer -= diff;

			if (m_uiDelayTimer  <= diff)
			{
				me->ForcedDespawn();
				m_uiDelayTimer  = 100000;
			} else m_uiDelayTimer  -= diff;

			DoMeleeAttackIfReady();
		}

		void KilledUnit(Unit* victim)
		{
			DoScriptText(SAY_PDEATH, pValithria);
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_blistzombie_iccAI (pCreature);
	}

};

class npc_impaling_spear : public CreatureScript
{
public:
	npc_impaling_spear() : CreatureScript("npc_impaling_spear") { }

	struct npc_impaling_spearAI : public Scripted_NoMovementAI
	{
		npc_impaling_spearAI(Creature* pCreature) : Scripted_NoMovementAI(pCreature)
		{
			me->SetReactState(REACT_PASSIVE);
			ImpalingSpearGUID = 0;
		}

		uint64 ImpalingSpearGUID;

		void SetPrisoner(Unit* uPrisoner)
		{
			ImpalingSpearGUID = uPrisoner->GetGUID();
		}

		void Reset()
		{
			ImpalingSpearGUID = 0;
		}

		void DamageTaken(Unit *who, uint32 &dmg)
		{
			who->CastSpell(who, SPELL_REMOVE_SPEAR, true);
			if (who->GetGUID() != me->GetGUID())

				if (ImpalingSpearGUID)
				{
					Unit* Spear = Unit::GetUnit((*me), ImpalingSpearGUID);
					if (Spear)
					{
						Spear->RemoveAurasDueToSpell(SPELL_IMPALING_SPEAR);
					}
				}
				me->ForcedDespawn();
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_impaling_spearAI (pCreature);
	}

};

class npc_sister_svalna : public CreatureScript
{
public:
	npc_sister_svalna() : CreatureScript("npc_sister_svalna") { }

	struct npc_sister_svalnaAI : public ScriptedAI
	{
		npc_sister_svalnaAI(Creature* pCreature) : ScriptedAI(pCreature)
		{
			m_pInstance = pCreature->GetInstanceScript();
			me->AddUnitMovementFlag(MOVEMENTFLAG_LEVITATING);
			pSvalna = me;
		}

		InstanceScript* m_pInstance;

		uint32 ShieldTimer;
		uint32 CaressTimer;
		uint32 ImpaleTimer;

		void Reset()
		{
			ImpaleTimer = 30000;

		}

		void EnterCombat(Unit *who)
		{
			DoScriptText(SVALNA_AGGRO, me);
		}

		void JustDied(Unit* who)
		{
			DoScriptText(SVALNA_DEATH, me);
		}

		void KilledUnit(Unit *victim)
		{
			DoScriptText(SVALNA_SLAY, me);
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (ImpaleTimer <= diff)
			{
				Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0);
				if (!pTarget) pTarget = me->getVictim();
				if (pTarget && pTarget->isAlive())
				{
					DoCast(pTarget, SPELL_IMPALING_SPEAR, true);
					Creature* Spear = me->SummonCreature(CREATURE_IMPALING_SPEAR, pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ(), 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 300000);
				}
				ImpaleTimer = 50000;
				ShieldTimer = 30000;
			} else ImpaleTimer -= diff;

			if (ShieldTimer <= diff)
			{
				DoCast(me, SPELL_AETHER_SHIELD);
				ShieldTimer = 9999999;
			} else ShieldTimer -= diff;

			if (me->HasAura(SPELL_AETHER_SHIELD) && !me->HasAura(SPELL_DIVINE_SURGE))
			{
				DoCast(me, SPELL_DIVINE_SURGE);
				CaressTimer = 60000;
			}

			if (CaressTimer <= diff && me->HasAura(SPELL_AETHER_SHIELD))
			{
				Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0);
				if (!pTarget) pTarget = me->getVictim();
				DoCast(pTarget, SPELL_CARESS_OF_DEATH);
				CaressTimer = 60000;
			} CaressTimer -= diff;

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_sister_svalnaAI (pCreature);
	}

};

class npc_dreamcloud_icc : public CreatureScript
{
public:
	npc_dreamcloud_icc() : CreatureScript("npc_dreamcloud_icc") { }

	struct npc_dreamcloud_iccAI : public ScriptedAI
	{
		npc_dreamcloud_iccAI(Creature* pCreature) : ScriptedAI(pCreature)
		{
			m_pInstance = pCreature->GetInstanceScript();
		}

		InstanceScript* m_pInstance;

		uint32 m_uiSpawnTimer;
		uint32 m_uiDelayTimer;

		void InitializeAI()
		{
			DoCast(SPELL_CLOUD_VISUAL);	  	
			me->AddUnitMovementFlag(MOVEMENTFLAG_FLYING);
			me->SendMovementFlagUpdate();
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
		}

		void JustRespawned()
		{
			DoCast(SPELL_CLOUD_VISUAL);
			me->AddUnitMovementFlag(MOVEMENTFLAG_FLYING);
			me->SendMovementFlagUpdate();
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
		}

		void MoveInLineOfSight(Unit *who)
		{
			if (me->IsWithinDistInMap(who, 5.0f))
			{
				DoCast(SPELL_VIGOR);
				m_uiDelayTimer = 100;
			}
		}

		void UpdateAI(const uint32 diff)
		{	
			if (!UpdateVictim())	
				return;

			if (m_uiDelayTimer <= diff)
			{
				me->ForcedDespawn();
			} else m_uiDelayTimer -= diff;
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_dreamcloud_iccAI (pCreature);
	}

};

void AddSC_boss_valithria()
{
	new boss_valithria;
	new npc_skellmage_icc;
	new npc_fireskell_icc;
	new npc_dreamportal_icc;
	new npc_suppressor_icc;
	new npc_manavoid_icc;
	new npc_glutabomination_icc;
	new npc_blistzombie_icc;
	new npc_dreamcloud_icc;
	new npc_sister_svalna;
	new npc_impaling_spear;
}