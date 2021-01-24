using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class InvalidFormatFieldCommentAnalyzer : FieldCommentAnalyzer
    {
        protected override string Id => Define.ID_INVALID_FORMAT_FIELD_COMMENT_ANALYZER;
        protected override string Title => "フィールドのコメントの書式が不正です。";
        protected override string FormatedMessage => "フィールド '{0}' のコメントの書式が不正です。";
        protected override string Description => "フィールド定義のコメントはXMLドキュメント形式に従う必要があります。";

        protected override bool validate(DocumentComment comment) {
            return Predicates.InvalidFormatComment(comment);
        }
    }
}
