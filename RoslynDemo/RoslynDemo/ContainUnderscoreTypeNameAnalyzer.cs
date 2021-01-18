using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;
using CodeChecker.Defines;

namespace CodeChecker
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    public class ContainUnderscoreTypeNameAnalyzer : TypeNameAnalyzer
    {
        protected override string Id => Define.ID_CONTAIN_UNDERSCORE_TYPE_NAME_ANALYZER;
        protected override string Title => "型名に '_'  が含まれています。";
        protected override string FormatedMessage => "型名 '{0}' は '_' を含んでいます。";
        protected override string Description => "型名に '_' を含んではいけません。";

        protected override bool validate(string typeName) {
            return typeName.Contains("_");
        }
    }
}
