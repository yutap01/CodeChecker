using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class NotRespectfulSummaryFieldCommentAnalyzer : FieldCommentAnalyzer
    {
        protected override string Id => Define.ID_NOT_RESPECTFUL_SUMMARY_FIELD_COMMENT_ANALYZER;
        protected override string Title => "フィールドコメントの<summary>の記述が敬体ではありません";
        protected override string FormatedMessage => "フィールド '{0}' のコメントの<summary>の記述が敬体ではありません";
        protected override string Description => "フィールドのコメントの<summary>は敬体で記述してください";

        protected override bool validate(DocumentComment comment) {
            return Predicates.NotRespectfulSummaryComment(comment);
        }
    }
}
