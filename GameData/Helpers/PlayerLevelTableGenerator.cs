
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using WUProtos.Data.Player;

namespace GameData
{
    static class PlayerLevelTableGenerator
    {
        static public string GeneratePlayerLevelTable(IEnumerable<PlayerLevel> levels) {
            StringWriter stringWriter = new StringWriter();
            
            stringWriter.WriteLine("<table>");
            stringWriter.WriteLine("<thead>");
            stringWriter.WriteLine("</thead>");
            
            stringWriter.WriteLine("<tbody>");
            
            PlayerLevel previous = null;

            foreach (var level in levels)
            {
                stringWriter.WriteLine("<tr>");
                
                stringWriter.Write("<td>");
                stringWriter.Write(level.Id.Replace("proto_playerlevel_", ""));
                stringWriter.Write("</td>");

                stringWriter.Write("<td>");
                stringWriter.Write(level.RequiredXp.ToString("N0", new CultureInfo("en-US")));
                stringWriter.Write("</td>");

                stringWriter.Write("<td>");
                if(previous != null) {
                    stringWriter.Write((level.RequiredXp - previous.RequiredXp).ToString("N0", new CultureInfo("en-US")));
                } else {
                    stringWriter.Write(0);
                }
                stringWriter.Write("</td>");

                stringWriter.Write("<td>");
                stringWriter.Write("<i>Not known yet</i>");
                stringWriter.Write("</td>");

                stringWriter.WriteLine("</tr>");

                previous = level;
            }

            stringWriter.WriteLine("</tbody>");
            stringWriter.WriteLine("</table>");

            return stringWriter.ToString();
        }
    }
}