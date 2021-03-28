using CodeChecker.Manager;
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
                helpLinkUri: "",
                description: Description);
        }

        //対象とする診断の定義
        public sealed override ImmutableArray<DiagnosticDescriptor> SupportedDiagnostics => ImmutableArray.Create(Descripter);

        //Operationを診断にかける
        protected abstract void AnalyzeOperation(SyntaxNodeAnalysisContext context);

        //診断対象の要素が無視対象であるかを調べる
        protected bool IsIgnored(SyntaxNodeAnalysisContext context, string analyzer, string strNamespace)
        {
            return NamespaceIgnoreManager.GetInstance(context).IsIgnored(analyzer, strNamespace);
        }
    }
}