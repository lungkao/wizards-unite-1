using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using WUProtos.Data.Player;
using WUProtos.Networking.Responses;
using static WUProtos.Networking.Responses.DownloadGmTemplatesResponse.Types;

namespace GameData
{
    class Program
    {
        static void Main(string[] args)
        {
            DownloadGmTemplatesResponse response;
            var levels = new List<PlayerLevel>();

            using (var input = File.OpenRead("2019-04-20.bytes"))
            {
                response = DownloadGmTemplatesResponse.Parser.ParseFrom(input);

                foreach (var item in response.Template)
                {
                    if(item.PlayerLevel != null) {
                        levels.Add(item.PlayerLevel);
                    }
                }

                var table = PlayerLevelTableGenerator.GeneratePlayerLevelTable(levels.OrderBy(l => l.RequiredXp));

                File.WriteAllText("./output/levels.html", table);
            }
        }
    }
}
