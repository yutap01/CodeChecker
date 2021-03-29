using CodeChecker.First;
using CodeChecker.Models;
using Microsoft.CodeAnalysis.CSharp;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.CodeAnalysis.Diagnostics;
using System.Diagnostics;

namespace CodeChecker.Second
{
    public abstract class LogFunctionCallAnalyzer : FunctionCallAnalyzer
    {
        //アナライザーを初期化する
        public sealed override void Initialize(AnalysisContext context)
        {
            context.RegisterSyntaxNodeAction(AnalyzeOperation, SyntaxKind.InvocationExpression);
        }

        //フィールド定義シンボルを診断する
        protected sealed override void AnalyzeOperation(SyntaxNodeAnalysisContext context)
        {
            var node = context.Node as InvocationExpressionSyntax;
            if (node == null)
            {
                Debug.WriteLine("LogFunctionCallAnalyzer.AnalyzeOperation:診断に失敗");
                return;
            }

            var expression = node.Expression as MemberAccessExpressionSyntax;

            if (expression != null)
            {
                var identifier = expression.Name.Identifier;
                var ArgumentList = node.ArgumentList.Arguments;
                if (node.ArgumentList.Arguments.Count > 1)
                {
                    var location = node.ArgumentList.Arguments[1].GetLocation();
                    DiagnoseFunctionCall(new FunctionCall(context), context, location);
                }
            }
        }
    }
}