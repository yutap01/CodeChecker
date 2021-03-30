using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    internal class CommentLessFieldCommentAnalyzer : FieldCommentAnalyzer
    {
        protected override string Id => Define.ID_COMMENT_LESS_FIELD_COMMENT_ANALYZER;
        protected override string Title => "フィールドのコメント記述がありません";
        protected override string FormatedMessage => "フィールド '{0}' にコメント記述がありません";
        protected override string Description => "フィールド定義にはコメント記述が必要です";

        protected override bool validate(DocumentComment comment)
        {
            return Predicates.CommentLessComment(comment);
        }
    }
}