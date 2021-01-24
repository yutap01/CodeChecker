using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class NameLessParamMethodCommentAnalyzer : MethodCommentAnalyzer
    {
        protected override string Id => Define.ID_NAME_LESS_PARAM_METHOD_COMMENT_ANALYZER;
        protected override string Title => "name属性のない<param>が存在します。";
        protected override string FormatedMessage => "メソッド '{0}' にname属性のない<param>が存在します。";
        protected override string Description => "<param>にはname属性が必要です";

        protected override bool validate(DocumentComment comment) {
            return Predicates.NameLessParamComment(comment);
        }
    }
}
