using CodeChecker.Defines;
using Microsoft.CodeAnalysis.Diagnostics;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CodeChecker.Manager
{
    class NamespaceIgnoreManager
    {
        private static NamespaceIgnoreManager manager;
        private IgnoreItemList json;

        public NamespaceIgnoreManager(SymbolAnalysisContext context) {
            var additionalFiles = context.Options.AdditionalFiles;

            var config = additionalFiles.FirstOrDefault(x => System.IO.Path.GetFileName(x.Path) == Define.IGNOERE_LIST_FILE_NAME);
            if (config != null) {
                var strJson = config.GetText().ToString();
                json = JsonConvert.DeserializeObject<IgnoreItemList>(strJson);
            } else {
            }
        }

        public static NamespaceIgnoreManager GetInstance(SymbolAnalysisContext context) {

            if (manager == null) {
                manager = new NamespaceIgnoreManager(context);
            }
            return manager;
        }

        public bool IsIgnored(string analyzer, string strNamespace) {
            return json.Exists(analyzer, strNamespace);

        }




    }
}
