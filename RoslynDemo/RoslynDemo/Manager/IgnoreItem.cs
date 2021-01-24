using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CodeChecker.Manager
{
    [JsonObject]
    class IgnoreItem
    {
        [JsonProperty("analyzer")]
        public string Analyzer { get; set; }

        [JsonProperty("namespace")]
        public string Namespace { get; set; }
    }
}
