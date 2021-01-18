using System.Collections.Immutable;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    public abstract class TypeNameAnalyzer : NameAnalyzer
    {
        //�A�i���C�U�[������������
        public override void Initialize(AnalysisContext context) {
            context.RegisterSymbolAction(AnalyzeSymbol, SymbolKind.NamedType);
        }

        //�^����`�V���{����f�f����
        protected override void AnalyzeSymbol(SymbolAnalysisContext context) {
            // SymbolKind.Namedtype�œo�^�����̂ŁA�Ή�����INamedTypeSymbol�I�u�W�F�N�g��context��ʂ��Ď擾�ł���
            var namedTypeSymbol = (INamedTypeSymbol)context.Symbol;
            var typeName = namedTypeSymbol.Name;

            //�^����f�f����
            DiagnoseName(context, typeName, namedTypeSymbol.Locations[0]);

        }
    }
}
