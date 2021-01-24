using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class ParamLessMethodCommentAnalyzer : MethodCommentAnalyzer
    {
        protected override string Id => Define.ID_PARAM_LESS_METHOD_COMMENT_ANALYZER;
        protected override string Title => "メソッドの引数に対するコメント記述がありません";
        protected override string FormatedMessage => "メソッド '{0}' に引数に対するコメント記述がありません";
        protected override string Description => "引数を持つメソッド定義にはパラメータに対するコメント記述が必要です";

        protected override bool validate(DocumentComment comment) {
            return Predicates.ParamLessComment(comment);
        }
    }
}
