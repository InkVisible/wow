/* Copyright (C) 2009 - 2010 TrinityCore <http://www.trinitycore.org/>
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

//Valanar Spells
#define Kinetic_Bomb                       72053
#define Vortex                             72037
#define Empowered_Vortex                   72039
//Taldaram Spells
#define Spark                              71807
#define Fireball                           71718
#define Empowered_Fireball                 72040
//Keleseth Spells
#define Lance                              71405
#define Empowered_Lance                    71815
#define Nucleus                            71943
//Mob Spells
#define Vortex_Mob                         71944
#define Empowered_Vortex_Mob               72038
#define Fireball_Mob                       71393
#define Flare                              71708
#define Shadow_Resonance                   71822
#define Fireball_Visual                    71706
#define Nucleus_Visual                     68862
#define Vortex_Visual                      71945
#define Bomb_Visual                        72054
#define Bomb_Explosion                     72052
#define Shrink                             35179
#define Berserk                            47008

//Invocation of Blood
#define Invocation                         70983
#define Aura                               72100


//Mobs
#define Lanathel_Intro                     38004
#define Kinetic_Bomb                       38454
#define Nucleus                            38369
#define Npc_Vortex                         38422
#define Npc_Fireball                       38332
#define Kinetic_Bomb_Target                38458
#define Empowered_Fireball                 38451

//Yells
#define Intro_1                            -1666035
#define Intro_2                            -1666036
#define Keleseth_Invocation                -1666037
#define Keleseth_Special                   -1666038
#define Keleseth_Slay_1                    -1666039
#define Keleseth_Slay_2                    -1666040
#define Keleseth_Berserk                   -1666041
#define Keleseth_Die                       -1666042
#define Taldaram_Invocation                -1666043
#define Taldaram_Special                   -1666044
#define Taldaram_Slay_1                    -1666045
#define Taldaram_Slay_2                    -1666046
#define Taldaram_Berserk                   -1666047
#define Taldaram_Die                       -1666048
#define Valanar_Invocation                 -1666049
#define Valanar_Special                    -2500000
#define Valanar_Slay_1                     -1666050
#define Valanar_Slay_2                     -1666051
#define Valanar_Berserk                    -1666052
#define Valanar_Die                        -1666053


Creature* pLanathel;
Creature* pTaldaram;
Creature* pKeleseth;
Creature* pValanar;
Creature* pBombTarget;

/////////////////////////////////////////////////////


class boss_blood_council : public CreatureScript
{
public:
	boss_blood_council() : CreatureScript("boss_blood_council") { }

	struct boss_blood_councilAI : public ScriptedAI
	{
		boss_blood_councilAI(Creature *c) : ScriptedAI(c)
		{
			pInstance = c->GetInstanceScript();
			pValanar = me;
		}

		InstanceScript* pInstance;

		uint32 PhaseIntro;
		uint32 PhaseIntroTimer;
		uint32 KineticBombTimer;
		uint32 VortexTimer;
		uint32 EmpoweredVortexTimer;
		uint32 InvocationTimer;
		uint32 InvocationNumber;
		uint32 BerserkTimer;

		void reset()
		{
			BerserkTimer = 600000;

			if (pInstance)
				pInstance->SetData(DATA_BLOOD_PRINCE_COUNCIL_EVENT, NOT_STARTED);
			pLanathel = me->SummonCreature(Lanathel_Intro,4702.377930,2769.180908,364.086761,3.297119, TEMPSUMMON_CORPSE_DESPAWN);
			pLanathel->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
			pKeleseth->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
			pTaldaram->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
			PhaseIntro = 0;
		}

		void MoveInLineOfSight(Unit* pwho)
		{
			if (me->IsWithinDistInMap(pwho,25.0f))
			{
				if (PhaseIntro == 0)
				{
					if (pInstance)
						pInstance->SetData(DATA_BLOOD_PRINCE_COUNCIL_EVENT, IN_PROGRESS);
					DoScriptText(Intro_1, pLanathel);
					DoScriptText(Intro_2, pLanathel);
					DoStartMovement(pLanathel, 30.0f);
					PhaseIntro = 1;
				}
			}
		}

		void EnterCombat(Unit* who)
		{
			KineticBombTimer = 45000;
			VortexTimer = 30000;
			InvocationTimer = 60000;
			EmpoweredVortexTimer = 25000;
			InvocationNumber = 0;
			pKeleseth->SetInCombatWithZone();
			pTaldaram->SetInCombatWithZone();
			pKeleseth->GetMotionMaster()->MoveChase(me->getVictim());
			pTaldaram->GetMotionMaster()->MoveChase(me->getVictim());
		}

		void KilledUnit(Unit *victim)
		{
			DoScriptText(RAND(Valanar_Slay_1,Valanar_Slay_2), me);
		}

		void JustDied(Unit* pKiller) //Since both the bosses share same hp if valanar dies others die too
		{
			DoScriptText(Valanar_Die, me);
			pKeleseth->DealDamage(pKeleseth, pKeleseth->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
			pTaldaram->DealDamage(pTaldaram, pTaldaram->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE); //This is used to prevent a bug with invocation so when players kill other boss valanar cannot be looted because he can`t be targeted
			if (pInstance)
				pInstance->SetData(DATA_BLOOD_PRINCE_COUNCIL_EVENT, DONE);
		}


		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (PhaseIntro == 1)
			{
				PhaseIntroTimer = 10000;
				PhaseIntro = 2;
			}

			if (PhaseIntro == 2)
			{
				if (PhaseIntroTimer <= diff)
				{
					DoScriptText(Intro_2,pLanathel);
					pLanathel->ForcedDespawn();
					PhaseIntro = 3;
					PhaseIntroTimer = 15000;
				}
				else PhaseIntroTimer -= diff;
			}

			if (BerserkTimer <= diff)
			{
				DoCast(me, Berserk);
				DoScriptText(Valanar_Berserk, me);
				DoCast(pTaldaram, Berserk);
				DoScriptText(Taldaram_Berserk, pTaldaram);
				DoCast(pKeleseth, Berserk);
				DoScriptText(Keleseth_Berserk, pKeleseth);
				BerserkTimer = 9999999;
			} else BerserkTimer -= diff;

			if (VortexTimer <= diff)
			{
				if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
					me->SummonCreature(Npc_Vortex,pTarget->GetPositionX(),pTarget->GetPositionY(),pTarget->GetPositionZ(),0, TEMPSUMMON_TIMED_DESPAWN, 30000);
				VortexTimer = 30000;
			}
			else VortexTimer -= diff;

			if (KineticBombTimer <= diff)
			{
				if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
				{
					me->SummonCreature(Kinetic_Bomb,pTarget->GetPositionX(),pTarget->GetPositionY(),pTarget->GetPositionZ()+25,0, TEMPSUMMON_TIMED_DESPAWN, 60000);
					pBombTarget = me->SummonCreature(Kinetic_Bomb_Target,pTarget->GetPositionX(),pTarget->GetPositionY(),pTarget->GetPositionZ(),0, TEMPSUMMON_TIMED_DESPAWN, 60000);
				}
				KineticBombTimer = 45000;
			}
			else KineticBombTimer -= diff;
			//Note:This summons only 1 kinetic bomb in blizzard it should summon 2 at once.You can change this if you want.

			if (InvocationTimer <= diff)
			{
				me->RemoveAllAuras();
				pKeleseth->RemoveAllAuras();
				pTaldaram->RemoveAllAuras();
				InvocationNumber = urand(1,3);
				InvocationTimer = 60000;
				if (InvocationNumber == 1) //Since only 1 of the bosses is attackable during the invocation
				{
					DoScriptText(Valanar_Invocation, me);
					me->CastSpell(me,Invocation,true,0,0,0);
					me->CastSpell(me,Aura,true,0,0,0);
					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
					pKeleseth->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
					pTaldaram->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
				}
				else if (InvocationNumber == 2)
				{
					DoScriptText(Keleseth_Invocation, pKeleseth);
					pKeleseth->CastSpell(pKeleseth,Invocation,true,0,0,0);
					pKeleseth->CastSpell(pKeleseth,Aura,true,0,0,0);
					pKeleseth->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
					pTaldaram->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
				}
				else if (InvocationNumber == 3)
				{
					DoScriptText(Taldaram_Invocation, pTaldaram);
					pTaldaram->CastSpell(pTaldaram,Invocation,true,0,0,0);
					pTaldaram->CastSpell(pTaldaram,Aura,true,0,0,0);
					pTaldaram->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
					pKeleseth->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
				}
			}
			else InvocationTimer -= diff;

			if (EmpoweredVortexTimer <= diff)
			{
				if (me->HasAura(Aura))
				{
					DoScriptText(Valanar_Special,me);
					if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
						me->SummonCreature(Npc_Vortex,pTarget->GetPositionX(),pTarget->GetPositionY(),pTarget->GetPositionZ(),0, TEMPSUMMON_TIMED_DESPAWN, 30000);
					VortexTimer = 30000;
				}
				else VortexTimer = 5000;
				EmpoweredVortexTimer = 25000;
			}else EmpoweredVortexTimer -= diff;

			DoMeleeAttackIfReady();
		}

	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new boss_blood_councilAI (pCreature);
	}

};
////////////////////////////////////////////
//Keleseth
////////////////////////////////////////////
class boss_blood_elf_keleset_icc : public CreatureScript
{
public:
	boss_blood_elf_keleset_icc() : CreatureScript("boss_blood_elf_keleset_icc") { }

	struct boss_Keleseth_IccAI : public ScriptedAI
	{
		boss_Keleseth_IccAI(Creature *c) : ScriptedAI(c)
		{
			pInstance = c->GetInstanceScript();
			pKeleseth = me;
		}

		InstanceScript* pInstance;

		uint32 NucleusTimer;
		uint32 ShadowLance;
		uint32 EmpoweredLance;
		uint32 ResetTimer;
		uint32 AuraCheck;

		void EnterCombat(Unit *who)
		{
			NucleusTimer = 1500;
			ShadowLance = 1500;
			EmpoweredLance = 600000;
			AuraCheck = 1000;
			pValanar->SetInCombatWithZone();
			pTaldaram->SetInCombatWithZone();
			pValanar->GetMotionMaster()->MoveChase(me->getVictim());
			pTaldaram->GetMotionMaster()->MoveChase(me->getVictim());
		}

		void KilledUnit(Unit *victim)
		{
			DoScriptText(RAND(Keleseth_Slay_1,Keleseth_Slay_2), me);
		}

		void JustDied(Unit* pKiller)
		{
			DoScriptText(Keleseth_Die, me);
			pValanar->DealDamage(pValanar, pValanar->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
			pTaldaram->DealDamage(pTaldaram, pTaldaram->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
			if (pInstance)
				pInstance->SetData(DATA_BLOOD_PRINCE_COUNCIL_EVENT, DONE);
		}

		void JustSummoned(Creature* pSummoned)
		{
			if (Unit* pTarget = SelectTarget(SELECT_TARGET_NEAREST))
				pSummoned->AI()->AttackStart(pTarget);
		}


		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (NucleusTimer <= diff)
			{
				me->SummonCreature(Nucleus,me->GetPositionX(),me->GetPositionY(),me->GetPositionZ(),0, TEMPSUMMON_TIMED_DESPAWN, 63000);
				NucleusTimer = 10000;
			}
			else NucleusTimer -= diff;

			if (ShadowLance <= diff)
			{
				DoCast(me->getVictim(), Lance);
				ShadowLance = 1500;
			}
			else ShadowLance -= diff;

			if (EmpoweredLance <= diff)
			{
				if (me->HasAura(Aura))
				{
					DoCast(me->getVictim(),Empowered_Lance);
				}
				EmpoweredLance = 1500;
			}
			else EmpoweredLance -= diff;

			if (AuraCheck <= diff)
			{
				if (me->HasAura(Aura))
				{
					ShadowLance = 60000;
					EmpoweredLance = 1500;
					ResetTimer = 60000;
					AuraCheck = 60000;
				}
				else AuraCheck = 1000;
			}
			else AuraCheck -= diff;

			if (ResetTimer <= diff)
			{
				EmpoweredLance = 600000;
				ResetTimer = 600000;
			}
			else ResetTimer -= diff;

		}

	};

	CreatureAI* GetAI_boss_Keleseth_Icc(Creature* pCreature) const
	{
		return new boss_Keleseth_IccAI (pCreature);
	}

};

///////////////////////////////////////
//Taldaram
///////////////////////////////////////

class boss_blood_elf_taldaram_icc : public CreatureScript
{
public:
	boss_blood_elf_taldaram_icc() : CreatureScript("boss_blood_elf_taldaram_icc") { }

	struct boss_Taldaram_IccAI : public ScriptedAI
	{
		boss_Taldaram_IccAI(Creature *c) : ScriptedAI(c)
		{
			pInstance = c->GetInstanceScript();
			pTaldaram = me;
		}

		InstanceScript* pInstance;

		uint32 FireballTimer;
		uint32 EmpoweredFireballTimer;
		uint32 SparkTimer;
		uint32 ResetTimer;
		uint32 AuraCheck;


		void EnterCombat(Unit *who)
		{
			FireballTimer = 15000;
			EmpoweredFireballTimer = 6000000;
			SparkTimer = 22000;
			AuraCheck = 1000;
			pValanar->SetInCombatWithZone();
			pKeleseth->SetInCombatWithZone();
			pKeleseth->GetMotionMaster()->MoveChase(me->getVictim());
			pValanar->GetMotionMaster()->MoveChase(me->getVictim());
		}

		void JustSummoned(Creature* pSummoned)
		{
			if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM))
				pSummoned->AI()->AttackStart(pTarget);
		}

		void KilledUnit(Unit *victim)
		{
			DoScriptText(RAND(Taldaram_Slay_1,Taldaram_Slay_2), me);
		}

		void JustDied(Unit* pKiller)
		{
			pValanar->DealDamage(pValanar, pValanar->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
			pKeleseth->DealDamage(pKeleseth, pKeleseth->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
			if (pInstance)
				pInstance->SetData(DATA_BLOOD_PRINCE_COUNCIL_EVENT, DONE);
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (FireballTimer <= diff)
			{
				me->SummonCreature(Npc_Fireball,me->GetPositionX(),me->GetPositionY(),me->GetPositionZ(),0, TEMPSUMMON_CORPSE_DESPAWN);
				FireballTimer = 15000;
			}
			else FireballTimer -= diff;

			if (EmpoweredFireballTimer <= diff)
			{
				if (me->HasAura(Aura))
				{
					me->SummonCreature(Empowered_Fireball,me->GetPositionX(),me->GetPositionY(),me->GetPositionZ(),0, TEMPSUMMON_CORPSE_DESPAWN);
				}
				EmpoweredFireballTimer = 15000;
			}
			else EmpoweredFireballTimer -= diff;

			if (SparkTimer <= diff)
			{
				if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
					DoCast(pTarget, Spark);
				SparkTimer = 22000;
			}
			else SparkTimer -= diff;

			if (AuraCheck <= diff)
			{
				if (me->HasAura(Aura))
				{
					FireballTimer = 60000;
					EmpoweredFireballTimer = 10000;
					ResetTimer = 60000;
					AuraCheck = 60000;
				}
				else AuraCheck = 1000;
			}
			else AuraCheck -= diff;

			if (ResetTimer <= diff)
			{
				EmpoweredFireballTimer = 600000;
				ResetTimer = 600000;
			}
			else ResetTimer -= diff;


			DoMeleeAttackIfReady();

		}

	};

	CreatureAI* GetAI_boss_Taldaram_Icc(Creature* pCreature) const
	{
		return new boss_Taldaram_IccAI (pCreature);
	}

};

///////////////////////////////////////
//Mob Nucleus
///////////////////////////////////////

class npc_nucleus_icc : public CreatureScript
{
public:
	npc_nucleus_icc() : CreatureScript("npc_nucleus_icc") { }

	struct npc_NucleusAI : public ScriptedAI
	{
		npc_NucleusAI(Creature *c) : ScriptedAI(c){}

		uint32 CheckInterval;

		void InitializeAI()
		{
			DoCast(Nucleus_Visual);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
			CheckInterval = 1000;
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (CheckInterval <= diff)
			{
				me->SetReactState(REACT_PASSIVE);
				if (Unit* pTarget = SelectTarget(SELECT_TARGET_NEAREST))
				{
					DoCast(pTarget,Shadow_Resonance);
				}
				CheckInterval = 1000;
			}
			else CheckInterval -= diff;
		}

	};

	CreatureAI* GetAI_npc_Nucleus(Creature* pCreature) const
	{
		return new npc_NucleusAI (pCreature);
	}

};

/////////////////////////////////////////////////
//Fireball
/////////////////////////////////////////////////

class npc_fireball_icc : public CreatureScript
{
public:
	npc_fireball_icc() : CreatureScript("npc_fireball_icc") { }

	struct npc_FireballAI : public ScriptedAI
	{
		npc_FireballAI(Creature *c) : ScriptedAI(c){}

		uint32 CheckTimer;
		uint32 FlareTimer;

		void InitializeAI()
		{
			DoCast(Fireball_Visual);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
			me->SetSpeed(MOVE_WALK, 0.3f, true);
			me->SetSpeed(MOVE_RUN, 0.5f, true);
		}

		void EnterCombat(Unit *who)
		{
			CheckTimer = 1000;
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (CheckTimer <= diff)
			{
				if (me->IsWithinDistInMap(me->getVictim(), 5.0f))
				{
					DoCast(Fireball_Mob);
					me->ForcedDespawn();
				}
				CheckTimer = 1000;
			}
			else CheckTimer -= diff;


		}

	};

	CreatureAI* GetAI_npc_Fireball(Creature* pCreature) const
	{
		return new npc_FireballAI (pCreature);
	}

};
/////////////////////////////////////////////////
//Empowered Fireball
/////////////////////////////////////////////////

class npc_empfireball_icc : public CreatureScript
{
public:
	npc_empfireball_icc() : CreatureScript("npc_empfireball_icc") { }

	struct npc_EmpFireballAI : public ScriptedAI
	{
		npc_EmpFireballAI(Creature *c) : ScriptedAI(c){}

		uint32 CheckTimer;
		uint32 FlareTimer;

		void InitializeAI()
		{
			DoCast(Fireball_Visual);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
			me->SetSpeed(MOVE_WALK, 0.3f, true);
			me->SetSpeed(MOVE_RUN, 0.5f, true);
		}

		void EnterCombat(Unit *who)
		{
			CheckTimer = 1000;
			FlareTimer = 1000;
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (CheckTimer <= diff)
			{
				if (me->IsWithinDistInMap(me->getVictim(), 5.0f))
				{
					DoCast(Fireball_Mob);
					me->ForcedDespawn();
				}
				CheckTimer = 1000;
			}
			else CheckTimer -= diff;

			if (FlareTimer <= diff)
			{
				if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM,0,10,true,0))
				{
					me->CastSpell(pTarget,Flare,true,0,0,0);
					me->CastSpell(me,Shrink,true,0,0,0);
				}
				FlareTimer = 1000;
			}
			else FlareTimer -= diff;

		}

	};

	CreatureAI* GetAI_npc_EmpFireball(Creature* pCreature) const
	{
		return new npc_EmpFireballAI (pCreature);
	}

};

/////////////////////////////////////////////////
//Kinetic Bomb
/////////////////////////////////////////////////


class npc_bomb_icc : public CreatureScript
{
public:
	npc_bomb_icc() : CreatureScript("npc_bomb_icc") { }

	struct npc_BombAI : public ScriptedAI
	{
		npc_BombAI(Creature *c) : ScriptedAI(c){}

		uint32 CheckTimer;

		void InitializeAI()
		{
			DoCast(Bomb_Visual);
			me->SetFlying(true);
			CheckTimer = 1000;
			me->GetMotionMaster()->MoveChase(pBombTarget);
		}


		void DamageTaken(Unit* pDoneBy, uint32 &uiDamage)
		{
			if (uiDamage > me->GetHealth())
			{
				me->SetHealth(1000);
				me->NearTeleportTo(me->GetPositionX(),me->GetPositionY(),me->GetPositionZ()+1,0,false);
			}
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;
			//Not true needs better scripting//
			if (CheckTimer <= diff)
			{
				if (me->IsWithinDist3d(pBombTarget->GetPositionX(), pBombTarget->GetPositionY(), pBombTarget->GetPositionZ(), 5.0f))
				{
					me->CastSpell(me,Bomb_Explosion,true,0,0,0);
					me->ForcedDespawn();
				}
				CheckTimer = 1000;
			}
			else CheckTimer -= diff;

		}

	};

	CreatureAI* GetAI_npc_Bomb(Creature* pCreature) const
	{
		return new npc_BombAI (pCreature);
	}

};

////////////////////////////////////////
//Vortex
////////////////////////////////////////

class npc_vortex_icc : public CreatureScript
{
public:
	npc_vortex_icc() : CreatureScript("npc_vortex_icc") { }

	struct npc_Vortex_iccAI : public ScriptedAI
	{
		npc_Vortex_iccAI(Creature *c) : ScriptedAI(c){}

		uint32 VortexTimer;

		void InitializeAI()
		{
			DoCast(Vortex_Visual);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
			VortexTimer = 1000;
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			if (VortexTimer <= diff)
			{
				me->CastSpell(me,Vortex_Mob,true,0,0,0);
				VortexTimer = 1000;
			}
			else VortexTimer -= diff;

		}

	};

	CreatureAI* GetAI_npc_Vortex_icc(Creature* pCreature) const
	{
		return new npc_Vortex_iccAI (pCreature);
	}

};

class lanathel_intro : public CreatureScript
{
public:
	lanathel_intro() : CreatureScript("lanathel_intro") { }

	struct lanathel_introAI : public ScriptedAI
	{
		lanathel_introAI(Creature *c) : ScriptedAI(c)
		{
			pInstance = c->GetInstanceScript();
			pLanathel = me;
		}
		InstanceScript* pInstance;

		void Reset()
		{
			me->SetReactState(REACT_PASSIVE);
			me->SetFlying(true);
		}

		void UpdateAI(const uint32 diff)
		{
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new lanathel_introAI (pCreature);
	}

};

void AddSC_boss_blood_council()
{
	new boss_blood_council;
	new boss_blood_elf_keleset_icc;
	new boss_blood_elf_taldaram_icc;
	new lanathel_intro;
	new npc_nucleus_icc;
	new npc_fireball_icc;
	new npc_bomb_icc;
	new npc_vortex_icc;
	new npc_empfireball_icc;
}