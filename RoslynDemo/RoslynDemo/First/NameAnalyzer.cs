﻿using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;
using System.Collections.Immutable;

namespace CodeChecker.First
{
    public abstract class NameAnalyzer : DiagnosticAnalyzer
    {
        //これらのプロパティの値は第3層で決定する

        protected abstract string Id { get; }               // アナライザーID
        protected abstract string Title { get; }            // 診断タイトル
        protected abstract string FormatedMessage { get; }  // 診断時に出力するメッセージ(フォーマット付き)
        protected abstract string Description { get; }      // 診断時の詳細メッセージ

        private readonly DiagnosticDescriptor Descripter = null;

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
        public sealed override ImmutableArray<DiagnosticDescriptor> SupportedDiagnostics => ImmutableArray.Create(Descripter);

        //名前を定義するシンボルを診断にかける(第2階層にてシンボルとそのnameを特定する))
        protected abstract void AnalyzeSymbol(SymbolAnalysisContext context);

        //名前を診断する(第2階層はシンボルを特定し、シンボルからnameを取得する。第2階層はAnalyzeSymbolメソッドにてnameを特定次第、このメソッドを呼び出す義務がある)
        protected void DiagnoseName(string name, SymbolAnalysisContext context, Location location)
        {
            //nameが未入力の場合は無視する
            if (string.IsNullOrEmpty(name)) {
                return;
            }

            //名前が違反している場合、診断書を発行する
            if (validate(name))
            {
                var diagnostic = Diagnostic.Create(Descripter, location, name);
                context.ReportDiagnostic(diagnostic);
            }
        }

        //名前を検証するメソッド(第3階層にてどのような診断を行うかを決定する)
        protected abstract bool validate(string name);
    }
}