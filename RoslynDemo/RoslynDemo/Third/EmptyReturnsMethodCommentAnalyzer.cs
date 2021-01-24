using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class EmptyReturnsMethodCommentAnalyzer : MethodCommentAnalyzer
    {
        protected override string Id => Define.ID_EMPTY_RETURNS_METHOD_COMMENT_ANALYZER;
        protected override string Title => "メソッドコメントの<returns>内に有効な記述がありません";
        protected override string FormatedMessage => "メソッド '{0}' のコメントの<returns>内に有効な記述がありません";
        protected override string Description => "メソッドコメントの<returns>には有効な記述が必要です";

        protected override bool validate(DocumentComment comment) {
            return Predicates.EmptyReturnsComment(comment);
        }
    }
}
