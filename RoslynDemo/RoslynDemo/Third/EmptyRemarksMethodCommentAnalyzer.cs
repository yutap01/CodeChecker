using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class EmptyRemarksMethodCommentAnalyzer : MethodCommentAnalyzer
    {
        protected override string Id => Define.ID_EMPTY_REMARKS_METHOD_COMMENT_ANALYZER;
        protected override string Title => "メソッドコメントの<remarks>内に有効な記述がありません";
        protected override string FormatedMessage => "メソッド '{0}' のコメントの<remarks>内に有効な記述がありません";
        protected override string Description => "メソッドコメントの<remarks>には有効な記述が必要です";

        protected override bool validate(DocumentComment comment) {
            return Predicates.EmptyRemarksComment(comment);
        }
    }
}
