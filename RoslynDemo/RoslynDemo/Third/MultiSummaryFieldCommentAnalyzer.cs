using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class MultiSummaryFieldCommentAnalyzer : FieldCommentAnalyzer
    {
        protected override string Id => Define.ID_MULTI_SUMMARY_FIELD_COMMENT_ANALYZER;
        protected override string Title => "フィールドコメントに<summary>記述が複数存在します。";
        protected override string FormatedMessage => "フィールド '{0}' のコメントに<summary>記述が複数存在します。";
        protected override string Description => "フィールドのコメントに<summary>記述は1つだけ有効です。";

        protected override bool validate(DocumentComment comment) {
            return Predicates.MultiSummaryComment(comment);
        }
    }
}
