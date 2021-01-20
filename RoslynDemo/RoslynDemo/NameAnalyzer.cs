using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;
using System.Collections.Immutable;

namespace CodeChecker
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    public abstract class NameAnalyzer : DiagnosticAnalyzer
    {
        //これらのプロパティの値は第3層で決定する

        protected abstract string Id { get; }               // アナライザーID
        protected abstract string Title { get; }            // 診断タイトル
        protected abstract string FormatedMessage { get; }  // 診断時に出力するメッセージ(フォーマット付き)
        protected abstract string Description { get; }      // 診断時の詳細メッセージ

        //TODO:protected -> private
        protected readonly DiagnosticDescriptor Descripter = null;

        public NameAnalyzer()
        {
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

        //対象とする診断の定義
        //TODO:public override -> public sealed override
        public override ImmutableArray<DiagnosticDescriptor> SupportedDiagnostics => ImmutableArray.Create(Descripter);

        //名前を定義するシンボルを診断にかける(第2階層にてシンボルとそのnameを特定する))
        protected abstract void AnalyzeSymbol(SymbolAnalysisContext context);

        //名前を診断する(第2階層はシンボルを特定し、シンボルからnameを取得する。第2階層はnameを確定次第、このメソッドを呼び出す義務がある)
        protected void DiagnoseName(string name, SymbolAnalysisContext context, Location location)
        {
            //名前が違反している場合、診断書を発行する
            if (validate(name))
            {
                var diagnostic = Diagnostic.Create(Descripter, location, name);
                context.ReportDiagnostic(diagnostic);
            }
        }

        //名前を検証する条件となるメソッド(第3階層にてどのような診断を行うかを決定する)
        protected abstract bool validate(string name);
    }
}