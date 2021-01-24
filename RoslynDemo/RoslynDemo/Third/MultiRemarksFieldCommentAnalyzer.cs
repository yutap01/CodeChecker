using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class MultiRemarksFieldCommentAnalyzer : FieldCommentAnalyzer
    {
        protected override string Id => Define.ID_MULTI_REMARKS_FIELD_COMMENT_ANALYZER;
        protected override string Title => "フィールドコメントに<remarks>記述が複数存在します。";
        protected override string FormatedMessage => "フィールド '{0}' のコメントに<remarks>記述が複数存在します。";
        protected override string Description => "フィールドのコメントに<remarks>記述は1つだけ有効です。";

        protected override bool validate(DocumentComment comment) {
            return Predicates.MultiRemarksComment(comment);
        }
    }
}
