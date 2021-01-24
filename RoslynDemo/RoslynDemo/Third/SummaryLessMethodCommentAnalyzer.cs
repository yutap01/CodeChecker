using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class SummaryLessMethodCommentAnalyzer : MethodCommentAnalyzer
    {
        protected override string Id => Define.ID_SUMMARY_LESS_METHOD_COMMENT_ANALYZER;
        protected override string Title => "メソッドコメントに<summary>記述がありません";
        protected override string FormatedMessage => "メソッド '{0}' のコメントに<summary>記述がありません";
        protected override string Description => "メソッドのコメントには<summary>記述が必要です";

        protected override bool validate(DocumentComment comment) {
            return Predicates.SummaryLessComment(comment);
        }
    }
}
