using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class NotRespectfulReturnsMethodCommentAnalyzer : MethodCommentAnalyzer
    {     
        protected override string Id => Define.ID_NOT_RESPECTFUL_RETURNS_METHOD_COMMENT_ANALYZER;
        protected override string Title => "メソッドコメントの<returns>の記述が敬体ではありません";
        protected override string FormatedMessage => "メソッド '{0}' のコメントの<returns>の記述が敬体ではありません";
        protected override string Description => "メソッドのコメントの<returns>は敬体で記述してください";

        protected override bool validate(DocumentComment comment) {
            return Predicates.NotRespectfulReturnsComment(comment);
        }
    }
}
