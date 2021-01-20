using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;
using CodeChecker.Defines;
using System;
using CodeChecker.Delegates;
using CodeChecker.Second;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class StartsWithLowercaseMethodNameAnalyzer : MethodNameAnalyzer
    {
        protected override string Id => Define.ID_STARTS_WITH_LOWERCASE_METHOD_NAME_ANALYZER;
        protected override string Title => "メソッド名の先頭文字が小文字です。";
        protected override string FormatedMessage => "メソッド名 '{0}' の先頭文字が小文字です。";
        protected override string Description => "メソッド名は大文字から開始する必要があります。";

        protected override bool validate(string name) {
            return Predicates.StartsWithLowercase(name);
        }
    }
}
