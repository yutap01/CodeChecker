using CodeChecker.First;
using CodeChecker.Models;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Second
{
    public abstract class PropertyCommentAnalyzer : CommentAnalyzer
    {
        //アナライザーを初期化する
        public sealed override void Initialize(AnalysisContext context) {
            context.RegisterSymbolAction(AnalyzeSymbol, SymbolKind.Property);
        }

        //プロパティ定義シンボルを診断する
        protected sealed override void AnalyzeSymbol(SymbolAnalysisContext context) {
            var propertySymbol = (IPropertySymbol)context.Symbol;
            var comment = DocumentComment.Parse(propertySymbol.GetDocumentationCommentXml());

            //プロパティコメントを診断する
            DiagnoseComment(comment, context, propertySymbol.Locations[0]);
        }
    }
}