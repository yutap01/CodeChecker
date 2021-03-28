using CodeChecker.Defines;
using CodeChecker.Second;
using Microsoft.CodeAnalysis.Diagnostics;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CodeChecker.Models;
using Microsoft.CodeAnalysis.CSharp;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(Microsoft.CodeAnalysis.LanguageNames.CSharp)]
    class IllegalSecondArgumentLogFunctionCallAnalyzer : LogFunctionCallAnalyzer
    {
        protected override string Id => Define.ID_ILLEGAL_SECOND_ARGUMENT_LOG_FUNCTION_CALL_ANALYZER;
        protected override string Title => "Logメソッド第2引数誤り";
        //TODO:第2引数の値を表示したい
        protected override string FormatedMessage => " Log関数の第2引数が不正です。";
        protected override string Description => "Log関数の第2引数は呼び出し元の関数名を記述します。";

         protected override bool validate(FunctionCall functionCall) {

            //LogUtilityのLogメソッドの場合
            if(functionCall.MethodNameFull != "Utility.LogUtility.WarnLog" &&
                functionCall.MethodNameFull != "Utility.LogUtility.ErrorLog") {
                return false;
            }

            //[コーディング途中対策]Argumentsがnullの場合
            if(functionCall.Arguments == null) {
                return false;
            }

            //[コーディング途中対策]ArgumentsのCountが2未満の場合
            if (functionCall.Arguments.Count < 2) {
                return false;
            }

            //第2引数に記述されているものが文字列リテラルの場合のみ有効
            if(functionCall.Arguments[1].Expression.Kind() != SyntaxKind.StringLiteralExpression) {
                return false;
            }
            return functionCall.ContainMethodName != functionCall.Arguments[1].ToString().Replace("\"", "");
        }
    }
}
