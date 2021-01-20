using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.CodeFixes;
using CodeChecker.Defines;
using System.Composition;
using CodeChecker.Delegates;
using CodeChecker.Second;

namespace CodeChecker.Third
{
    [ExportCodeFixProvider(LanguageNames.CSharp, Name = nameof(StartsWithLowercaseMethodNameCodeFixProvider)), Shared]
    public class StartsWithLowercaseMethodNameCodeFixProvider : MethodNameCodeFixProvider
    {
        protected override string Title => "メソッド名の先頭文字を大文字に変更します";
        protected override string AnalyzerId => Define.ID_STARTS_WITH_LOWERCASE_METHOD_NAME_ANALYZER;

        protected override string newName(string oldName) {
            return Functions.ToUpeerFirstChar(oldName);
        }
    }
}
