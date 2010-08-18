#include "ScriptPCH.h"
#include "obsidian_sanctum.h"

#define MAX_ENCOUNTER     1

/* Obsidian Sanctum encounters:
0 - Sartharion
*/

class instance_obsidian_sanctum : public InstanceMapScript
{
public:
    instance_obsidian_sanctum() : InstanceMapScript("instance_obsidian_sanctum", 615) { }

    struct instance_obsidian_sanctum_InstanceMapScript : public InstanceScript
    {
        instance_obsidian_sanctum_InstanceMapScript(Map* pMap) : InstanceScript(pMap) {Initialize();};

        uint32 m_auiEncounter[MAX_ENCOUNTER];
        uint64 m_uiSartharionGUID;
        uint64 m_uiTenebronGUID;
        uint64 m_uiShadronGUID;
        uint64 m_uiVesperonGUID;
        uint64 m_uiDiscipleOfVesperonGUID;

        bool m_bTenebronKilled;
        bool m_bShadronKilled;
        bool m_bVesperonKilled;
        bool LoadedItr;

        void Initialize()
        {
            memset(&m_auiEncounter, 0, sizeof(m_auiEncounter));

            m_uiSartharionGUID = 0;
            m_uiTenebronGUID   = 0;
            m_uiShadronGUID    = 0;
            m_uiVesperonGUID   = 0;

            m_bTenebronKilled = false;
            m_bShadronKilled = false;
            m_bVesperonKilled = false;
            LoadedItr = false;
        }

        void OnCreatureCreate(Creature* pCreature, bool add)
        {
            switch(pCreature->GetEntry())
            {
                case NPC_SARTHARION:
                    m_uiSartharionGUID = pCreature->GetGUID();
                    break;
                //three dragons below set to active state once created.
                //we must expect bigger raid to encounter main boss, and then three dragons must be active due to grid differences
                case NPC_TENEBRON:
                    m_uiTenebronGUID = pCreature->GetGUID();
                    pCreature->setActive(true);
                    break;
                case NPC_SHADRON:
                    m_uiShadronGUID = pCreature->GetGUID();
                    pCreature->setActive(true);
                    break;
                case NPC_VESPERON:
                    m_uiVesperonGUID = pCreature->GetGUID();
                    pCreature->setActive(true);
                    break;
                case NPC_DISCIPLE_OF_VESPERON:
                    m_uiDiscipleOfVesperonGUID = pCreature->GetGUID();
                    pCreature->setActive(true);
                    break;
            }
        }

        uint32 GetData(uint32 uiType)
        {
            if (uiType == TYPE_SARTHARION_EVENT)
                return m_auiEncounter[0];
            else if(uiType == TYPE_TENEBRON_PREKILLED)
                return m_bTenebronKilled;
            else if(uiType == TYPE_SHADRON_PREKILLED)
                return m_bShadronKilled;
            else if(uiType == TYPE_VESPERON_PREKILLED)
                return m_bVesperonKilled;

            return 0;
        }

        uint64 GetData64(uint32 uiData)
        {
            switch(uiData)
            {
                case DATA_SARTHARION:
                    return m_uiSartharionGUID;
                case DATA_TENEBRON:
                    return m_uiTenebronGUID;
                case DATA_SHADRON:
                    return m_uiShadronGUID;
                case DATA_VESPERON:
                    return m_uiVesperonGUID;
                case DATA_DISCIPLE_OF_VESPERON:
                    return m_uiDiscipleOfVesperonGUID;
            }
            return 0;
        }

        void SetData(uint32 uiType, uint32 uiData)
        {
            if (uiType == TYPE_SARTHARION_EVENT)
                m_auiEncounter[0] = uiData;
            else if(uiType == TYPE_TENEBRON_PREKILLED)
                m_bTenebronKilled = true;
            else if(uiType == TYPE_SHADRON_PREKILLED)
                m_bShadronKilled = true;
            else if(uiType == TYPE_VESPERON_PREKILLED)
                m_bVesperonKilled = true;
        }
    };

    InstanceScript* GetInstanceScript (InstanceMap* pMap) const
    {
        return new instance_obsidian_sanctum_InstanceMapScript(pMap);
    }

};


void AddSC_instance_obsidian_sanctum()
{
    new instance_obsidian_sanctum;
}
