using CodeChecker.Models;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;
using System.Collections.Immutable;

namespace CodeChecker.First
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    public abstract class CommentAnalyzer : DiagnosticAnalyzer
    {
        //これらのプロパティの値は第3層で決定する

        protected abstract string Id { get; }               // アナライザーID
        protected abstract string Title { get; }            // 診断タイトル
        protected abstract string FormatedMessage { get; }  // 診断時に出力するメッセージ(フォーマット付き)
        protected abstract string Description { get; }      // 診断時の詳細メッセージ

        private readonly DiagnosticDescriptor Descripter = null;

        public CommentAnalyzer()
        {
            //診断に対する設定
            Descripter = new DiagnosticDescriptor(
                Id,
                Title,
                FormatedMessage,
                "Document Comment",
                DiagnosticSeverity.Error,
                true,
                helpLinkUri: "http://tech.tanaka733.net",
                description: Description);
        }

        //対象とする診断の定義
        public sealed override ImmutableArray<DiagnosticDescriptor> SupportedDiagnostics => ImmutableArray.Create(Descripter);

        //コメントを定義するシンボルを診断にかける(第2階層にてシンボルとそのnameを特定する))
        protected abstract void AnalyzeSymbol(SymbolAnalysisContext context);

        //コメントを診断する(第2階層はシンボルを特定し、シンボルからnameを取得する。第2階層はAnalyzeSymbolメソッドにてnameを特定次第、このメソッドを呼び出す義務がある)
        protected void DiagnoseComment(DocumentComment comment, SymbolAnalysisContext context, Location location)
        {
            //名前が違反している場合、診断書を発行する
            if (validate(comment))
            {
                var diagnostic = Diagnostic.Create(Descripter, location, context.Symbol.Name);
                context.ReportDiagnostic(diagnostic);
            }
        }

        //コメントを検証するメソッド(第3階層にてどのような診断を行うかを決定する)
        protected abstract bool validate(DocumentComment comment);
    }
}