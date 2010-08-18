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

enum Spells
{
	SPELL_CRYPTSCARABS                = 70965,
	SPELL_DARKMENDING                 = 71020,
	SPELL_WEBWRAP                     = 70980,
	SPELL_BONEFLURRY                  = 70960,
	SPELL_SHATTEREDBONES              = 70961,
	SPELL_GLACIALBLAST                = 71029,
	SPELL_SHIELDBASH                  = 70964,
	SPELL_DISRUPTINGSHOUT             = 70122,
	//SPELL_ON_ORGRIM'S_HAMMER_DECK     = 70121, //for gunship battle
	SPELL_SHADOWBOLT                  = 69387,
	SPELL_SHADOWNOVA_10_NORMAL        = 69355,
	SPELL_SHADOWNOVA_25_NORMAL        = 71106,
	SPELL_SHADOWNOVA_10_HEROIC        = 69355,
	SPELL_SHADOWNOVA_25_HEROIC        = 71106,
	SPELL_DARKBLESSING                = 69391,
	SPELL_SHADOWMEND_10               = 69389,
	SPELL_SHADOWMEND_25               = 71107,
	SPELL_AURAOFDARKNESS              = 69491,
	SPELL_DARKRECKONING               = 69483,
	SPELL_CHAOSBOLT_10                = 69576,
	SPELL_CHAOSBOLT_25                = 71108,
	SPELL_CONSUMINGSHADOWS            = 69405,
	SPELL_CURSEOFAGONY_10             = 69404,
	SPELL_CURSEOFAGONY_25             = 71112,
	SPELL_SHADOWCLEAVE                = 69492,
	SPELL_CURSEOFTRPOR                = 71237,
	SPELL_DARKEMPOWERMENT             = 70901,
	SPELL_DARKMARTYDOM_CULT           = 70903,
	SPELL_DEATHCHILLBLAST_10          = 70594,
	SPELL_DEATHCHILLBLAST_25          = 72005,
	SPELL_DEATHCHILLBLAST_EM_10       = 70906,
	SPELL_DEATHCHILLBLAST_EM_25       = 72485,
	SPELL_SHROUDOFTHEOCCULT           = 70768,
	SPELL_DARKMARTYRDOM               = 71236,
	SPELL_DARKTRANSFORMATION          = 70900,
	SPELL_NECROTICSTRIKE_10           = 70659,
	SPELL_NECROTICSTRIKE_25           = 72490,
	SPELL_SHADOWCLEAVE_10             = 70670,
	SPELL_SHADOWCLEAVE_25             = 72006,
	SPELL_VAMPIRICMIGHT               = 70674,
};


class npc_nerubar_brood_keeper : public CreatureScript
{
public:
	npc_nerubar_brood_keeper() : CreatureScript("npc_nerubar_brood_keeper") { }

	struct  npc_nerubar_brood_keeperAI: public ScriptedAI
	{
		npc_nerubar_brood_keeperAI(Creature *c) : ScriptedAI(c)
		{
		}

		uint32 m_uiScarabsTimer;
		uint32 m_uiDarkmendingTimer;
		uint32 m_uiWebrapTimer;

		void Reset()
		{
			m_uiScarabsTimer = 10000;
			m_uiDarkmendingTimer = 17800;
			m_uiWebrapTimer = 12000;
		}

		void EnterCombat(Unit* who)
		{
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (m_uiScarabsTimer <= diff)
			{
				Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0);
				DoCast(pTarget, SPELL_CRYPTSCARABS);
				m_uiScarabsTimer = 10000;
			} else m_uiScarabsTimer -= diff;

			if (m_uiDarkmendingTimer <= diff)
			{
				DoCast(me, SPELL_DARKMENDING);
				m_uiDarkmendingTimer = 17800;
			} else m_uiDarkmendingTimer -= diff;

			if (m_uiWebrapTimer<= diff)
			{
				Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0);
				DoCast(pTarget, SPELL_WEBWRAP);
				m_uiWebrapTimer = 12000;
			} else m_uiWebrapTimer -= diff;

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_nerubar_brood_keeperAI (pCreature);
	}
};


class npc_the_damned : public CreatureScript
{
public:
	npc_the_damned() : CreatureScript("npc_the_damned") { }

	struct  npc_the_damnedAI: public ScriptedAI
	{
		npc_the_damnedAI(Creature *c) : ScriptedAI(c)
		{
		}

		uint32 m_uiBoneTimer;

		void Reset()
		{
			m_uiBoneTimer = 9000;
		}

		void EnterCombat(Unit* who)
		{
		}

		void JustDied(Unit* who)
		{
			DoCastAOE(SPELL_SHATTEREDBONES);
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (m_uiBoneTimer <= diff)
			{
				//     DoCast(me, SPELL_BONEFLURRY);       // This spell is bugged so we will disable it for the moment.
				m_uiBoneTimer = 9000;
			} else m_uiBoneTimer -= diff;

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_the_damnedAI (pCreature);
	}

};

class npc_servant_of_the_throne : public CreatureScript
{
public:
	npc_servant_of_the_throne() : CreatureScript("npc_servant_of_the_throne") { }

	struct  npc_servant_of_the_throneAI: public ScriptedAI
	{
		npc_servant_of_the_throneAI(Creature *c) : ScriptedAI(c)
		{
		}

		uint32 m_uiBlastTimer;

		void Reset()
		{
			m_uiBlastTimer = 13000;
		}

		void EnterCombat(Unit* who)
		{
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (m_uiBlastTimer <= diff)
			{
				DoCastAOE(SPELL_GLACIALBLAST);
				m_uiBlastTimer = 13000;
			} else m_uiBlastTimer -= diff;

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_servant_of_the_throneAI (pCreature);
	}
};


class npc_ancient_skeletal_soldier : public CreatureScript
{
public:
	npc_ancient_skeletal_soldier() : CreatureScript("npc_ancient_skeletal_soldier") { }

	struct  npc_ancient_skeletal_soldierAI: public ScriptedAI
	{
		npc_ancient_skeletal_soldierAI(Creature *c) : ScriptedAI(c)
		{
		}

		uint32 m_uiBashTimer;

		void Reset()
		{
			m_uiBashTimer = 8000;
		}

		void EnterCombat(Unit* who)
		{
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (m_uiBashTimer <= diff)
			{
				DoCast(me, SPELL_SHIELDBASH);
				m_uiBashTimer = 8000;
			} else m_uiBashTimer -= diff;

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_ancient_skeletal_soldierAI (pCreature);
	}

};

class npc_death_bound_ward : public CreatureScript
{
public:
	npc_death_bound_ward() : CreatureScript("npc_death_bound_ward") { }

	struct  npc_death_bound_wardAI: public ScriptedAI
	{
		npc_death_bound_wardAI(Creature *c) : ScriptedAI(c)
		{
		}

		uint32 m_uiShoutTimer;
		uint32 m_uiSlashTimer;

		void Reset()
		{
			m_uiShoutTimer = 8000;
			m_uiSlashTimer = 8000;
			// Hack until properly scripted
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
		}

		void EnterCombat(Unit* who)
		{

		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (m_uiShoutTimer <= diff)
			{
				DoCast(me, SPELL_DISRUPTINGSHOUT);
				m_uiShoutTimer = 8000;
			} else m_uiShoutTimer -= diff;

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_death_bound_wardAI (pCreature);
	}

};

class npc_death_speaker_attedant : public CreatureScript
{
public:
	npc_death_speaker_attedant() : CreatureScript("npc_death_speaker_attedant") { }

	struct  npc_death_speaker_attedantAI: public ScriptedAI
	{
		npc_death_speaker_attedantAI(Creature *c) : ScriptedAI(c)
		{
		}

		uint32 m_uiShadowboltTimer;
		uint32 m_uiShadownovaTimer;

		void Reset()
		{
			m_uiShadowboltTimer = 8000;
			m_uiShadownovaTimer = 23000;
		}

		void EnterCombat(Unit* who)
		{
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (m_uiShadowboltTimer <= diff)
			{
				Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0);
				DoCast(pTarget, SPELL_SHADOWBOLT);
				m_uiShadowboltTimer = 8000;
			} else m_uiShadowboltTimer -= diff;

			if (m_uiShadownovaTimer  <= diff)
			{
				DoCastAOE(RAID_MODE(SPELL_SHADOWNOVA_10_NORMAL,SPELL_SHADOWNOVA_25_NORMAL,SPELL_SHADOWNOVA_10_HEROIC,SPELL_SHADOWNOVA_25_HEROIC));
				m_uiShadownovaTimer  = 23000;
			} else m_uiShadownovaTimer -= diff;

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_death_speaker_attedantAI (pCreature);
	}

};


class npc_death_speaker_disciple : public CreatureScript
{
public:
	npc_death_speaker_disciple() : CreatureScript("npc_death_speaker_disciple") { }

	struct  npc_death_speaker_discipleAI: public ScriptedAI
	{
		npc_death_speaker_discipleAI(Creature *c) : ScriptedAI(c)
		{
		}

		uint32 m_uiShadowboltTimer;
		uint32 m_uiDarkTimer;
		uint32 m_uiMendTimer;

		void Reset()
		{
			m_uiShadowboltTimer = 8000;
			m_uiDarkTimer = 20000;
			m_uiMendTimer = 25000;
		}

		void EnterCombat(Unit* who)
		{
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (m_uiDarkTimer <= diff)
			{
				Unit* pTarget = me->SelectNearestTarget(45);
				if(pTarget && pTarget->GetMaxHealth() && pTarget->IsFriendlyTo(me))
				{
					DoCast(pTarget, SPELL_DARKBLESSING);
					m_uiDarkTimer = 20000;
				}
			} else m_uiDarkTimer -= diff;

			if (m_uiShadowboltTimer <= diff)
			{
				Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0);
				DoCast(pTarget, SPELL_SHADOWBOLT);
				m_uiShadowboltTimer = 8000;
			} else m_uiShadowboltTimer -= diff;

			if (m_uiMendTimer  <= diff)
			{
				Unit* pTarget = me->SelectNearestTarget(45);

				if(pTarget->GetHealth()*100 / pTarget->GetMaxHealth() < 30 && pTarget->IsFriendlyTo(me))
				{
					DoCast(pTarget, RAID_MODE(SPELL_SHADOWMEND_10,SPELL_SHADOWMEND_25));
					m_uiMendTimer  = 25000;
				}
			} else m_uiMendTimer -= diff;

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_death_speaker_discipleAI (pCreature);
	}

};

class npc_death_speaker_high_priest : public CreatureScript
{
public:
	npc_death_speaker_high_priest() : CreatureScript("npc_death_speaker_high_priest") { }

	struct  npc_death_speaker_high_priestAI: public ScriptedAI
	{
		npc_death_speaker_high_priestAI(Creature *c) : ScriptedAI(c)
		{
		}

		uint32 m_uiDarkTimer;

		void Reset()
		{
			m_uiDarkTimer = 10000;
		}

		void EnterCombat(Unit* who)
		{
			DoCast(me, SPELL_AURAOFDARKNESS);
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (m_uiDarkTimer <= diff)
			{
				Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0);
				DoCast(pTarget, SPELL_DARKRECKONING);
				m_uiDarkTimer = 10000;
			} else m_uiDarkTimer -= diff;

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_death_speaker_high_priestAI (pCreature);
	}

};

class npc_death_speaker_servant : public CreatureScript
{
public:
	npc_death_speaker_servant() : CreatureScript("npc_death_speaker_servant") { }

	struct  npc_death_speaker_servantAI: public ScriptedAI
	{
		npc_death_speaker_servantAI(Creature *c) : ScriptedAI(c)
		{
		}

		uint32 m_uiChaosTimer;
		uint32 m_uiShadowsTimer;
		uint32 m_uiAgonyTimer;

		void Reset()
		{
			m_uiChaosTimer = 15000;
			m_uiShadowsTimer = 13000;
			m_uiAgonyTimer = 10000;
		}

		void EnterCombat(Unit* who)
		{
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (m_uiChaosTimer <= diff)
			{
				Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0);
				DoCast(pTarget, RAID_MODE(SPELL_CHAOSBOLT_10,SPELL_CHAOSBOLT_25));
				m_uiChaosTimer = 15000;
			} else m_uiChaosTimer -= diff;

			if (m_uiAgonyTimer <= diff)
			{
				Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0);
				DoCast(pTarget, RAID_MODE(SPELL_CURSEOFAGONY_10,SPELL_CURSEOFAGONY_25));
				m_uiAgonyTimer = 15000;
			} else m_uiAgonyTimer -= diff;

			if (m_uiShadowsTimer <= diff)
			{
				Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0);
				DoCast(pTarget, SPELL_CONSUMINGSHADOWS);
				m_uiShadowsTimer = 13000;
			} else m_uiShadowsTimer -= diff;

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_death_speaker_servantAI (pCreature);
	}

};

class npc_death_speaker_zealot : public CreatureScript
{
public:
	npc_death_speaker_zealot() : CreatureScript("npc_death_speaker_zealot") { }

	struct  npc_death_speaker_zealotAI: public ScriptedAI
	{
		npc_death_speaker_zealotAI(Creature *c) : ScriptedAI(c)
		{
		}

		uint32 m_uiCleaveTimer;

		void Reset()
		{
			m_uiCleaveTimer = 8000;
		}

		void EnterCombat(Unit* who)
		{
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (m_uiCleaveTimer <= diff)
			{
				DoCast(me, SPELL_SHADOWCLEAVE);
				m_uiCleaveTimer = 8000;
			} else m_uiCleaveTimer -= diff;

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_death_speaker_zealotAI (pCreature);
	}

};

class npc_cult_adherent : public CreatureScript
{
public:
	npc_cult_adherent() : CreatureScript("npc_cult_adherent") { }

	struct  npc_cult_adherentAI: public ScriptedAI
	{
		npc_cult_adherentAI(Creature *c) : ScriptedAI(c)
		{
		}

		uint32 m_uiCurseTimer;
		uint32 m_uiDarkTimer;
		uint32 m_uiDeathTimer;
		uint32 m_uiCultTimer;

		bool bEmpowered;

		void Reset()
		{
			m_uiCurseTimer = 10000;
			m_uiDarkTimer = 30000;
			m_uiDeathTimer = 20000;
			m_uiCultTimer = 15000;
			bEmpowered = false;
		}

		void JustSummoned(Creature* summoned)
		{
			if (Unit* target = SelectUnit(SELECT_TARGET_TOPAGGRO,0))
				summoned->AI()->AttackStart(target);
		}

		void EnterCombat(Unit* who)
		{
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (m_uiCurseTimer <= diff)
			{
				Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0);
				DoCast(pTarget, SPELL_CURSEOFTRPOR);
				m_uiCurseTimer = 10000;
			} else m_uiCurseTimer -= diff;

			if (m_uiDarkTimer <= diff)
			{
				DoCast(me, RAND(SPELL_DARKEMPOWERMENT,SPELL_DARKMARTYDOM_CULT));
				m_uiDarkTimer = 30000;
				bEmpowered = true;
			} else m_uiDarkTimer -= diff;

			if (m_uiDeathTimer <= diff)
			{
				Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0);
				if (bEmpowered = false)
				{
					DoCast(pTarget, RAID_MODE(SPELL_DEATHCHILLBLAST_10,SPELL_DEATHCHILLBLAST_25));
				}
				if (bEmpowered = true)
				{
					DoCast(pTarget, RAID_MODE(SPELL_DEATHCHILLBLAST_EM_10,SPELL_DEATHCHILLBLAST_EM_25));
				}
				m_uiDeathTimer = 20000;
			} else m_uiDeathTimer -= diff;

			if (!me->HasAura(SPELL_SHROUDOFTHEOCCULT))
			{
				if (m_uiCultTimer <= diff)
				{
					DoCast(me, SPELL_SHROUDOFTHEOCCULT);
					m_uiCultTimer = 15000;
				} else m_uiCultTimer -= diff;
			}

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_cult_adherentAI (pCreature);
	}

};

class npc_cult_fanatic : public CreatureScript
{
public:
	npc_cult_fanatic() : CreatureScript("npc_cult_fanatic") { }

	struct  npc_cult_fanaticAI: public ScriptedAI
	{
		npc_cult_fanaticAI(Creature *c) : ScriptedAI(c)
		{
		}

		uint32 m_uiDarkTimer;
		uint32 m_uiStrikeTimer;
		uint32 m_uiCleaveTimer;
		uint32 m_uiVampirTimer;

		void Reset()
		{
			m_uiDarkTimer = 30000;
			m_uiStrikeTimer = 8000;
			m_uiCleaveTimer = 8000;
			m_uiVampirTimer = 8000;
		}

		void EnterCombat(Unit* who)
		{
		}

		void JustSummoned(Creature* summoned)
		{
			if (Unit* target = SelectUnit(SELECT_TARGET_TOPAGGRO,0))
				summoned->AI()->AttackStart(target);
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (m_uiDarkTimer <= diff)
			{
				DoCast(me, RAND(SPELL_DARKMARTYRDOM, SPELL_DARKTRANSFORMATION));
				m_uiDarkTimer = 30000;
			} else m_uiDarkTimer -= diff;

			if (m_uiStrikeTimer <= diff)
			{
				DoCast(me, RAID_MODE(SPELL_NECROTICSTRIKE_10,SPELL_NECROTICSTRIKE_25));
				m_uiStrikeTimer = 8000;
			} else m_uiStrikeTimer -= diff;

			if (m_uiCleaveTimer <= diff)
			{
				DoCast(me, RAID_MODE(SPELL_SHADOWCLEAVE_10,SPELL_SHADOWCLEAVE_25));
				m_uiCleaveTimer = 8000;
			} else m_uiCleaveTimer -= diff;

			if (m_uiVampirTimer <= diff)
			{
				DoCast(me, SPELL_VAMPIRICMIGHT);
				m_uiVampirTimer = 8000;
			} else m_uiVampirTimer -= diff;

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_cult_fanaticAI (pCreature);
	}

};

void AddSC_icecrown_citadel_trash()
{
	new npc_nerubar_brood_keeper;
	new npc_the_damned;
	new npc_servant_of_the_throne;
	new npc_ancient_skeletal_soldier;
	new npc_death_bound_ward;
	new npc_death_speaker_attedant;
	new npc_death_speaker_disciple;
	new npc_death_speaker_high_priest;
	new npc_death_speaker_servant;
	new npc_death_speaker_zealot;
	new npc_cult_adherent;
	new npc_cult_fanatic;
}