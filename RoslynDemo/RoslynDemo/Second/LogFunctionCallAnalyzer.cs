using CodeChecker.First;
using CodeChecker.Models;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Second
{
    public abstract class LogFunctionCallAnalyzer : FunctionCallAnalyzer
    {
        //アナライザーを初期化する
        public sealed override void Initialize(AnalysisContext context)
        {
            //context.RegisterSymbolAction(AnalyzeSymbol, SymbolKind.Field);
            context.RegisterOperationAction(AnalyzeOperation, OperationKind.Argument);
        }

        //フィールド定義シンボルを診断する
        protected sealed override void AnalyzeOperation(OperationAnalysisContext context)
        {
            var fieldSymbol = (IOperation)context.Operation;

            ////enumの列挙定数もフィールドとして扱われてしまう。列挙定数は対象外とする
            //if (fieldSymbol.ContainingType.TypeKind == TypeKind.Enum)
            //{
            //    return;
            //}

            //var comment = DocumentComment.Parse(fieldSymbol.GetDocumentationCommentXml());

            ////フィールドコメントを診断する
            //DiagnoseComment(comment, context, fieldSymbol.Locations[0]);
        }
    }
}