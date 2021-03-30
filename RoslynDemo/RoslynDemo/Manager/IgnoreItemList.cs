using Newtonsoft.Json;
using System.Collections.Generic;

namespace CodeChecker.Manager
{
    [JsonObject]
    internal class IgnoreItemList
    {
        [JsonProperty("ignorelist")]
        private List<IgnoreItem> IgnoreList { get; set; }

        /// <summary>
        /// 指定のanalyzer,namespaceの組が無視リストに含まれているか否かを通知する
        /// 無視定義ファイル上でanalyzerが指定されていない場合(""の場合)、全てのanalyzerが無視リストに登録されているものとして扱う
        /// </summary>
        /// <param name="analyzer"></param>
        /// <param name="strNamespace"></param>
        /// <returns></returns>
        public bool Exists(string analyzer, string strNamespace)
        {
            return IgnoreList.Exists(item => (item.Analyzer == analyzer || item.Analyzer == "") && item.Namespace == strNamespace);
        }
    }
}