using CodeChecker.First;
using CodeChecker.Models;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Second
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    public abstract class TypeCommentAnalyzer : CommentAnalyzer
    {
        //アナライザーを初期化する
        public sealed override void Initialize(AnalysisContext context) {
            context.RegisterSymbolAction(AnalyzeSymbol, SymbolKind.NamedType);
        }

        //型名定義シンボルを診断する
        protected sealed override void AnalyzeSymbol(SymbolAnalysisContext context) {
            // SymbolKind.Namedtypeで登録したので、対応するINamedTypeSymbolオブジェクトがcontextを通じて取得できる
            var namedTypeSymbol = (INamedTypeSymbol)context.Symbol;
            var comment = DocumentComment.Parse(namedTypeSymbol.GetDocumentationCommentXml());

            //型名を診断する
            DiagnoseComment(comment, context, namedTypeSymbol.Locations[0]);
        }
    }
}