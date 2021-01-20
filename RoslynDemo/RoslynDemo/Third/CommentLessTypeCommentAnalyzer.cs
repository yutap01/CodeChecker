using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class CommentLessTypeCommentAnalyzer : TypeCommentAnalyzer
    {
        protected override string Id => Define.ID_COMMENT_LESS_TYPE_COMMENT_ANALYZER;
        protected override string Title => "型のコメント記述がありません";
        protected override string FormatedMessage => "型 '{0}' にコメント記述がありません";
        protected override string Description => "型定義にはコメント記述が必要です";

        protected override bool validate(DocumentComment comment) {
            return Predicates.CommentLessComment(comment);
        }
    }
}
