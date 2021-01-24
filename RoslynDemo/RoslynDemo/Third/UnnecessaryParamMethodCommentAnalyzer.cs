using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class UnnecessaryParamMethodCommentAnalyzer : MethodCommentAnalyzer
    {
        protected override string Id => Define.ID_UNNECESSARY_PARAM_METHOD_COMMENT_ANALYZER;
        protected override string Title => "引数のないメソッドのコメントに<param>記述があります";
        protected override string FormatedMessage => "引数のないメソッド '{0}' のコメントに<param>記述があります";
        protected override string Description => "引数のないメソッドのコメントには<param>記述は不要です";

        protected override bool validate(DocumentComment comment) {
            return Predicates.UnnecessaryParamComment(comment);
        }
    }
}
