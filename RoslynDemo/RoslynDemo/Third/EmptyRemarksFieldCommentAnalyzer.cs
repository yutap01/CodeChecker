using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class EmptyRemarksFieldCommentAnalyzer : FieldCommentAnalyzer
    {
        protected override string Id => Define.ID_EMPTY_REMARKS_FIELD_COMMENT_ANALYZER;
        protected override string Title => "フィールドコメントの<remarks>内に有効な記述がありません";
        protected override string FormatedMessage => "フィールド '{0}' のコメントの<remarks>内に有効な記述がありません";
        protected override string Description => "フィールドコメントの<remarks>には有効な記述が必要です";

        protected override bool validate(DocumentComment comment) {
            return Predicates.EmptyRemarksComment(comment);
        }
    }
}
