using CodeChecker.Manager;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;
using System.Collections.Immutable;

namespace CodeChecker.Base
{
    public abstract class SymbolAnalyzer : DiagnosticAnalyzer
    {
        //これらのプロパティの値は第3層で決定する

        protected abstract string Id { get; }               // アナライザーID
        protected abstract string Title { get; }            // 診断タイトル
        protected abstract string FormatedMessage { get; }  // 診断時に出力するメッセージ(フォーマット付き)
        protected abstract string Description { get; }      // 診断時の詳細メッセージ

        protected readonly DiagnosticDescriptor Descripter = null;

        public SymbolAnalyzer(string category, DiagnosticSeverity severity)
        {
            //診断に対する設定
            Descripter = new DiagnosticDescriptor(
                Id,
                Title,
                FormatedMessage,
                category,
                severity,
                true,
                helpLinkUri: "",
                description: Description);
        }

        //対象とする診断の定義
        public sealed override ImmutableArray<DiagnosticDescriptor> SupportedDiagnostics => ImmutableArray.Create(Descripter);

        //コメントを定義するシンボルを診断にかける(第2階層にてシンボルとそのnameを特定する))
        protected abstract void AnalyzeSymbol(SymbolAnalysisContext context);

        //診断対象の要素が無視対象であるかを調べる
        protected bool IsIgnored(SymbolAnalysisContext context, string analyzer, string strNamespace)
        {
            return NamespaceIgnoreManager.GetInstance(context).IsIgnored(analyzer, strNamespace);
        }
    }
}