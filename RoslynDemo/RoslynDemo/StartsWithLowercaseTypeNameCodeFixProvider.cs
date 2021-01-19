using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.CodeFixes;
using CodeChecker.Defines;
using System.Composition;
using CodeChecker.Delegates;

namespace CodeChecker
{
    [ExportCodeFixProvider(LanguageNames.CSharp, Name = nameof(StartsWithLowercaseTypeNameCodeFixProvider)), Shared]
    public class StartsWithLowercaseTypeNameCodeFixProvider : TypeNameCodeFixProvider
    {
        protected override string Title => "型名の先頭文字を大文字に変更します";
        protected override string AnalyzerId => Define.ID_STARTS_WITH_LOWERCASE_TYPE_NAME_ANALYZER;

        protected override string newName(string oldName) {
            return Functions.ToUpeerFirstChar(oldName);
        }
    }
}
