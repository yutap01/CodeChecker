using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class NotRespectfulEachParameterMethodCommentAnalyzer : MethodCommentAnalyzer
    {
        protected override string Id => Define.ID_NOT_RESPECTFUL_EACH_PARAM_METHOD_COMMENT_ANALYZER;
        protected override string Title => "メソッドコメントの<param>の記述が敬体ではありません";
        protected override string FormatedMessage => "メソッド '{0}' のコメントの<param>が敬体ではありません";
        protected override string Description => "メソッドコメントの<param>は敬体で記述してください";

        protected override bool validate(DocumentComment comment) {
            return Predicates.NotRespectfulEachParamComment(comment);
        }

        //コメントを診断する(第2階層はシンボルを特定し、シンボルからnameを取得する。第2階層はAnalyzeSymbolメソッドにてnameを特定次第、このメソッドを呼び出す義務がある)
        protected override void DiagnoseComment(DocumentComment comment, SymbolAnalysisContext context, Location location) {
            //シンボルが無視対象の場合、診断しない
            var strNamespace = context.Symbol.ContainingNamespace.ToString();
            if (IsIgnored(context, this.GetType().Name, strNamespace)) {
                return;
            }

            //パラメータコメントが違反している場合、診断書を発行する
            if (validate(comment)) {

                var strParamNames = string.Join(",", comment.GetParamNamesByError(DocumentComment.Error.NOT_RESPECTFUL_PARAM));
                var message = context.Symbol.Name + "(引数:" + strParamNames + ")";

                var diagnostic = Diagnostic.Create(Descripter, location, message);
                context.ReportDiagnostic(diagnostic);
            }
        }

    }
}
