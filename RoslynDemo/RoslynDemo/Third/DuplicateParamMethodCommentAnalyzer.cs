using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class DuplicateParamMethodCommentAnalyzer : MethodCommentAnalyzer
    {
        protected override string Id => Define.ID_DUPLICATE_PARAM_METHOD_COMMENT_ANALYZER;
        protected override string Title => "メソッドの引数に対するコメントが重複しています";
        protected override string FormatedMessage => "メソッド '{0}' の引数に対するコメントが重複しています";
        protected override string Description => "1つの引数にはただ1つの<param>コメントが有効です";

        protected override bool validate(DocumentComment comment) {
            return Predicates.DuplicateParamComment(comment);
        }
    }
}
