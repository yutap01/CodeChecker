using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    public abstract class MethodNameAnalyzer : NameAnalyzer
    {
        //アナライザーを初期化する
        public override void Initialize(AnalysisContext context) {
            context.RegisterSymbolAction(AnalyzeSymbol, SymbolKind.Method);
        }

        //メソッド名定義シンボルを診断する
        protected override void AnalyzeSymbol(SymbolAnalysisContext context) {
            // SymbolKind.Methodで登録したので、対応するIMethodSymbolオブジェクトがcontextを通じて取得できる
            var methodSymbol = (IMethodSymbol)context.Symbol;

            //悲しいことに、プロパティのゲッター/セッター名に自動で付与されるget_やset_まで対象になってしまうため、プロパティのゲッター/セッターは対象外とする
            if(methodSymbol.MethodKind == MethodKind.PropertyGet || methodSymbol.MethodKind == MethodKind.PropertySet) {
                return;
            }

            var methodName = methodSymbol.Name;

            //メソッド名を診断する
            DiagnoseName(context,methodName, methodSymbol.Locations[0]);
        }
    }
}
