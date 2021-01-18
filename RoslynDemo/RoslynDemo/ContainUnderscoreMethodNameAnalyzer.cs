using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;
using CodeChecker.Defines;

namespace CodeChecker
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    public class ContainUnderscoreMethodNameAnalyzer : MethodNameAnalyzer
    {
        protected override string Id => Define.ID_CONTAIN_UNDERSCORE_METHOD_NAME_ANALYZER;
        protected override string Title => "メソッド名に '_'  が含まれています。";
        protected override string FormatedMessage => "メソッド名 '{0}' は '_' を含んでいます。";
        protected override string Description => "メソッド名に '_' を含んではいけません。";

        protected override bool validate(string typeName) {
            return typeName.Contains("_");
        }
    }
}

