using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.CodeFixes;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using System;

namespace CodeChecker
{
    public abstract class MethodNameCodeFixProvider : NameCodeFixProvider
    {
        public sealed override async Task RegisterCodeFixesAsync(CodeFixContext context) {
            var syntaxNodes = await GetSyntaxNodes(context);
            var typeDeclarationSynatxes = syntaxNodes.OfType<MethodDeclarationSyntax>();
            var declaration = typeDeclarationSynatxes.First();

            //Actionの登録
            RegisterAction(context, (token => RemoveUnderscoreAsync(context.Document, declaration, token)));
        }

        private async Task<Solution> RemoveUnderscoreAsync(Document document, MethodDeclarationSyntax typeDecl, CancellationToken cancellationToken) {
            // メソッド宣言のSyntaxからメソッド名を取得し、修正候補となる名前を作成する
            SyntaxToken identifierToken = typeDecl.Identifier;
            return await GetNewSolution(document, typeDecl, cancellationToken, identifierToken.Text);
        }
    }
}
