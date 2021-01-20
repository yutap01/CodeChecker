﻿using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    public abstract class PropertyNameAnalyzer : NameAnalyzer
    {
        //アナライザーを初期化する
        //TODO:sealed化
        public override void Initialize(AnalysisContext context)
        {
            context.RegisterSymbolAction(AnalyzeSymbol, SymbolKind.Property);
        }

        //メソッド名定義シンボルを診断する
        //TODO:sealed化
        protected override void AnalyzeSymbol(SymbolAnalysisContext context)
        {
            // SymbolKind.Propertyで登録したので、対応するIPropertySymbolオブジェクトがcontextを通じて取得できる
            var propertySymbol = (IPropertySymbol)context.Symbol;
            var propertyName = propertySymbol.Name;

            //悲しいことにインデクサの名前まで引っかかってしまう
            if (propertyName == "this[]")
            {
                return;
            }

            //プロパティ名を診断する
            DiagnoseName(propertyName, context, propertySymbol.Locations[0]);
        }
    }
}