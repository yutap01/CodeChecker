using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class MultiRemarksMethodCommentAnalyzer : MethodCommentAnalyzer
    {
        protected override string Id => Define.ID_MULTI_REMARKS_METHOD_COMMENT_ANALYZER;
        protected override string Title => "メソッドコメントに<remarks>記述が複数存在します。";
        protected override string FormatedMessage => "メソッド '{0}' のコメントに<remarks>記述が複数存在します。";
        protected override string Description => "メソッドのコメントに<remarks>記述は1つだけ有効です。";

        protected override bool validate(DocumentComment comment) {
            return Predicates.MultiRemarksComment(comment);
        }
    }
}
