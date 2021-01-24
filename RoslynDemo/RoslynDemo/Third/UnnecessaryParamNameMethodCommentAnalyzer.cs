using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class UnnecessaryParamNameMethodCommentAnalyzer : MethodCommentAnalyzer
    {
        protected override string Id => Define.ID_UNNECESSARY_PARAM_NAME_METHOD_COMMENT_ANALYZER;
        protected override string Title => "メソッドのコメントに不要な<param>記述があります";
        protected override string FormatedMessage => "メソッド '{0}' のコメントに不要な<param>記述があります";
        protected override string Description => "メソッドのコメントには引数と一致しないname属性を持つ<param>記述は不要です";

        protected override bool validate(DocumentComment comment) {
            return Predicates.UnnecessaryParamNameComment(comment);
        }
    }
}
