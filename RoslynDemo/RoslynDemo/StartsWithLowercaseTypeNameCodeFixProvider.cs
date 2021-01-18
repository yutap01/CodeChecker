using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.CodeFixes;
using CodeChecker.Defines;
using System.Composition;

namespace CodeChecker
{
    [ExportCodeFixProvider(LanguageNames.CSharp, Name = nameof(StartsWithLowercaseTypeNameCodeFixProvider)), Shared]
    public class StartsWithLowercaseTypeNameCodeFixProvider : TypeNameCodeFixProvider
    {
        protected override string Title => "型名の先頭文字を大文字に変更します";
        protected override string AnalyzerId => Define.ID_STARTS_WITH_LOWERCASE_TYPE_NAME_ANALYZER;

        protected override string newName(string oldName) {
            var characters = oldName.ToCharArray();
            var upperCharcter = char.ToUpper(characters[0]);
            characters[0] = upperCharcter;

            return new string(characters);
        }
    }
}
