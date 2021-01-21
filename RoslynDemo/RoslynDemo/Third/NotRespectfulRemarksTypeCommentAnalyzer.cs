using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class NotRespectfulRemarksTypeCommentAnalyzer : TypeCommentAnalyzer
    {
        protected override string Id => Define.ID_NOT_RESPECTFUL_REMARKS_TYPE_COMMENT_ANALYZER;
        protected override string Title => "型コメントの<remarks>の記述が敬体ではありません";
        protected override string FormatedMessage => "型 '{0}' のコメントの<remarks>の記述が敬体ではありません";
        protected override string Description => "型のコメントの<remarks>は敬体で記述してください";

        protected override bool validate(DocumentComment comment) {
            return Predicates.NotRespectfulRemarksComment(comment);
        }
    }
}
