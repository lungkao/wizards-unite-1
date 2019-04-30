using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using WUProtos.Data.Client;
using WUProtos.Data.Player;
using WUProtos.Networking.Platform.Responses;
using static WUProtos.Data.GmTemplate.Types;
using static WUProtos.Data.Client.ClientGmTemplate;
using WUProtos.Data;
using WUProtos.Data.Encounter;

namespace GameData
{
    class Program
    {
        static void Main(string[] args)
        {

            var strings = StringsParser.ExtractStrings("./Data/Strings_en_US_loc.txt");


            using (var input = File.OpenRead("./Data/GameDataWrapper.bytes"))
            {
                var response = GameDataWrapper.Parser.ParseFrom(input);
                var encounters = new List<Encounter>();
                var player_levels = new List<PlayerLevel>();

                foreach (var message in response.Messages)
                {
                    if(message.Encounter != null) {
                        encounters.Add(message.Encounter);
                    }

                    if(message.PlayerLevel != null) {
                        player_levels.Add(message.PlayerLevel);
                    }
                }
    
                File.WriteAllText("./output/strings.csv", StringsParser.GenerateStringsCsv(strings));
                // File.WriteAllText("./output/gamedata.json", GameDataJsonWriter.ToJson(response));
                File.WriteAllText("./output/encounters.csv", EncounterContentGenerator.GenerateEncounters(encounters, strings));
                File.WriteAllText("./output/levels.html", PlayerLevelTableGenerator.GeneratePlayerLevelTable(player_levels));
            }
        }
    }
}
