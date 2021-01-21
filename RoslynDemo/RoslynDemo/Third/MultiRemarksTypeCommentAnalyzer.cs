using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class MultiRemarksTypeCommentAnalyzer : TypeCommentAnalyzer
    {
        protected override string Id => Define.ID_MULTI_REMARKS_TYPE_COMMENT_ANALYZER;
        protected override string Title => "型コメントに<remarks>記述が複数存在します。";
        protected override string FormatedMessage => "型 '{0}' のコメントに<remarks>記述が複数存在します。";
        protected override string Description => "型のコメントに<remarks>記述は1つだけ有効です。";

        protected override bool validate(DocumentComment comment) {
            return Predicates.MultiRemarksComment(comment);
        }
    }
}
