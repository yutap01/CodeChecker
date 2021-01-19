using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.CodeFixes;
using CodeChecker.Defines;
using System.Composition;
using CodeChecker.Delegates;

namespace CodeChecker
{
    [ExportCodeFixProvider(LanguageNames.CSharp, Name = nameof(ContainUnderscoreMethodNameCodeFixProvider)), Shared]
    public class ContainUnderscoreMethodNameCodeFixProvider : MethodNameCodeFixProvider
    {
        protected override string Title => "アンダーバーを削除します";
        protected override string AnalyzerId => Define.ID_CONTAIN_UNDERSCORE_METHOD_NAME_ANALYZER;

        protected override string newName(string oldName) {
            return Functions.DeleteUnderscore(oldName);
        }
    }
}
