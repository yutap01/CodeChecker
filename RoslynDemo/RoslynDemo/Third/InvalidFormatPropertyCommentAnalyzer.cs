using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class InvalidFormatPropertyCommentAnalyzer : PropertyCommentAnalyzer
    {
        protected override string Id => Define.ID_INVALID_FORMAT_PROPERTY_COMMENT_ANALYZER;
        protected override string Title => "プロパティのコメントの書式が不正です。";
        protected override string FormatedMessage => "プロパティ '{0}' のコメントの書式が不正です。";
        protected override string Description => "プロパティ定義のコメントはXMLドキュメント形式に従う必要があります。";

        protected override bool validate(DocumentComment comment) {
            return Predicates.InvalidFormatComment(comment);
        }
    }
}
