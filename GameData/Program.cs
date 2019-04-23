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

namespace GameData
{
    class Program
    {
        static void Main(string[] args)
        {
            var levels = new List<PlayerLevel>();

            using (var input = File.OpenRead("2019-04-20.bytes"))
            {
                var response = GameDataWrapper.Parser.ParseFrom(input);

                

            }
        }
    }
}
