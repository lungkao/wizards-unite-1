
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using WUProtos.Data.Encounter;
using WUProtos.Data.Player;

namespace GameData
{
    static class EncounterContentGenerator
    {
        static public string GenerateEncounters(IEnumerable<Encounter> encounters) {
            StringWriter stringWriter = new StringWriter();

            foreach (var encounter in encounters)
            {
                stringWriter.Write(
                    EncounterContentGenerator.GenerateEncounterContent(encounter)
                );
            }

            return stringWriter.ToString();
        }
        static public string GenerateEncounterContent(Encounter encounter) {
            StringWriter stringWriter = new StringWriter();
            
            stringWriter.WriteLine("{0},{1},{2},{3}", encounter.Id, encounter.CollectionFamilyGmtId, encounter.CollectionItemRewardGmtId, encounter.CollectionItemRewardShards);

            return stringWriter.ToString();
        }
    }
}