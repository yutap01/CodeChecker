using CodeChecker.Base;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;
using System.Collections.Immutable;

namespace CodeChecker.First
{
    public abstract class NameAnalyzer : SymbolAnalyzer
    {
        public NameAnalyzer() : base("Naming", DiagnosticSeverity.Error)
        {
        }

        //名前を診断する(第2階層はシンボルを特定し、シンボルからnameを取得する。第2階層はAnalyzeSymbolメソッドにてnameを特定次第、このメソッドを呼び出す義務がある)
        protected void DiagnoseName(string name, SymbolAnalysisContext context, Location location)
        {
            //シンボルが無視対象の場合、診断しない
            var strNamespace = context.Symbol.ContainingNamespace.ToString();
            if (IsIgnored(context, this.GetType().Name, strNamespace))
            {
                return;
            }

            //nameが未入力の場合は無視する
            if (string.IsNullOrEmpty(name))
            {
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