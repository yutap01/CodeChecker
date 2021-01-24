using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CodeChecker.Manager
{
    [JsonObject]
    class IgnoreItemList
    {
        [JsonProperty("ignorelist")]
        private List<IgnoreItem> IgnoreList { get; set; }

        public bool Exists(string analyzer,string strNamespace) {
            return IgnoreList.Exists(item => item.Analyzer == analyzer && item.Namespace == strNamespace);
        }
    }
}
