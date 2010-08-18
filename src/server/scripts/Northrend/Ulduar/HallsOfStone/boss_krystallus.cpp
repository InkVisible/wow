/*
 * Copyright (C) 2008-2010 TrinityCore <http://www.trinitycore.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

/* Script Data Start
SDName: Boss krystallus
SDAuthor: LordVanMartin
SD%Complete:
SDComment:
SDCategory:
Script Data End */

#include "ScriptPCH.h"
#include "halls_of_stone.h"

enum Spells
{
    SPELL_BOULDER_TOSS                             = 50843,
    H_SPELL_BOULDER_TOSS                           = 59742,
    SPELL_GROUND_SPIKE                             = 59750,
    SPELL_GROUND_SLAM                              = 50827,
    SPELL_SHATTER                                  = 50810,
    H_SPELL_SHATTER                                = 61546,
    SPELL_STOMP                                    = 48131,
    H_SPELL_STOMP                                  = 59744
};

enum Yells
{
    SAY_AGGRO                                   = -1599007,
    SAY_KILL                                    = -1599008,
    SAY_DEATH                                   = -1599009,
    SAY_SHATTER                                 = -1599010
};

class boss_krystallus : public CreatureScript
{
public:
    boss_krystallus() : CreatureScript("boss_krystallus") { }

    struct boss_krystallusAI : public ScriptedAI
    {
        boss_krystallusAI(Creature *c) : ScriptedAI(c)
        {
            pInstance = c->GetInstanceScript();
        }

        uint32 uiBoulderTossTimer;
        uint32 uiGroundSpikeTimer;
        uint32 uiGroundSlamTimer;
        uint32 uiShatterTimer;
        uint32 uiStompTimer;

        bool bIsSlam;

        InstanceScript* pInstance;

        void Reset()
        {
            bIsSlam = false;

            uiBoulderTossTimer = 3000 + rand()%6000;
            uiGroundSpikeTimer = 9000 + rand()%5000;
            uiGroundSlamTimer = 15000 + rand()%3000;
            uiStompTimer = 20000 + rand()%9000;
            uiShatterTimer = 0;

            if (pInstance)
                pInstance->SetData(DATA_KRYSTALLUS_EVENT, NOT_STARTED);
        }
        void EnterCombat(Unit* who)
        {
            DoScriptText(SAY_AGGRO, me);

            if (pInstance)
                pInstance->SetData(DATA_KRYSTALLUS_EVENT, IN_PROGRESS);
        }

        void UpdateAI(const uint32 diff)
        {
            //Return since we have no target
            if (!UpdateVictim())
                return;

            if (uiBoulderTossTimer <= diff)
            {
                if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                    DoCast(pTarget, SPELL_BOULDER_TOSS);
                uiBoulderTossTimer = 9000 + rand()%6000;
            } else uiBoulderTossTimer -= diff;

            if (uiGroundSpikeTimer <= diff)
            {
                if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                    DoCast(pTarget, SPELL_GROUND_SPIKE);
                uiGroundSpikeTimer = 12000 + rand()%5000;
            } else uiGroundSpikeTimer -= diff;

            if (uiStompTimer <= diff)
            {
                DoCast(me, SPELL_STOMP);
                uiStompTimer = 20000 + rand()%9000;
            } else uiStompTimer -= diff;

            if (uiGroundSlamTimer <= diff)
            {
                DoCast(me, SPELL_GROUND_SLAM);
                bIsSlam = true;
                uiShatterTimer = 10000;
                uiGroundSlamTimer = 15000 + rand()%3000;
            } else uiGroundSlamTimer -= diff;

            if (bIsSlam)
            {
                if (uiShatterTimer <= diff)
                {
                    DoCast(me, SPELL_SHATTER);
                    bIsSlam = false;
                } else uiShatterTimer -= diff;
            }

            DoMeleeAttackIfReady();
        }

        void JustDied(Unit* killer)
        {
            DoScriptText(SAY_DEATH, me);

            if (pInstance)
                pInstance->SetData(DATA_KRYSTALLUS_EVENT, DONE);
        }

        void KilledUnit(Unit *victim)
        {
            if (victim == me)
                return;
            DoScriptText(SAY_KILL, me);
        }
    };

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new boss_krystallusAI (pCreature);
    }

};


void AddSC_boss_krystallus()
{
    new boss_krystallus;
}
