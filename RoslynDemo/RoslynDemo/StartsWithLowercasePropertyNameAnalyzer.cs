using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;
using CodeChecker.Defines;
using System;
using CodeChecker.Delegates;

namespace CodeChecker
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class StartsWithLowercasePropertyNameAnalyzer : PropertyNameAnalyzer
    {
        protected override string Id => Define.ID_STARTS_WITH_LOWERCASE_PROPERTY_NAME_ANALYZER;
        protected override string Title => "プロパティ名の先頭文字が小文字です。";
        protected override string FormatedMessage => "プロパティ名 '{0}' の先頭文字が小文字です。";
        protected override string Description => "プロパティ名は大文字から開始する必要があります。";

        protected override bool validate(string name) {
            return Predicates.StartsWithLowercase(name);
        }
    }
}
