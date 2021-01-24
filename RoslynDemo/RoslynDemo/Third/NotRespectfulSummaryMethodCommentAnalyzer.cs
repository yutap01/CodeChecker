using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class NotRespectfulSummaryMethodCommentAnalyzer : MethodCommentAnalyzer
    {
        protected override string Id => Define.ID_NOT_RESPECTFUL_SUMMARY_METHOD_COMMENT_ANALYZER;
        protected override string Title => "メソッドコメントの<summary>の記述が敬体ではありません";
        protected override string FormatedMessage => "メソッド '{0}' のコメントの<summary>の記述が敬体ではありません";
        protected override string Description => "メソッドのコメントの<summary>は敬体で記述してください";

        protected override bool validate(DocumentComment comment) {
            return Predicates.NotRespectfulSummaryComment(comment);
        }
    }
}
