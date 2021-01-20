using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    public abstract class TypeNameAnalyzer : NameAnalyzer
    {
        //�A�i���C�U�[������������
        //TODO:sealed��
        public override void Initialize(AnalysisContext context)
        {
            context.RegisterSymbolAction(AnalyzeSymbol, SymbolKind.NamedType);
        }

        //�^����`�V���{����f�f����
        //TODO:sealed��
        protected override void AnalyzeSymbol(SymbolAnalysisContext context)
        {
            // SymbolKind.Namedtype�œo�^�����̂ŁA�Ή�����INamedTypeSymbol�I�u�W�F�N�g��context��ʂ��Ď擾�ł���
            var namedTypeSymbol = (INamedTypeSymbol)context.Symbol;
            var typeName = namedTypeSymbol.Name;

            //�^����f�f����
            DiagnoseName(typeName, context, namedTypeSymbol.Locations[0]);
        }
    }
}