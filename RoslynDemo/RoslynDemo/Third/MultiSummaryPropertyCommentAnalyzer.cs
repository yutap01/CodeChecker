using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class MultiSummaryPropertyCommentAnalyzer : PropertyCommentAnalyzer
    {
        protected override string Id => Define.ID_MULTI_SUMMARY_PROPERTY_COMMENT_ANALYZER;
        protected override string Title => "プロパティコメントに<summary>記述が複数存在します。";
        protected override string FormatedMessage => "プロパティ '{0}' のコメントに<summary>記述が複数存在します。";
        protected override string Description => "プロパティのコメントに<summary>記述は1つだけ有効です。";

        protected override bool validate(DocumentComment comment) {
            return Predicates.MultiSummaryComment(comment);
        }
    }
}
