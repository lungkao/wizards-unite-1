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
            var encounters = new List<Encounter>();
            var player_levels = new List<PlayerLevel>();

            using (var input = File.OpenRead("./Data/GameDataWrapper.bytes"))
            {
                var response = GameDataWrapper.Parser.ParseFrom(input);

                foreach (var message in response.Messages)
                {
                    if(message.Encounter != null) {
                        encounters.Add(message.Encounter);
                    }

                    if(message.PlayerLevel != null) {
                        player_levels.Add(message.PlayerLevel);
                    }
                }

                
            }
        }
    }
}
