using CodeChecker.Base;
using CodeChecker.Models;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.First
{
    public abstract class FunctionCallAnalyzer : OperationAnalyzer

    {
        public FunctionCallAnalyzer() : base("Function Call", DiagnosticSeverity.Error)
        {
        }

        //コメントを診断する(第2階層はシンボルを特定し、シンボルからnameを取得する。第2階層はAnalyzeSymbolメソッドにてnameを特定次第、このメソッドを呼び出す義務がある)
        protected virtual void DiagnoseFunctionCall(DocumentComment comment, OperationAnalysisContext context, Location location)
        {
            //TODO:対応
            //シンボルが無視対象の場合、診断しない

            //var strNamespace = context.Operation.ContainingNamespace.ToString();
            //if (IsIgnored(context, this.GetType().Name, strNamespace))
            //{
            //    return;
            //}

            //違反している場合、診断書を発行する
            if (validate(comment))
            {
                //TODO:対応
                var diagnostic = Diagnostic.Create(Descripter, location, context.Operation.Syntax.ToFullString());
                context.ReportDiagnostic(diagnostic);
            }
        }

        //コメントを検証するメソッド(第3階層にてどのような診断を行うかを決定する)
        protected abstract bool validate(DocumentComment comment);
    }
}