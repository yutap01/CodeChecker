using CodeChecker.Defines;
using Microsoft.CodeAnalysis.Diagnostics;
using Newtonsoft.Json;
using System.Collections.Immutable;
using System.Linq;
using System.Reflection;

namespace CodeChecker.Manager
{
    internal class NamespaceIgnoreManager
    {
        private static NamespaceIgnoreManager manager;
        private IgnoreItemList json;

        public NamespaceIgnoreManager(SymbolAnalysisContext context)
        {
            var additionalFiles = context.Options.AdditionalFiles;
            if (additionalFiles == null) {
                return;
            }

            json = getIgnoreItemList(additionalFiles);
        }

        public NamespaceIgnoreManager(SyntaxNodeAnalysisContext context) {
            var additionalFiles = context.Options.AdditionalFiles;
            if (additionalFiles == null) {
                return;
            }

            json = getIgnoreItemList(additionalFiles);
        }

        private IgnoreItemList getIgnoreItemList(ImmutableArray<Microsoft.CodeAnalysis.AdditionalText> additionalFiles) {
            var config = additionalFiles.FirstOrDefault(x => System.IO.Path.GetFileName(x.Path) == Define.IGNOERE_LIST_FILE_NAME);
            if (config != null) {
                var strJson = config.GetText().ToString();
                return JsonConvert.DeserializeObject<IgnoreItemList>(strJson);
            }
            return null;
        }

        public static NamespaceIgnoreManager GetInstance(SymbolAnalysisContext context)
        {
            if (manager == null)
            {
                manager = new NamespaceIgnoreManager(context);
            }
            return manager;
        }

        public static NamespaceIgnoreManager GetInstance(SyntaxNodeAnalysisContext context) {
            if (manager == null) {
                manager = new NamespaceIgnoreManager(context);
            }
            return manager;
        }

        public bool IsIgnored(string analyzer, string strNamespace)
        {
            if (json == null)
            {
                return false;
            }

            return json.Exists(analyzer, strNamespace);
        }
    }
}