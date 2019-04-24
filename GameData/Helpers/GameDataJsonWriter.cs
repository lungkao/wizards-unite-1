
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using Google.Protobuf;
using WUProtos.Data;
using WUProtos.Data.Encounter;
using WUProtos.Data.Player;

namespace GameData
{
    static class GameDataJsonWriter
    {
        static public string ToJson(GameDataWrapper gameData) {
            var printer = new JsonFormatter(JsonFormatter.Settings.Default);
            var stringWriter = new StringWriter();

            printer.WriteValue(stringWriter, gameData);

            return stringWriter.ToString();
        }
       
    }
}