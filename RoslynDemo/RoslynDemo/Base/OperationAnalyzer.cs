using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;
using System;
using System.Collections.Immutable;

namespace CodeChecker.Base
{
    public abstract class OperationAnalyzer : DiagnosticAnalyzer
    {
        //これらのプロパティの値は第3層で決定する

        protected abstract string Id { get; }               // アナライザーID
        protected abstract string Title { get; }            // 診断タイトル
        protected abstract string FormatedMessage { get; }  // 診断時に出力するメッセージ(フォーマット付き)
        protected abstract string Description { get; }      // 診断時の詳細メッセージ

        protected readonly DiagnosticDescriptor Descripter = null;

        public OperationAnalyzer(string category, DiagnosticSeverity severity)
        {
            //診断に対する設定
            Descripter = new DiagnosticDescriptor(
                Id,
                Title,
                FormatedMessage,
                category,
                severity,
                true,
                helpLinkUri: "http://tech.tanaka733.net",
                description: Description);
        }

        //対象とする診断の定義
        public sealed override ImmutableArray<DiagnosticDescriptor> SupportedDiagnostics => ImmutableArray.Create(Descripter);

        //コメントを定義するシンボルを診断にかける(第2階層にてシンボルとそのnameを特定する))
        protected abstract void AnalyzeOperation(OperationAnalysisContext context);

        //診断対象の要素が無視対象であるかを調べる
        protected bool IsIgnored(OperationAnalysisContext context, string analyzer, string strNamespace)
        {
            throw new Exception("未実装");
            return false;
            //return NamespaceIgnoreManager.GetInstance(context).IsIgnored(analyzer, strNamespace);
        }
    }
}