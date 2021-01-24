using CodeChecker.Base;
using CodeChecker.Models;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.First
{
    public abstract class CommentAnalyzer : BaseAnalyzer
    {
        public CommentAnalyzer():base("Document Comment", DiagnosticSeverity.Error)
        {
        }

        //コメントを診断する(第2階層はシンボルを特定し、シンボルからnameを取得する。第2階層はAnalyzeSymbolメソッドにてnameを特定次第、このメソッドを呼び出す義務がある)
        protected virtual void DiagnoseComment(DocumentComment comment, SymbolAnalysisContext context, Location location)
        {
            //シンボルが無視対象の場合、診断しない
            var strNamespace = context.Symbol.ContainingNamespace.ToString();
            if (IsIgnored(context,this.GetType().Name, strNamespace)){
                return;
            }

            //名前が違反している場合、診断書を発行する
            if (validate(comment))
            {
                var diagnostic = Diagnostic.Create(Descripter, location, context.Symbol.Name);
                context.ReportDiagnostic(diagnostic);
            }
        }

        //コメントを検証するメソッド(第3階層にてどのような診断を行うかを決定する)
        protected abstract bool validate(DocumentComment comment);
    }
}