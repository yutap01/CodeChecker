using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class SummaryLessPropertyCommentAnalyzer : PropertyCommentAnalyzer
    {
        protected override string Id => Define.ID_SUMMARY_LESS_PROPERTY_COMMENT_ANALYZER;
        protected override string Title => "プロパティコメントに<summary>記述がありません";
        protected override string FormatedMessage => "プロパティ '{0}' のコメントに<summary>記述がありません";
        protected override string Description => "プロパティのコメントには<summary>記述が必要です";

        protected override bool validate(DocumentComment comment) {
            return Predicates.SummaryLessComment(comment);
        }
    }
}
