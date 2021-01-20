using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.CodeFixes;
using CodeChecker.Defines;
using System.Composition;
using CodeChecker.Delegates;
using CodeChecker.Second;

namespace CodeChecker.Third
{
    [ExportCodeFixProvider(LanguageNames.CSharp, Name = nameof(ContainUnderscorePropertyNameCodeFixProvider)), Shared]
    public class ContainUnderscorePropertyNameCodeFixProvider : PropertyNameCodeFixProvider
    {
        protected override string Title => "アンダーバーを削除します";
        protected override string AnalyzerId => Define.ID_CONTAIN_UNDERSCORE_PROPERTY_NAME_ANALYZER;

        protected override string newName(string oldName) {
            return Functions.DeleteUnderscore(oldName);
        }
    }
}
