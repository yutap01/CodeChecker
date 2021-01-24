using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class ReturnLessMethodCommentAnalyzer : MethodCommentAnalyzer
    {
        protected override string Id => Define.ID_RETURN_LESS_METHOD_COMMENT_ANALYZER;
        protected override string Title => "メソッドコメントに<returns>記述がありません";
        protected override string FormatedMessage => "メソッド '{0}' のコメントに<returns>記述がありません";
        protected override string Description => "メソッドのコメントには<returns>記述が必要です";

        protected override bool validate(DocumentComment comment) {
            return Predicates.ReturnLessComment(comment);
        }
    }
}
