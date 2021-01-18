using System.Collections.Immutable;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    public abstract class TypeNameAnalyzer : NameAnalyzer
    {
        //アナライザーを初期化する
        public override void Initialize(AnalysisContext context) {
            context.RegisterSymbolAction(AnalyzeSymbol, SymbolKind.NamedType);
        }

        //型名定義シンボルを診断する
        protected override void AnalyzeSymbol(SymbolAnalysisContext context) {
            // SymbolKind.Namedtypeで登録したので、対応するINamedTypeSymbolオブジェクトがcontextを通じて取得できる
            var namedTypeSymbol = (INamedTypeSymbol)context.Symbol;
            var typeName = namedTypeSymbol.Name;

            //型名を診断する
            DiagnoseName(context, typeName, namedTypeSymbol.Locations[0]);

        }
    }
}
