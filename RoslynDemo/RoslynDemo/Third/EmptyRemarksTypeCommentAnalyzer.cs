using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class EmptyRemarksTypeCommentAnalyzer : TypeCommentAnalyzer
    {
        protected override string Id => Define.ID_EMPTY_REMARKS_TYPE_COMMENT_ANALYZER;
        protected override string Title => "型コメントの<remarks>内に有効な記述がありません";
        protected override string FormatedMessage => "型 '{0}' のコメントの<remarks>内に有効な記述がありません";
        protected override string Description => "型コメントの<remarks>には有効な記述が必要です";

        protected override bool validate(DocumentComment comment) {
            return Predicates.EmptyRemarksComment(comment);
        }
    }
}
