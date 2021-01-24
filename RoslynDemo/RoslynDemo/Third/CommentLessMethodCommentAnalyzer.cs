using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class CommentLessMethodCommentAnalyzer : MethodCommentAnalyzer
    {
        protected override string Id => Define.ID_COMMENT_LESS_METHOD_COMMENT_ANALYZER;
        protected override string Title => "メソッドのコメント記述がありません";
        protected override string FormatedMessage => "メソッド '{0}' にコメント記述がありません";
        protected override string Description => "メソッド定義にはコメント記述が必要です";

        protected override bool validate(DocumentComment comment) {
            return Predicates.CommentLessComment(comment);
        }
    }
}
