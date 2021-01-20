using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class InvalidFormatTypeCommentAnalyzer : TypeCommentAnalyzer
    {
        protected override string Id => Define.ID_INVALID_FORMAT_TYPE_COMMENT_ANALYZER;
        protected override string Title => "型のコメントの書式が不正です。";
        protected override string FormatedMessage => "型 '{0}' のコメントの書式が不正です。";
        protected override string Description => "型定義のコメントはXMLドキュメント形式に従う必要があります。";

        protected override bool validate(DocumentComment comment) {
            return Predicates.InvalidFormatComment(comment);
        }
    }
}
