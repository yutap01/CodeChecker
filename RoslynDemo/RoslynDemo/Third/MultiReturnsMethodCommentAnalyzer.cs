using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class MultiReturnsMethodCommentAnalyzer : MethodCommentAnalyzer
    {
        protected override string Id => Define.ID_MULTI_RETURNS_METHOD_COMMENT_ANALYZER;
        protected override string Title => "メソッドコメントに<returns>の記述が複数存在します。";
        protected override string FormatedMessage => "メソッド '{0}' のコメントに<returns>の記述が複数存在します。";
        protected override string Description => "メソッドのコメントに<returns>記述は1つだけ有効です。";

        protected override bool validate(DocumentComment comment) {
            return Predicates.MultiReturnsComment(comment);
        }
    }
}
