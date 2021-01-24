using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class InvalidFormatEnumMemberCommentAnalyzer : EnumMemberCommentAnalyzer
    {
        protected override string Id => Define.ID_INVALID_FORMAT_ENUM_MEMBER_COMMENT_ANALYZER;
        protected override string Title => "列挙定数のコメントの書式が不正です。";
        protected override string FormatedMessage => "列挙定数 '{0}' のコメントの書式が不正です。";
        protected override string Description => "列挙定数定義のコメントはXMLドキュメント形式に従う必要があります。";

        protected override bool validate(DocumentComment comment) {
            return Predicates.InvalidFormatComment(comment);
        }
    }
}
