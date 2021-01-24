using CodeChecker.First;
using CodeChecker.Models;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Second
{
    public abstract class EnumMemberCommentAnalyzer : CommentAnalyzer
    {
        //アナライザーを初期化する
        public sealed override void Initialize(AnalysisContext context) {
            context.RegisterSymbolAction(AnalyzeSymbol, SymbolKind.Field);
        }

        //列挙定数定義シンボルを診断する
        protected sealed override void AnalyzeSymbol(SymbolAnalysisContext context) {
            var fieldSymbol = (IFieldSymbol)context.Symbol;

            //enumの列挙定数は元来フィールドとして扱れる。列挙定数だけを対象とする
            if (fieldSymbol.ContainingType.TypeKind != TypeKind.Enum) {
                return;
            }

            var comment = DocumentComment.Parse(fieldSymbol.GetDocumentationCommentXml());

            //列挙定数コメントを診断する
            DiagnoseComment(comment, context, fieldSymbol.Locations[0]);
        }
    }
}