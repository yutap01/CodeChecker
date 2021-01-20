using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.CodeActions;
using Microsoft.CodeAnalysis.CodeFixes;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.CodeAnalysis.Rename;
using System;
using System.Collections.Generic;
using System.Collections.Immutable;
using System.Composition;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace CodeChecker.First
{
    public abstract class NameCodeFixProvider : CodeFixProvider
    {
        //修正対象の名前に対する修正後の名前を提供します。
        protected abstract string newName(string oldName);

        // 変換に対するタイトルを通知します。
        protected abstract string Title { get; }

        // 対象の診断IDを通知します。
        protected abstract string AnalyzerId { get; }

        public sealed override ImmutableArray<string> FixableDiagnosticIds => ImmutableArray.Create(AnalyzerId);

        public sealed override FixAllProvider GetFixAllProvider() {
            return WellKnownFixAllProviders.BatchFixer;
        }

        //SyntaxNodesを取得します。
        protected async Task<IEnumerable<Microsoft.CodeAnalysis.SyntaxNode>> GetSyntaxNodes(CodeFixContext context) {
            // SyntaxRootの取得
            var root = await context.Document.GetSyntaxRootAsync(context.CancellationToken).ConfigureAwait(false);

            // 対応するDiagnoticとそのドキュメント上での位置を取得
            var diagnostic = context.Diagnostics.First();
            var diagnosticSpan = diagnostic.Location.SourceSpan;

            // Code Fix Actionのために必要な情報(ここでは「型宣言のSyntax」)を取得
            // どのSyntaxが必要かはActionの実装に必要な情報によって変わる
            var token = root.FindToken(diagnosticSpan.Start);
            var parentToken = token.Parent;
            return  parentToken.AncestorsAndSelf();
        }

        // Actionを登録します。
        protected void RegisterAction(CodeFixContext context,Func<CancellationToken,Task<Microsoft.CodeAnalysis.Solution>> createChangedSolution) {
            var diagnostic = context.Diagnostics.First();
            context.RegisterCodeFix(
                CodeAction.Create(
                    title: Title,
                    createChangedSolution: createChangedSolution,
                    equivalenceKey: Title),
                diagnostic);
        }

        //newSolutionを通知します。
        protected async Task<Solution> GetNewSolution(Document document, MemberDeclarationSyntax typeDecl, CancellationToken cancellationToken,string oldName) {
            // SemanticModelを取得し、修正対象となるSymbolを取得する
            var semanticModel = await document.GetSemanticModelAsync(cancellationToken);
            var typeSymbol = semanticModel.GetDeclaredSymbol(typeDecl, cancellationToken);

            // Symbolを書き換えて修正後のSolutionを生成する
            // Renameの場合はRenamerクラスが、書き換え用のメソッドを提供している
            var orginalSolution = document.Project.Solution;
            var optionSet = orginalSolution.Workspace.Options;
            return await Renamer.RenameSymbolAsync(document.Project.Solution, typeSymbol, newName(oldName), optionSet, cancellationToken).ConfigureAwait(false);
        }
    }
}
