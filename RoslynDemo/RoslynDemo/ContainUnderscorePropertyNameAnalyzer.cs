using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;
using CodeChecker.Defines;

namespace CodeChecker
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    public class ContainUnderscorePropertyNameAnalyzer : PropertyNameAnalyzer
    {
        protected override string Id => Define.ID_CONTAIN_UNDERSCORE_PROPERTY_NAME_ANALYZER;
        protected override string Title => "プロパティ名に '_'  が含まれています。";
        protected override string FormatedMessage => "プロパティ名 '{0}' は '_' を含んでいます。";
        protected override string Description => "プロパティ名に '_' を含んではいけません。";

        protected override bool validate(string typeName) {
            return typeName.Contains("_");
        }
    }
}

