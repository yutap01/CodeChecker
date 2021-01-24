using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class UnnecessaryReturnsMethodCommentAnalyzer : MethodCommentAnalyzer
    {
        protected override string Id => Define.ID_UNNECESSARY_RETURNS_METHOD_COMMENT_ANALYZER;
        protected override string Title => "戻り値のないメソッドのコメントに<returns>記述があります";
        protected override string FormatedMessage => "戻り値のないメソッド '{0}' のコメントに<returns>記述があります";
        protected override string Description => "戻り値のないメソッドのコメントには<returns>記述は不要です";

        protected override bool validate(DocumentComment comment) {
            return Predicates.UnnecessaryReturnsComment(comment);
        }
    }
}
