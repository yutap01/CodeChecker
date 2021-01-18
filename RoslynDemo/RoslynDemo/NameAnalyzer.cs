using System.Collections.Immutable;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    public abstract class NameAnalyzer : DiagnosticAnalyzer
    {
        protected abstract string Id { get; }       //アナライザーID
        protected abstract string Title { get; }    //診断タイトル
        protected abstract string FormatedMessage { get; }  //診断時に出力するメッセージ(フォーマット付き)
        protected abstract string Description { get; }      //診断時の詳細メッセージ

        protected readonly DiagnosticDescriptor Descripter = null;

        public NameAnalyzer() {
            //診断に対する設定
            Descripter = new DiagnosticDescriptor(
                Id,
                Title,
                FormatedMessage,
                "Naming",
                DiagnosticSeverity.Error,
                true,
                helpLinkUri: "http://tech.tanaka733.net",
                description: Description);
        }

        //名前を検証する条件となるメソッド
        protected abstract bool validate(string name);

        //対象とする診断の定義
        public override ImmutableArray<DiagnosticDescriptor> SupportedDiagnostics => ImmutableArray.Create(Descripter);

        //名前を診断する
        protected void DiagnoseName(SymbolAnalysisContext context,string name,Location location) {
            //メソッド名が違反している場合、診断書を発行する
            if (validate(name)) {
                var diagnostic = Diagnostic.Create(Descripter, location, name);
                context.ReportDiagnostic(diagnostic);
            }
        }

        //名前定義シンボルを診断する
        protected abstract void AnalyzeSymbol(SymbolAnalysisContext context);
    }
}
