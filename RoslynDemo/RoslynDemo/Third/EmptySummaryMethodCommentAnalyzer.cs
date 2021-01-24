using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class EmptySummaryMethodCommentAnalyzer : MethodCommentAnalyzer
    {
        protected override string Id => Define.ID_EMPTY_SUMMARY_METHOD_COMMENT_ANALYZER;
        protected override string Title => "メソッドコメントの<summary>内に有効な記述がありません";
        protected override string FormatedMessage => "メソッド '{0}' のコメントの<summary>内に有効な記述がありません";
        protected override string Description => "メソッドコメントの<summary>には有効な記述が必要です";

        protected override bool validate(DocumentComment comment) {
            return Predicates.EmptySummaryComment(comment);
        }
    }
}
