using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class InvalidFormatMethodCommentAnalyzer : MethodCommentAnalyzer
    {
        protected override string Id => Define.ID_INVALID_FORMAT_METHOD_COMMENT_ANALYZER;
        protected override string Title => "メソッドのコメントの書式が不正です。";
        protected override string FormatedMessage => "メソッド '{0}' のコメントの書式が不正です。";
        protected override string Description => "メソッド定義のコメントはXMLドキュメント形式に従う必要があります。";

        protected override bool validate(DocumentComment comment) {
            return Predicates.InvalidFormatComment(comment);
        }
    }
}
