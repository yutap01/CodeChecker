using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class SummaryLessFieldCommentAnalyzer : FieldCommentAnalyzer
    {
        protected override string Id => Define.ID_SUMMARY_LESS_FIELD_COMMENT_ANALYZER;
        protected override string Title => "フィールドコメントに<summary>記述がありません";
        protected override string FormatedMessage => "フィールド '{0}' のコメントに<summary>記述がありません";
        protected override string Description => "フィールドのコメントには<summary>記述が必要です";

        protected override bool validate(DocumentComment comment) {
            return Predicates.SummaryLessComment(comment);
        }
    }
}
