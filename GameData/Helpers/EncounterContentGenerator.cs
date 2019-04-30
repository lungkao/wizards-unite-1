
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using WUProtos.Data.Encounter;
using WUProtos.Data.Player;

namespace GameData
{
    static class EncounterContentGenerator
    {
        static public string GenerateEncounters(IEnumerable<Encounter> encounters, Dictionary<string, string> strings) {
            StringWriter stringWriter = new StringWriter();

            stringWriter.WriteLine("{0},{1},{2},{3},{4},{5},{6}", 
                "id",
                "name",
                "intro_text",
                "flavor_text",
                "spell",
                "base_win_rate",
                "shards"
                );

            foreach (var encounter in encounters)
            {
                stringWriter.Write(
                    EncounterContentGenerator.GenerateEncounterContent(encounter, strings)
                );
            }

            return stringWriter.ToString();
        }
        static public string GenerateEncounterContent(Encounter encounter, Dictionary<string, string> strings) {
            StringWriter stringWriter = new StringWriter();
            var regex = new Regex("_(a|b|c)?000(1|2|3|4|5|6|7|8|9)(_e)?");

            string identifier =encounter.Id.Replace("proto_encounter_", "");
            string identifier_naked = regex.Replace(encounter.Id.Replace("proto_encounter_", ""), "");
            
            var stage = encounter.Stages.FirstOrDefault();


            if(stage.Swish != null && strings.ContainsKey("encounter_name_" + identifier_naked)) {


            stringWriter.WriteLine("{0},{1},{2},{3},{4},{5},{6}", 
                encounter.Id, 
                strings.ContainsKey("encounter_name_" + identifier_naked) 
                    ? strings["encounter_name_" + identifier_naked] 
                    : strings.ContainsKey("encounter_name_" + identifier)
                        ? strings["encounter_name_" + identifier] 
                        : "" ,
                strings.ContainsKey("encounter_intro_text_" + identifier) ? strings["encounter_intro_text_" + identifier] : "",
                strings.ContainsKey("encounter_combat_flavor_text_" + identifier) ? strings["encounter_combat_flavor_text_" + identifier] : "",

                SpellNames.Dictionary.ContainsKey(stage.SpellGmtId.Replace("proto_spell_combat_", "").Replace("proto_spell_", ""))
                    ? SpellNames.Dictionary[stage.SpellGmtId.Replace("proto_spell_combat_", "").Replace("proto_spell_", "")]
                    : CultureInfo.CurrentCulture.TextInfo.ToTitleCase(stage.SpellGmtId.Replace("proto_spell_combat_", "").Replace("proto_spell_", "")),

                stage.Swish.BaseWinRate.ToString(CultureInfo.CreateSpecificCulture("en-US")),
                encounter.CollectionItemRewardShards
                
            );
            }
            
            return stringWriter.ToString();
        }
    }
}