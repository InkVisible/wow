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

#include "ScriptPCH.h"
#include "icecrown_citadel.h"

#define GOSSIP_START_EVENT "We are ready, Tirion!"

enum Yells
{
	SAY_INTRO_1_KING = -1810001,
	SAY_INTRO_2_TIRION = -1810002,
	SAY_INTRO_3_KING = -1810003,
	SAY_INTRO_4_TIRION = -1810004,
	SAY_INTRO_5_KING = -1810005,
	SAY_AGGRO_KING = -1810006,
	SAY_REMORSELESS_WINTER = -1810007,
	SAY_RANDOM_1 = -1810008,
	SAY_RANDOM_2 = -1810009,
	SAY_KILL_1 = -1810010,
	SAY_KILL_2 = -1810011,
	SAY_BERSERK = -1810012,
	SAY_ENDING_1_KING = -1810013,
	SAY_ENDING_2_KING = -1810014,
	SAY_ENDING_3_KING = -1810015,
	SAY_ENDING_4_KING = -1810016,
	SAY_ENDING_5_TIRION = -1810017,
	SAY_ENDING_6_KING = -1810018,
	SAY_ENDING_7_KING = -1810019,
	SAY_ENDING_8_TIRION = -1810020,
	SAY_ENDING_9_FATHER = -1810021,
	SAY_ENDING_10_TIRION = -1810022,
	SAY_ENDING_11_FATHER = -1810023,
	SAY_ENDING_12_KING = -1810024,
	SAY_DEATH_KING = -1810025,
	SAY_ESCAPE_FROSTMOURNE = -1810026,
	SAY_HARVEST_SOUL = -1810027,
	SAY_DEVOURED_FROSTMOURNE = -1810028,
	SAY_SUMMON_VALKYR = -1810029,
	SAY_BROKEN_ARENA = -1810030,
	SAY_10_PROZENT = -1810031,
};

enum Creatures
{
	CREATURE_TIRION_ICC = 38995,
	CREAUTRE_MENETHIL = 38579,
	CREATURE_FROSTMOURNE_TRIGGER = 38584,
	CREATURE_ICE_SPHERE = 36633,
	CREATURE_VALKYR = 36609,
	CREATURE_DEFILE = 38757,
	CREATURE_RAGING_SPIRIT = 36701,
	CREATURE_TRIGGER = 30494,
	CREATURE_SHAMBLING_HORROR = 37698,
	CREATURE_TERENAS_MENETHIL = 36823,
	CREATURE_SPIRIT_WARDEN = 36824,
};

enum Models
{
	MODEL_INVISIBLE = 11686,
};

enum LichKingSpells
{
	SPELL_SUMMON_SHAMBLING_HORROR = 70372,
	SPELL_SUMMON_DRUDGE_GHOULS = 70358,
	SPELL_SUMMON_ICE_SPEHERE = 69104,
	SPELL_SUMMON_RAGING_SPIRIT = 69200,
	SPELL_SUMMON_VALKYR = 69037,
	SPELL_SUMMON_DEFILE = 72754,
	SPELL_SUMMON_VILE_SPIRIT = 70498,
	SPELL_SUMMON_BROKEN_FROSTMOURNE = 72406,
	SPELL_INFEST_10_NORMAL = 70541,
	SPELL_INFEST_25_NORMAL = 73779,
	SPELL_INFEST_10_HEROIC = 73780,
	SPELL_INFEST_25_HEROIC = 73781,
	SPELL_NECROTIC_PLAGUE = 70338,
	SPELL_PLAGUE_SIPHON = 74074,
	SPELL_REMORSELES_WINTER = 68981,
	SPELL_PAIN_AND_SUFFERING = 72133,
	SPELL_SOUL_REAPER = 73798,
	SPELL_HARVEST_SOUL_TELEPORT = 71372,
	SPELL_HARVEST_SOULS = 74325,
	SPELL_QUAKE = 72262,
	SPELL_CHANNEL_KING = 71769,
	SPELL_BROKEN_FROSTMOURNE = 72398,
	SPELL_BOOM_VISUAL = 72726,
	SPELL_ICEBLOCK_TRIGGER = 71614,
	SPELL_TIRION_LIGHT = 71797,
	SPELL_FROSTMOURNE_TRIGGER = 72405,
	SPELL_DISENGAGE = 61508,
	SPELL_FURY_OF_FROSTMOURNE = 70063,
	SPELL_REVIVE_VISUAL = 37755,
	SPELL_REVIVE = 51918,
	SPELL_CLONE_PLAYER = 57507,
	SPELL_BERSERK = 26662,
	SPELL_RAGING_SPIRIT_VISUAL = 69198,
	SPELL_DAMAGE_DEFILE = 72743,
	SPELL_SPAWN_DEFILE = 72762,
	SPELL_ICE_SPHERE_VISUAL = 69090,
	SPELL_ICE_PULSE = 69091,
	SPELL_ICE_BURST = 69108,
	SPELL_SHOCKWAVE = 72149,
	SPELL_ENRAGE = 72143,
	SPELL_FRENZY = 28747,
	SPELL_DARK_HUNGER = 69383,
	SPELL_DESTROY_SOUL = 69397,
	SPELL_SOUL_RIP = 74086,
	SPELL_HEAL = 67290,       // Feel free to remove this thing - not blizzlike but adds to the overall fun of the encounter - for Terenas to only have one spell and hit like a girl seemed retarded.
};
enum DefileDamage
{
	DEFILE_N_10_DAMAGE = 3000,
	DEFILE_N_25_DAMAGE = 5000,
};

#define MOVIE_ID_ARTHAS_DEATH 16

#define SPELL_HARVEST1        RAID_MODE(72372, 74326, 72372, 74326)
#define SPELL_HARVEST2        73655
#define SPELL_LIGHT_FAVOR     69382
#define SPELL RESTORE_SOUL    72595

const Position MovePosition = {461.792633, -2125.855957, 1040.860107};
const Position MoveEndingPosition = {503.156525, -2124.516602, 1040.860107};
const Position MoveTirionFrostmourne = {490.110779, -2124.989014, 1040.860352};
const Position MoveTirionAttack = {478.333466, -2124.618652, 1040.859863};
const Position ValkyrMoveMent = {498.004486, 2201.573486, 1046.093872};

struct Locations
{
	float x,y,z;
};

static Locations TeleportPoint[]=
{
	{959.996, 212.576, 193.843},
	{932.537, 231.813, 193.838},
	{958.675, 254.767, 193.822},
	{946.955, 201.316, 192.535},
	{944.294, 149.676, 197.551},
	{930.548, 284.888, 193.367},
	{965.997, 278.398, 195.777}
};

Creature* pLichKing;
Creature* pTirion;
Creature* pFather;
Creature* pFrostmourne;
Creature* pSafeZone;
Creature* pMenethil;
Creature* pWarden;
Unit* Plagued;
std::vector<Unit*> targets;

class boss_the_lich_king : public CreatureScript
{
public:
	boss_the_lich_king() : CreatureScript("boss_the_lich_king") { }

	struct boss_lich_kingAI : public ScriptedAI
	{
		boss_lich_kingAI(Creature* pCreature) : ScriptedAI(pCreature), summons(me)
		{
			m_pInstance = pCreature->GetInstanceScript();
			pLichKing = me;
		}

		InstanceScript* m_pInstance;

		uint32 m_uiEndingTimer;
		uint32 m_uiEndingPhase;
		uint32 m_uiPhase;
		uint32 m_uiTirionSpawnTimer;
		uint32 m_uiSummonShamblingHorrorTimer;
		uint32 m_uiSummonDrudgeGhoulsTimer;
		uint32 m_uiInfestTimer;
		uint32 m_uiNecroticPlagueTimer;
		uint32 m_uiPlagueSiphonTimer;
		uint32 m_uiBerserkTimer;
		uint32 m_uiSummonValkyrTimer;
		uint32 m_uiSoulReaperTimer;
		uint32 m_uiDefileTimer;
		uint32 m_uiHarvestSoulTimer;
		uint32 m_uiSummonVileSpiritTimer;
		uint32 m_uiFrostGramPortTimer;
		uint32 m_uiRemorselesWinterTimer;
		uint32 m_uiPainandSufferingTimer;
		uint32 m_uiQuakeTimer;
		uint32 m_uiIcePulsSummonTimer;
		uint32 m_uiSummonSpiritTimer;
		uint32 m_uiRandomSpeechTimer;
		uint32 m_uiResetTimer;

		uint8 necroticstack;

		bool TriggerSpawned;
		bool SwitchPhase1;
		bool SwitchPhase2;
		bool DeathPhase;

		SummonList summons;

		void Reset()
		{
			me->SetReactState(REACT_PASSIVE);

			m_uiPhase = 0;
			m_uiRandomSpeechTimer = 33000;
			m_uiBerserkTimer = 900000;
			m_uiSummonShamblingHorrorTimer = 20000;
			m_uiSummonDrudgeGhoulsTimer = 20000;
			m_uiInfestTimer = 30000;
			m_uiNecroticPlagueTimer = 30000;
			m_uiPlagueSiphonTimer = 5000;
			m_uiTirionSpawnTimer = 5000;
			m_uiRemorselesWinterTimer = 5000;
			m_uiQuakeTimer = 70000;
			m_uiIcePulsSummonTimer = 10000;
			m_uiPainandSufferingTimer = 10000;
			m_uiSummonSpiritTimer = 18000;
			m_uiSummonValkyrTimer = 20000;
			m_uiSoulReaperTimer = 15000;
			m_uiDefileTimer = 25000;
			m_uiInfestTimer = 40000;
			m_uiSummonVileSpiritTimer = 30000;
			m_uiHarvestSoulTimer = 70000;
			m_uiFrostGramPortTimer = 900000;

			TriggerSpawned = false;
			SwitchPhase1 = false;
			SwitchPhase2 = false;
			DeathPhase = false;

			if(m_pInstance)
				m_pInstance->SetData(DATA_LICH_KING_EVENT, NOT_STARTED);

			if(summons.empty())
				return;

			summons.DespawnAll();

			me->SetSpeed(MOVE_RUN, 1.8f);
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISARMED);
		}

		void EnterCombat(Unit* pWho)
		{
			DoScriptText(SAY_AGGRO_KING, me);
			m_uiPhase = 1;
		}

		void JustDied(Unit* pKiller)
		{
			DoScriptText(SAY_DEATH_KING, me);

			Map::PlayerList const &PlList = me->GetMap()->GetPlayers();

			if (PlList.isEmpty())
				return;

			for (Map::PlayerList::const_iterator i = PlList.begin(); i != PlList.end(); ++i)
			{
				if (Player* pPlayer = i->getSource())
				{
					pPlayer->SendMovieStart(16);
				}
			}

			if(m_pInstance)
				m_pInstance->SetData(DATA_LICH_KING_EVENT, DONE);
		}

		void JustReachedHome()
		{
			if(m_pInstance)
				m_pInstance->SetData(DATA_LICH_KING_EVENT, FAIL);
		}

		void KilledUnit(Unit *victim)
		{
			if(!DeathPhase)
				DoScriptText(RAND(SAY_KILL_1,SAY_KILL_2), me);
		}

		void JustSummoned(Creature *pSummoned)
		{
			if (pSummoned->GetEntry() == CREATURE_ICE_SPHERE)

				if(Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,1))
				{
					pSummoned->AI()->AttackStart(pTarget);
				}
		}

		void SetEnding()
		{
			m_uiEndingTimer = 4000;
			m_uiEndingPhase = 1;
			EndingPhase();
		}

		void Phasenswitch()
		{
			me->SetReactState(REACT_PASSIVE);
			me->AttackStop();
			me->GetMotionMaster()->MovePoint(0, MoveEndingPosition);
		}

		void KingEnding(uint32 uiTimer)
		{
			m_uiEndingTimer = uiTimer;
			++m_uiEndingPhase;
		}

		void NecroticJump()
		{
			DoCast(me, SPELL_PLAGUE_SIPHON);
			Plagued->RemoveAura(SPELL_NECROTIC_PLAGUE);
			Map* pMap = me->GetMap();
			Map::PlayerList const &PlayerList = pMap->GetPlayers();
			for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
				if (Player* i_pl = i->getSource())
					if (i_pl->isAlive() && Plagued->IsWithinDistInMap(i_pl, 10))
						if (i_pl != Plagued)
							targets.push_back(i_pl);
			std::list<Creature*> HorrorList;
			Trinity::AllCreaturesOfEntryInRange checker(me, CREATURE_SHAMBLING_HORROR, 10.0f);
			Trinity::CreatureListSearcher<Trinity::AllCreaturesOfEntryInRange> searcher(me, HorrorList, checker);
			me->VisitNearbyObject(10.0f, searcher);
			if(!HorrorList.empty())
				for (std::list<Creature*>::iterator itr = HorrorList.begin(); itr != HorrorList.end(); ++itr)
					if (!Plagued->IsWithinDistInMap((*itr),10))
						HorrorList.remove(*itr);
			uint8 total = targets.size() + HorrorList.size();
			uint8 rnd = rand()%total;
			if (rnd)
			{
				if (rnd <= targets.size())
				{
					std::vector<Unit*>::iterator itr = targets.begin();
					for(uint32 i = 0; i < rnd; ++i)
						++itr;
					me->AddAura(SPELL_NECROTIC_PLAGUE, (*itr));
					me->SetAuraStack(SPELL_NECROTIC_PLAGUE, (*itr), necroticstack);
					Plagued = (*itr);
				}
				else
				{
					rnd -= targets.size();
					std::list<Creature*>::iterator itr = HorrorList.begin();
					for(uint32 i = 0; i < rnd; ++i)
						++itr;
					me->AddAura(SPELL_NECROTIC_PLAGUE, (*itr));
					me->SetAuraStack(SPELL_NECROTIC_PLAGUE, (*itr), necroticstack);
					Plagued = (*itr);
				}
			}
			targets.clear();
			HorrorList.clear();
		}

		void Frostmourn()
		{
			Map* pMap = me->GetMap();
			Map::PlayerList const &PlayerList = pMap->GetPlayers();
			for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
				if (Player* i_pl = i->getSource())
					if (i_pl->isAlive() && i_pl->HasAura(SPELL_HARVEST2))
						i_pl->TeleportTo(pMenethil->GetMapId(), pMenethil->GetPositionX(),pMenethil->GetPositionY(),pMenethil->GetPositionZ(), 0, TELE_TO_NOT_LEAVE_COMBAT);
		}

		void UpdateAI(const uint32 uiDiff)
		{

			if(!UpdateVictim())
				return;

			if (m_uiResetTimer <= uiDiff)
			{
				if (me->GetDistance2d(me->GetHomePosition().GetPositionX(), me->GetHomePosition().GetPositionY()) > 80)
					EnterEvadeMode();
				m_uiResetTimer = 5000;
			} else m_uiResetTimer -= uiDiff;

			if(!DeathPhase)
			{
				if (m_uiRandomSpeechTimer < uiDiff)
				{
					DoScriptText(RAND(SAY_RANDOM_1,SAY_RANDOM_2), me);
					m_uiRandomSpeechTimer = 33000;
				} else m_uiRandomSpeechTimer -= uiDiff;
			}

			if (m_uiBerserkTimer < uiDiff)
			{
				DoScriptText(SAY_BERSERK, me);
				DoCast(me, SPELL_BERSERK);
				m_uiBerserkTimer = 900000;
			}
			else m_uiBerserkTimer -= uiDiff;

			if(m_uiPhase == 1)
			{
				if (m_uiInfestTimer < uiDiff)
				{
					Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,1);
					DoCast(pTarget, RAID_MODE(SPELL_INFEST_10_NORMAL,SPELL_INFEST_25_NORMAL,SPELL_INFEST_10_HEROIC,SPELL_INFEST_25_HEROIC));
					if (pTarget->GetHealth()*100 / pTarget->GetMaxHealth() < 90)
					{
						std::list<HostileReference*> ThreatList = me->getThreatManager().getThreatList();
						for (std::list<HostileReference*>::const_iterator itr = ThreatList.begin(); itr != ThreatList.end(); ++itr)
						{
							Unit *pTarget = Unit::GetUnit(*me, (*itr)->getUnitGuid());
							if (!pTarget || pTarget->GetTypeId() != TYPEID_PLAYER)
								continue;

							Aura *AuraInfest = pTarget->GetAura(RAID_MODE(SPELL_INFEST_10_NORMAL,SPELL_INFEST_25_NORMAL,SPELL_INFEST_10_HEROIC,SPELL_INFEST_25_HEROIC));
							if (AuraInfest && AuraInfest->GetStackAmount() > 0)
							{
								for (uint32 i = 0; i < 1; ++i)
									pTarget->RemoveAuraFromStack((RAID_MODE(SPELL_INFEST_10_NORMAL,SPELL_INFEST_25_NORMAL,SPELL_INFEST_10_HEROIC,SPELL_INFEST_25_HEROIC)), 0, AURA_REMOVE_BY_DEFAULT);
							}
						}
					}
					m_uiInfestTimer = 30000;
				} else m_uiInfestTimer -= uiDiff;

				if (m_uiSummonDrudgeGhoulsTimer < uiDiff)
				{
					DoCast(SPELL_SUMMON_DRUDGE_GHOULS);
					m_uiSummonDrudgeGhoulsTimer = 20000;
				} else m_uiSummonDrudgeGhoulsTimer -= uiDiff;

				if (m_uiSummonShamblingHorrorTimer < uiDiff)
				{
					DoCast(me, SPELL_SUMMON_SHAMBLING_HORROR);
					m_uiSummonShamblingHorrorTimer = 40000;
				} else m_uiSummonShamblingHorrorTimer -= uiDiff;

				if (m_uiNecroticPlagueTimer < uiDiff && !Plagued)
				{
					Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,1);
					DoCast(pTarget, SPELL_NECROTIC_PLAGUE);
					Plagued = pTarget;
					necroticstack = 1;
					m_uiNecroticPlagueTimer = 5000;
				} else m_uiNecroticPlagueTimer -= uiDiff;

				if (Plagued)
					if (!Plagued->isAlive())
					{
						necroticstack++;
						NecroticJump();
					}
					else
					{
						if (!Plagued->HasAura(SPELL_NECROTIC_PLAGUE) && necroticstack == 1)
						{
							necroticstack++;
							NecroticJump();
						}
					}

					if (Plagued->HasAura(SPELL_NECROTIC_PLAGUE) && Plagued->GetAura(SPELL_NECROTIC_PLAGUE)->GetStackAmount() < necroticstack)
					{
						necroticstack--;
						NecroticJump();
					}

			}

			if(m_uiPhase == 2)
			{
				if (m_uiRemorselesWinterTimer < uiDiff)
				{
					DoScriptText(SAY_REMORSELESS_WINTER, me);
					DoCast(me, SPELL_REMORSELES_WINTER);
					m_uiRemorselesWinterTimer = 90000;
				} else m_uiRemorselesWinterTimer -= uiDiff;

				if (m_uiSummonSpiritTimer < uiDiff)
				{
					Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,1);
					DoCast(pTarget, SPELL_SUMMON_RAGING_SPIRIT);
					m_uiSummonSpiritTimer = 16000;
				} else m_uiSummonSpiritTimer -= uiDiff;

				if (m_uiIcePulsSummonTimer < uiDiff)
				{
					DoCast(SPELL_SUMMON_ICE_SPEHERE);
					m_uiIcePulsSummonTimer = 15000;
				} else m_uiIcePulsSummonTimer -= uiDiff;

				if (m_uiPainandSufferingTimer < uiDiff)
				{
					Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 1);
					DoCast(pTarget, SPELL_PAIN_AND_SUFFERING);
					m_uiPainandSufferingTimer = 2000;
				} else m_uiPainandSufferingTimer -= uiDiff;

				if (m_uiQuakeTimer < uiDiff)
				{
					DoScriptText(SAY_BROKEN_ARENA, me);
					DoCast(SPELL_QUAKE);
					me->SetReactState(REACT_AGGRESSIVE);
					me->GetMotionMaster()->Clear();
					me->GetMotionMaster()->MoveChase(me->getVictim());
					m_uiPhase = 3;

				} else m_uiQuakeTimer -= uiDiff;
			}

			if(m_uiPhase == 3)
			{
				if (m_uiDefileTimer < uiDiff)
				{
					Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,1);
					DoCast(pTarget, SPELL_SPAWN_DEFILE);
					m_uiDefileTimer = 20000;
				} else m_uiDefileTimer -= uiDiff;

				if (m_uiSummonValkyrTimer < uiDiff)
				{
					DoScriptText(SAY_SUMMON_VALKYR, me);
					me->SummonCreature(CREATURE_VALKYR, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ()+10, 0, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 99999999);
					//DoCast(me, SPELL_SUMMON_VALKYR);
					m_uiSummonValkyrTimer = 20000;
				} else m_uiSummonValkyrTimer -= uiDiff;

				if (m_uiSoulReaperTimer < uiDiff)
				{
					DoCast(me->getVictim(), SPELL_SOUL_REAPER);
					m_uiSoulReaperTimer = 20000;
				} else m_uiSoulReaperTimer -= uiDiff;

				if (m_uiInfestTimer < uiDiff)
				{
					DoCast(me->getVictim(), RAID_MODE(SPELL_INFEST_10_NORMAL,SPELL_INFEST_25_NORMAL,SPELL_INFEST_10_HEROIC,SPELL_INFEST_25_HEROIC));
					m_uiInfestTimer = 30000;
				} else m_uiInfestTimer -= uiDiff;
			}

			if(m_uiPhase == 4)
			{
				if (m_uiRemorselesWinterTimer < uiDiff)
				{
					DoScriptText(SAY_REMORSELESS_WINTER, me);
					DoCast(me, SPELL_REMORSELES_WINTER);
					m_uiRemorselesWinterTimer = 90000;
				} else m_uiRemorselesWinterTimer -= uiDiff;

				if (m_uiSummonSpiritTimer < uiDiff)
				{
					Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,1);
					DoCast(pTarget, SPELL_SUMMON_RAGING_SPIRIT);
					m_uiSummonSpiritTimer = 16000;
				} else m_uiSummonSpiritTimer -= uiDiff;

				if (m_uiIcePulsSummonTimer < uiDiff)
				{
					DoCast(me, SPELL_SUMMON_ICE_SPEHERE);
					m_uiIcePulsSummonTimer = 15000;
				} else m_uiIcePulsSummonTimer -= uiDiff;

				if (m_uiPainandSufferingTimer < uiDiff)
				{
					Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 1);
					DoCast(pTarget, SPELL_PAIN_AND_SUFFERING);
					m_uiPainandSufferingTimer = 3000;
				} else m_uiPainandSufferingTimer -= uiDiff;

				if (m_uiQuakeTimer < uiDiff)
				{
					DoScriptText(SAY_BROKEN_ARENA, me);
					DoCast(me, SPELL_QUAKE);
					me->SetReactState(REACT_AGGRESSIVE);
					me->GetMotionMaster()->Clear();
					me->GetMotionMaster()->MoveChase(me->getVictim());
					m_uiPhase = 5;
				} else m_uiQuakeTimer -= uiDiff;
			}

			if(m_uiPhase == 5)
			{
				if (m_uiSummonVileSpiritTimer < uiDiff)
				{
					DoCast(me, SPELL_SUMMON_VILE_SPIRIT);
					m_uiSummonVileSpiritTimer = 30000;
				} else m_uiSummonVileSpiritTimer -= uiDiff;

				if (m_uiHarvestSoulTimer < uiDiff)
				{
					DoScriptText(SAY_HARVEST_SOUL, me);
					Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 1);
					DoCast(pTarget, SPELL_HARVEST_SOULS);
					Frostmourn();
					m_uiHarvestSoulTimer = 25000;
				} else m_uiHarvestSoulTimer -= uiDiff;
			}

			DoMeleeAttackIfReady();

			if (m_uiEndingTimer <= uiDiff)
				EndingPhase();
			else m_uiEndingTimer -= uiDiff;

			if(HealthBelowPct(70))
			{
				if(!SwitchPhase1)
				{
					m_uiPhase = 2;
					Phasenswitch();
					SwitchPhase1 = true;
				}
			}

			if(HealthBelowPct(40))
			{
				if(!SwitchPhase2)
				{
					m_uiPhase = 4;
					m_uiRemorselesWinterTimer = 5000;
					m_uiQuakeTimer = 70000;
					m_uiIcePulsSummonTimer = 10000;
					m_uiPainandSufferingTimer = 10000;
					m_uiSummonSpiritTimer = 18000;
					Phasenswitch();
					SwitchPhase2 = true;
				}
			}

			if(HealthBelowPct(11))
			{
				if(!TriggerSpawned)
				{
					pSafeZone = me->SummonCreature(CREATURE_TRIGGER, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), 0, TEMPSUMMON_CORPSE_DESPAWN, 360000);
					pSafeZone->AI()->AttackStart(me);
					pSafeZone->SetDisplayId(MODEL_INVISIBLE);
					TriggerSpawned = true;
				} }

			if(me->GetHealth()*100 / me->GetMaxHealth() < 10)
			{
				if(!DeathPhase)
				{
					m_uiPhase = 6;
					DeathPhase = true;
					SetEnding();
				}
			}
		}

		void ReviveCinematic()
		{
			Map::PlayerList const &PlList = pFather->GetMap()->GetPlayers();

			if (PlList.isEmpty())
				return;

			for (Map::PlayerList::const_iterator i = PlList.begin(); i != PlList.end(); ++i)
			{
				if (Player* pPlayer = i->getSource())
				{
					if (pPlayer && pPlayer->isDead())
					{
						pFather->CastSpell(pPlayer, 26687, true);
						pPlayer->ResurrectPlayer(100, false);
					}
				}
			}
		}

		void EndingPhase()
		{
			if( m_uiEndingTimer )
			{
				switch(m_uiEndingPhase)
				{
				case 1:
					me->GetMotionMaster()->MoveIdle();
					me->SetReactState(REACT_PASSIVE);
					me->AttackStop();
					me->CastStop();
					DoResetThreat();
					DoScriptText(SAY_10_PROZENT, me);
					DoCastAOE(SPELL_FURY_OF_FROSTMOURNE);
					KingEnding(5000);
					break;
				case 2:
					KingEnding(10000);
					break;
				case 3:
					DoScriptText(SAY_ENDING_1_KING, me);
					KingEnding(24000);
					break;
				case 4:
					DoScriptText(SAY_ENDING_2_KING, me);
					KingEnding(25000);
					break;
				case 5:
					me->GetMotionMaster()->MovePoint(0, MoveEndingPosition);
					KingEnding(4000);
					break;
				case 6:
					DoCastAOE(SPELL_CHANNEL_KING);
					DoScriptText(SAY_ENDING_3_KING, me);
					KingEnding(26000);
					break;
				case 7:
					DoScriptText(SAY_ENDING_4_KING, me);
					KingEnding(9000);
					break;
				case 8:
					DoScriptText(SAY_ENDING_5_TIRION, pTirion);
					KingEnding(9000);
					break;
				case 9:
					DoCast(pTirion, SPELL_TIRION_LIGHT);
					KingEnding(5000);
					break;
				case 10:
					pTirion->RemoveAurasDueToSpell(SPELL_ICEBLOCK_TRIGGER);
					KingEnding(2000);
					break;
				case 11:
					pTirion->GetMotionMaster()->MovePoint(0, MoveTirionFrostmourne);
					KingEnding(1000);
					break;
				case 12:
					pTirion->GetMotionMaster()->MoveJump(517.482910, -2124.905762, 1040.861328, 10.0f, 15.0f); //pTirion->JumpTo(pFrostmourne, 15.0f);
					pTirion->SetUInt32Value(UNIT_NPC_EMOTESTATE, 375);
					KingEnding(1000);
					break;
				case 13:
					me->RemoveAura(SPELL_CHANNEL_KING);
					me->CastSpell(me, SPELL_BOOM_VISUAL, false);
					KingEnding(300);
					break;
				case 14:
					me->CastSpell(me, SPELL_SUMMON_BROKEN_FROSTMOURNE, false);
					KingEnding(3000);
					break;
				case 15:
					me->CastSpell(me, 73017, false);
					KingEnding(1000);
					break;
				case 16:
					DoScriptText(SAY_ENDING_6_KING, me);
					KingEnding(3000);
					break;
				case 17:
					pFrostmourne = me->SummonCreature(27880, me->GetPositionX()+2, me->GetPositionY()+2, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 99999999);
					pFrostmourne->CastSpell(pFrostmourne, SPELL_BROKEN_FROSTMOURNE, false);
					pFrostmourne->CastSpell(pFrostmourne, SPELL_FROSTMOURNE_TRIGGER, false);
					pFrostmourne->GetMotionMaster()->MoveChase(me);
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISARMED);
					//pTirion->CastSpell(pTirion, SPELL_DISENGAGE, false);
					KingEnding(2000);
					break;
				case 18:
					me->RemoveAllAuras();
					me->RemoveAura(SPELL_SUMMON_BROKEN_FROSTMOURNE);
					DoScriptText(SAY_ENDING_7_KING, me);
					me->SetUInt32Value(UNIT_NPC_EMOTESTATE, 473);
					KingEnding(5000);
					break;
				case 19:
					DoScriptText(SAY_ENDING_8_TIRION, pTirion);
					KingEnding(6000);
					break;
				case 20:
					pFather = me->SummonCreature(CREAUTRE_MENETHIL, me->GetPositionX()+5, me->GetPositionY()+5, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 9999999);
					DoScriptText(SAY_ENDING_9_FATHER, pFather);
					ReviveCinematic();
					KingEnding(6000);
					break;
				case 21:
					DoScriptText(SAY_ENDING_11_FATHER, pFather);
					pFather->CastSpell(pFather, SPELL_REVIVE_VISUAL, false);
					KingEnding(6000);
					break;
				case 22:
					DoScriptText(SAY_ENDING_10_TIRION, pTirion);
					KingEnding(5000);
					break;
				case 23:
					DoScriptText(SAY_ENDING_12_KING, me);
					//pTirion->SetReactState(REACT_AGGRESSIVE);
					//pTirion->AI()->AttackStart(me);
					//pFather->AI()->AttackStart(me);
					KingEnding(5000);
					break;
				}
			}
		}
	};

	CreatureAI* GetAI_boss_lich_king(Creature* pCreature) const
	{
		return new boss_lich_kingAI(pCreature);
	}

};

class npc_tirion_icc : public CreatureScript
{
public:
	npc_tirion_icc() : CreatureScript("npc_tirion_icc") { }

	struct npc_tirion_citadell_iccAI : public ScriptedAI
	{
		npc_tirion_citadell_iccAI(Creature* pCreature) : ScriptedAI(pCreature)
		{
			m_pInstance = (InstanceScript*)pCreature->GetInstanceScript();
			pTirion = me;
		}

		InstanceScript* m_pInstance;

		uint32 m_uiIntroTimer;
		uint32 m_uiIntroPhase;

		void Reset()
		{
			m_uiIntroTimer = 0;
			m_uiIntroPhase = 0;

			me->SetReactState(REACT_PASSIVE);
			me->SetSpeed(MOVE_RUN, 1.8f);
			me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
		}

		void StartEvent()
		{
			m_uiIntroTimer = 1000;
			m_uiIntroPhase = 1;
			Intro();
		}

		void KingIntro(uint32 uiTimer)
		{
			m_uiIntroTimer = uiTimer;
			++m_uiIntroPhase;
		}

		void Intro()
		{
			if( m_uiIntroTimer )
			{
				switch( m_uiIntroPhase )
				{
				case 1:
					if(m_pInstance)
						m_pInstance->SetData(DATA_LICH_KING_EVENT, IN_PROGRESS);
					pLichKing->SetStandState(UNIT_STAND_STATE_STAND);
					pLichKing->AddUnitMovementFlag(MOVEMENTFLAG_WALKING);
					pLichKing->SetSpeed(MOVE_WALK, 1.2f);
					pLichKing->GetMotionMaster()->MovePoint(0, MovePosition);
					me->SetUInt32Value(UNIT_NPC_EMOTESTATE, 375);
					KingIntro(3000);
					break;
				case 2:
					pLichKing->SetUInt32Value(UNIT_NPC_EMOTESTATE, 1);
					DoScriptText(SAY_INTRO_1_KING, pLichKing);
					KingIntro(14000);
					break;
				case 3:
					pLichKing->SetUInt32Value(UNIT_NPC_EMOTESTATE, 0);
					DoScriptText(SAY_INTRO_2_TIRION, me);
					KingIntro(9000);
					break;
				case 4:
					DoScriptText(SAY_INTRO_3_KING, pLichKing);
					pLichKing->SetUInt32Value(UNIT_NPC_EMOTESTATE, 392);
					KingIntro(3000);
					break;
				case 5:
					pLichKing->SetUInt32Value(UNIT_NPC_EMOTESTATE, 397);
					KingIntro(2000);
					break;
				case 6:
					pLichKing->SetUInt32Value(UNIT_NPC_EMOTESTATE, 0);
					KingIntro(21000);
					break;
				case 7:
					me->SetUInt32Value(UNIT_NPC_EMOTESTATE, 397);
					DoScriptText(SAY_INTRO_4_TIRION, me);
					KingIntro(1000);
					break;
				case 8:
					me->SetUInt32Value(UNIT_NPC_EMOTESTATE, 0);
					me->GetMotionMaster()->MovePoint(0, MoveTirionAttack);
					KingIntro(4000);
					break;
				case 9:
					me->CastSpell(pLichKing, SPELL_ICEBLOCK_TRIGGER, false);
					KingIntro(2000);
					break;
				case 10:
					pLichKing->SetUInt32Value(UNIT_NPC_EMOTESTATE, 1);
					DoScriptText(SAY_INTRO_5_KING, pLichKing);
					KingIntro(12000);
					break;
				case 11:
					pLichKing->SetUInt32Value(UNIT_NPC_EMOTESTATE, 0);
					pLichKing->SetReactState(REACT_AGGRESSIVE);
					KingIntro(6000);
					break;
				}
			}
		}

		void UpdateAI(const uint32 uiDiff)
		{
			if (m_uiIntroTimer <= uiDiff)
				Intro();
			else m_uiIntroTimer -= uiDiff;

			if (m_pInstance)
				if(m_pInstance->GetData(DATA_LICH_KING_EVENT) != NOT_STARTED)
				{
					me->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
				}
		}
	};

	CreatureAI* GetAI_npc_tirion_citadell_icc(Creature* pCreature) const
	{
		return new npc_tirion_citadell_iccAI(pCreature);
	}

	bool OnGossipSelect_tirion_icc(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
	{
		if (uiAction == GOSSIP_ACTION_INFO_DEF+1)
		{
			pCreature->RemoveFlag(UNIT_NPC_FLAGS,UNIT_NPC_FLAG_GOSSIP);
			pPlayer->CLOSE_GOSSIP_MENU();
			((npc_tirion_citadell_iccAI*)pCreature->AI())->StartEvent();
		}
		return true;
	}

	bool OnGossipHello_tirion_icc(Player* pPlayer, Creature* pCreature)
	{
		pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_START_EVENT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
		pPlayer->SEND_GOSSIP_MENU(10600, pCreature->GetGUID());
		return true;
	}
};

class npc_ice_puls_icc : public CreatureScript
{
public:
	npc_ice_puls_icc() : CreatureScript("npc_ice_puls_icc") { }

	struct npc_ice_puls_iccAI : public ScriptedAI
	{
		npc_ice_puls_iccAI(Creature *pCreature) : ScriptedAI(pCreature)
		{
			DoCast(me, SPELL_ICE_SPHERE_VISUAL);
		}

		uint32 m_uiIcePulseTimer;
		uint32 m_uiIceBurstCheckTimer;

		void Reset()
		{
			m_uiIcePulseTimer = 2000;
			m_uiIceBurstCheckTimer = 2000;
			me->SetSpeed(MOVE_WALK, 0.25f, true);
			me->SetSpeed(MOVE_RUN, 0.25f, true);
		}

		void EnterCombat(Unit *who)
		{
			DoZoneInCombat();
		}

		void UpdateAI(const uint32 uiDiff)
		{
			if (!UpdateVictim())
				return;

			if (me->getVictim()->GetTypeId() != TYPEID_PLAYER)
				return;

			if (m_uiIcePulseTimer < uiDiff)
			{
				DoCast(me, SPELL_ICE_PULSE);
			} else m_uiIcePulseTimer -= uiDiff;

			if (m_uiIceBurstCheckTimer < uiDiff)
			{
				if (me->IsWithinDistInMap(me->getVictim(), 3))
					DoCast(me, SPELL_ICE_BURST);
				m_uiIceBurstCheckTimer = 2000;
			} else m_uiIceBurstCheckTimer -= uiDiff;
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_ice_puls_iccAI(pCreature);
	}

};

class npc_valkyr_icc : public CreatureScript
{
public:
	npc_valkyr_icc() : CreatureScript("npc_valkyr_icc") { }

	struct npc_valkyr_iccAI : public ScriptedAI
	{
		npc_valkyr_iccAI(Creature *pCreature) : ScriptedAI(pCreature), vehicle(me->GetVehicleKit())
		{
			assert(vehicle);
		}

		uint32 m_uiGrabTimer;
		uint32 m_uiMovementTimer;
		uint32 m_uiFallPlayerTimer;

		bool InVehicle;
		bool OutVehicle;

		Vehicle *vehicle;

		void Reset()
		{
			me->SetFlying(true);
			m_uiGrabTimer = 2000;
			m_uiMovementTimer = 3000;
			m_uiFallPlayerTimer = 10000;

			InVehicle = false;
			OutVehicle = false;
		}

		void EnterCombat(Unit *who)
		{
			DoZoneInCombat();
		}

		void UpdateAI(const uint32 uiDiff)
		{
			if (!UpdateVictim())
				return;

			if (m_uiGrabTimer < uiDiff)
			{
				if(!InVehicle)
				{
					if(Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 1))
					{
						pTarget->EnterVehicle(vehicle);
						InVehicle = true;
					}
				}
				m_uiGrabTimer = 120000;
			} else m_uiGrabTimer -= uiDiff;

			if (m_uiMovementTimer < uiDiff)
			{
				me->GetMotionMaster()->MovePoint(0, ValkyrMoveMent);
				m_uiMovementTimer = 120000;
			} else m_uiMovementTimer -= uiDiff;

			if (m_uiFallPlayerTimer < uiDiff)
			{
				if(!OutVehicle)
				{
					vehicle->RemoveAllPassengers();
					OutVehicle = true;
				}
				m_uiFallPlayerTimer = 120000;
			} else m_uiFallPlayerTimer -= uiDiff;
		}
	};

	CreatureAI *GetAI(Creature* pCreature) const
	{
		return new npc_valkyr_iccAI(pCreature);
	}

};

class npc_ghoul_icc : public CreatureScript
{
public:
	npc_ghoul_icc() : CreatureScript("npc_ghoul_icc") { }

	struct npc_ghoul_iccAI : public ScriptedAI
	{
		npc_ghoul_iccAI(Creature *pCreature) : ScriptedAI(pCreature)
		{
		}

		uint32 m_uiLifeTimer;
		uint32 m_uiAggroTimer;

		bool m_bIsLife;
		bool m_bIsAggroTimer;

		void Reset()
		{
			m_uiLifeTimer = 1000;
			m_uiAggroTimer = 4000;
			m_bIsLife = false;
			m_bIsAggroTimer = false;
		}

		void EnterCombat(Unit *who)
		{
			DoZoneInCombat();
		}

		void UpdateAI(const uint32 uiDiff)
		{
			if (!UpdateVictim())
				return;

			if (m_uiLifeTimer < uiDiff && !m_bIsLife)
			{
				me->SetUInt32Value(UNIT_NPC_EMOTESTATE, 449);
				m_bIsLife = true;
			} else m_uiLifeTimer -= uiDiff;

			if (m_uiAggroTimer < uiDiff && !m_bIsAggroTimer)
			{
				me->SetUInt32Value(UNIT_NPC_EMOTESTATE, 0);
				m_bIsAggroTimer = true;
			} else m_uiAggroTimer -= uiDiff;

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_ghoul_iccAI(pCreature);
	}

};

class npc_defile_icc : public CreatureScript
{
public:
	npc_defile_icc() : CreatureScript("npc_defile_icc") { }

	struct npc_defile_iccAI : public Scripted_NoMovementAI
	{
		npc_defile_iccAI(Creature *pCreature) : Scripted_NoMovementAI(pCreature)
		{
			m_pInstance = pCreature->GetInstanceScript();
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
		}

		InstanceScript* m_pInstance;

		uint32 m_uiDefileTimer;
		uint32 m_uiDefileDamageTimer;
		uint32 m_uiDespawnTimer;

		bool m_bIsDefile;
		bool m_bIsDespawnd;

		void Reset()
		{
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_OOC_NOT_ATTACKABLE);
			//me->SetReactState(REACT_PASSIVE);
			m_uiDefileTimer = 1000;
			m_uiDefileDamageTimer = 1000;
			m_uiDespawnTimer = 60000;
			m_bIsDefile = false;
			m_bIsDespawnd = false;
		}

		// Hack Damage Buggt :/
		void DefileDamage()
		{
			Map* pMap = me->GetMap();
			if (pMap && pMap->IsDungeon())
			{
				Map::PlayerList const &PlayerList = pMap->GetPlayers();
				for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
				{
					if (i->getSource() && i->getSource()->GetDistance2d(me) <= 20)
					{
						int32 damage = RAID_MODE(DEFILE_N_10_DAMAGE, DEFILE_N_25_DAMAGE);
						me->DealDamage(i->getSource(), damage, NULL, SPELL_DIRECT_DAMAGE, SPELL_SCHOOL_MASK_SHADOW);
					}
				}
			}
		}

		void UpdateAI(const uint32 uiDiff)
		{
			if (m_uiDefileTimer < uiDiff && !m_bIsDefile)
			{
				DoCast(me, SPELL_DAMAGE_DEFILE);
				m_bIsDefile = true;
			}
			else m_uiDefileTimer -= uiDiff;

			if (m_uiDefileDamageTimer < uiDiff)
			{
				DefileDamage();
				m_uiDefileDamageTimer = 1000;
			} else m_uiDefileDamageTimer -= uiDiff;

			if (m_uiDespawnTimer < uiDiff && !m_bIsDespawnd)
			{
				me->SetVisibility(VISIBILITY_OFF);
				me->DealDamage(me, me->GetHealth(), NULL, DIRECT_DAMAGE,SPELL_SCHOOL_MASK_NORMAL, NULL, false);
				m_bIsDespawnd = true;
			} else m_uiDespawnTimer -= uiDiff;
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_defile_iccAI (pCreature);
	}

};

class npc_raging_spirit_icc : public CreatureScript
{
public:
	npc_raging_spirit_icc() : CreatureScript("npc_raging_spirit_icc") { }

	struct npc_raging_spirit_iccAI : public ScriptedAI
	{
		npc_raging_spirit_iccAI(Creature *pCreature) : ScriptedAI(pCreature)
		{
		}

		void Reset()
		{
			DoCast(me, SPELL_RAGING_SPIRIT_VISUAL);
		}

		void EnterCombat(Unit *who)
		{
			DoZoneInCombat();
		}

		void UpdateAI(const uint32 uiDiff)
		{
			if (!UpdateVictim())
				return;
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_raging_spirit_iccAI (pCreature);
	}

};

class npc_shambling_horror : public CreatureScript
{
public:
	npc_shambling_horror() : CreatureScript("npc_shambling_horror") { }

	struct npc_shambling_horrorAI : public ScriptedAI
	{
		npc_shambling_horrorAI(Creature *pCreature) : ScriptedAI(pCreature)
		{
			m_pInstance = pCreature->GetInstanceScript();
		}

		InstanceScript* m_pInstance;

		uint32 ShockwaveTimer;
		uint32 EnrageTimer;
		uint8 heroic;

		void Reset()
		{
			ShockwaveTimer = 20000;
			EnrageTimer = 30000;
			heroic = RAID_MODE(0,0,1,1);
		}

		void EnterCombat(Unit *who)
		{
			DoZoneInCombat();
		}

		void UpdateAI(const uint32 uiDiff)
		{
			if (!UpdateVictim())
				return;

			if (ShockwaveTimer <= uiDiff)
			{
				DoCast(SPELL_SHOCKWAVE);
				ShockwaveTimer = 20000;
			} else ShockwaveTimer -= uiDiff;

			if (EnrageTimer <= uiDiff)
			{
				DoCast(me, SPELL_ENRAGE);
				EnrageTimer = 30000;
			} else EnrageTimer -= uiDiff;

			if (heroic)
				if (((me->GetHealth()*100) / me->GetMaxHealth() == 20) && !me->HasAura(SPELL_FRENZY))
					DoCast(me, SPELL_FRENZY);

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_shambling_horrorAI (pCreature);
	}

};

class npc_terenas_menethil : public CreatureScript
{
public:
	npc_terenas_menethil() : CreatureScript("npc_terenas_menethil") { }

	struct npc_terenas_menethilAI : public ScriptedAI
	{
		npc_terenas_menethilAI(Creature *pCreature) : ScriptedAI(pCreature)
		{
			m_pInstance = pCreature->GetInstanceScript();
			pMenethil = me;
		}

		InstanceScript* m_pInstance;

		uint32 LightTimer;

		void Reset()
		{
			if (!me->HasAura(SPELL_LIGHT_FAVOR))
				me->AddAura(SPELL_LIGHT_FAVOR, me);
			LightTimer = 20000;
		}

		void EnterCombat(Unit *who)
		{
			DoZoneInCombat();
		}

		void UpdateAI(const uint32 uiDiff)
		{
			if (!UpdateVictim())
				return;

			if (LightTimer <= uiDiff)
		 {
			 Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 1);
			 if (!pTarget->IsFriendlyTo(pWarden))
			 {
				 DoCast(pTarget, SPELL_HEAL);
				 LightTimer = 20000;
			 }
			} else LightTimer -= uiDiff;

			if (!pWarden->isAlive())
		 {
			 Map* pMap = me->GetMap();
			 Map::PlayerList const &PlayerList = pMap->GetPlayers();
			 for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
				 if (Player* i_pl = i->getSource())
					 if (i_pl->isAlive())
					 {
						 i_pl->RemoveAura(SPELL_HARVEST2);
						 i_pl->TeleportTo(pLichKing->GetMapId(), pLichKing->GetPositionX(),pLichKing->GetPositionY(),pLichKing->GetPositionZ(), 0, TELE_TO_NOT_LEAVE_COMBAT);
					 }
		 }

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_terenas_menethilAI (pCreature);
	}

};

class npc_spirit_warden : public CreatureScript
{
public:
	npc_spirit_warden() : CreatureScript("npc_spirit_warden") { }

	struct npc_spirit_wardenAI : public ScriptedAI
	{
		npc_spirit_wardenAI(Creature *pCreature) : ScriptedAI(pCreature)
		{
			m_pInstance = pCreature->GetInstanceScript();
			pWarden = me;
		}

		InstanceScript* m_pInstance;

		uint32 SoulRipTimer;
		uint32 DestroySoulTimer;

		void Reset()
		{
			if (!me->HasAura(SPELL_DARK_HUNGER))
				me->AddAura(SPELL_DARK_HUNGER, me);
		}

		void EnterCombat(Unit *who)
		{
			DoZoneInCombat();
			SoulRipTimer = 40000;
			DestroySoulTimer = 2000;
		}


		void UpdateAI (const uint32 uiDiff)
		{
			if (!UpdateVictim())
				return;

			if (DestroySoulTimer <= uiDiff && !pMenethil->isAlive())
			{
				Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0);
				DoCast(pTarget, SPELL_DESTROY_SOUL);
				DestroySoulTimer = 2000;
			}else DestroySoulTimer -= uiDiff;

			if (SoulRipTimer <= uiDiff)
			{
				Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0);
				DoCast(pTarget, SPELL_SOUL_RIP);
				SoulRipTimer = 35000;
			}else SoulRipTimer -= uiDiff;

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_spirit_wardenAI (pCreature);
	}
};
void AddSC_boss_lichking()
{
	new boss_the_lich_king;
	new npc_tirion_icc;
	new npc_ice_puls_icc;
	new npc_valkyr_icc;
	new npc_ghoul_icc;
	new npc_defile_icc;
	new npc_raging_spirit_icc;
	new npc_shambling_horror;
	new npc_terenas_menethil;
	new npc_spirit_warden;
}