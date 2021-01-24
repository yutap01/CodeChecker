using CodeChecker.First;
using CodeChecker.Models;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Second
{
    public abstract class FieldCommentAnalyzer : CommentAnalyzer
    {
        //アナライザーを初期化する
        public sealed override void Initialize(AnalysisContext context) {
            context.RegisterSymbolAction(AnalyzeSymbol, SymbolKind.Field);
        }

        //フィールド定義シンボルを診断する
        protected sealed override void AnalyzeSymbol(SymbolAnalysisContext context) {
            var fieldSymbol = (IFieldSymbol)context.Symbol;
            
            //enumの列挙定数もフィールドとして扱われてしまう。列挙定数は対象外とする
            if(fieldSymbol.ContainingType.TypeKind == TypeKind.Enum) {
                return;
            }

            var comment = DocumentComment.Parse(fieldSymbol.GetDocumentationCommentXml());

            //フィールドコメントを診断する
            DiagnoseComment(comment, context, fieldSymbol.Locations[0]);
        }
    }
}