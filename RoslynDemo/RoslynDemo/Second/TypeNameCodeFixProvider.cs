using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.CodeFixes;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using System;
using System.Composition;
using CodeChecker.First;

namespace CodeChecker.Second
{
    //[ExportCodeFixProvider(LanguageNames.CSharp, Name = nameof(TypeNameCodeFixProvider)), Shared]
    public abstract class TypeNameCodeFixProvider : NameCodeFixProvider
    {
        public sealed override async Task RegisterCodeFixesAsync(CodeFixContext context) {
            var syntaxNodes = await GetSyntaxNodes(context);
            var typeDeclarationSynatxes = syntaxNodes.OfType<MemberDeclarationSyntax>();
            var declaration = typeDeclarationSynatxes.First();

            //Actionの登録
            RegisterAction(context,(token => RemoveUnderscoreAsync(context.Document, declaration, token)));
        }

        private async Task<Solution> RemoveUnderscoreAsync(Document document, MemberDeclarationSyntax typeDecl, CancellationToken cancellationToken) {
            // 型宣言のSyntaxから型名を取得し、修正候補となる名前を作成する
            SyntaxToken identifierToken;
            if (typeDecl is BaseTypeDeclarationSyntax) {
                identifierToken = ((BaseTypeDeclarationSyntax)typeDecl).Identifier;
            } else if (typeDecl is DelegateDeclarationSyntax) {
                identifierToken = ((DelegateDeclarationSyntax)typeDecl).Identifier;
            } else {
                throw new InvalidCastException("想定外のMemberDeclarationSyntaxを受け取りました。");
            }           

            return await GetNewSolution(document, typeDecl, cancellationToken, identifierToken.Text);
        }

    }
}