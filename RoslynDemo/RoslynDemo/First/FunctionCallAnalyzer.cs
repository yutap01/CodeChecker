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

        //関数呼び出しを診断する(第2階層はAnalyzeFunctionメソッドにてfunctionを特定次第、このメソッドを呼び出す義務がある)
        protected virtual void DiagnoseFunctionCall(FunctionCall functionCall, SyntaxNodeAnalysisContext context, Location location)
        {
            //シンボルが無視対象の場合、診断しない
            var strNamespace = functionCall.ContainMethodName;
            if (IsIgnored(context, this.GetType().Name, strNamespace))
            {
                return;
            }

            //違反している場合、診断書を発行する
            if (validate(functionCall))
            {
                var diagnostic = Diagnostic.Create(Descripter, location, context.ToString());
                context.ReportDiagnostic(diagnostic);
            }
        }

        //コメントを検証するメソッド(第3階層にてどのような診断を行うかを決定する)
        protected abstract bool validate(FunctionCall functionCall);
    }
}