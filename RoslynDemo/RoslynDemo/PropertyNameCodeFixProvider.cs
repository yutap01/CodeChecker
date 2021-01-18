using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.CodeFixes;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using System;

namespace CodeChecker
{
    public abstract class PropertyNameCodeFixProvider : NameCodeFixProvider
    {
        public sealed override async Task RegisterCodeFixesAsync(CodeFixContext context) {
            var syntaxNodes = await GetSyntaxNodes(context);
            var propertyDeclarationSynatxes = syntaxNodes.OfType<PropertyDeclarationSyntax>();
            var declaration = propertyDeclarationSynatxes.First();

            //Actionの登録
            RegisterAction(context, (token => RemoveUnderscoreAsync(context.Document, declaration, token)));
        }

        private async Task<Solution> RemoveUnderscoreAsync(Document document, PropertyDeclarationSyntax propertyDecl, CancellationToken cancellationToken) {
            // プロパティ宣言のSyntaxからプロパティ名を取得し、修正候補となる名前を作成する
            SyntaxToken identifierToken = propertyDecl.Identifier;
            return await GetNewSolution(document, propertyDecl, cancellationToken, identifierToken.Text);
        }

    }
}
