using CodeChecker.First;
using CodeChecker.Models;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Second
{
    public abstract class MethodCommentAnalyzer : CommentAnalyzer
    {
        //アナライザーを初期化する
        public sealed override void Initialize(AnalysisContext context) {
            context.RegisterSymbolAction(AnalyzeSymbol, SymbolKind.Method);
        }

        //型名定義シンボルを診断する
        protected sealed override void AnalyzeSymbol(SymbolAnalysisContext context) {
            var methodSymbol = (IMethodSymbol)context.Symbol;

            //悲しいことに、プロパティのゲッター/セッター名に自動で付与されるget_やset_まで対象になってしまうため、プロパティのゲッター/セッターは対象外とする
            if (methodSymbol.MethodKind == MethodKind.PropertyGet || methodSymbol.MethodKind == MethodKind.PropertySet) {
                return;
            }

            var comment = DocumentComment.ParseForMethod(methodSymbol);

            //型名を診断する
            DiagnoseComment(comment, context, methodSymbol.Locations[0]);
        }
    }
}