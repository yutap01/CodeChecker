using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class NotRespectfulRemarksPropertyCommentAnalyzer : PropertyCommentAnalyzer
    {
        protected override string Id => Define.ID_NOT_RESPECTFUL_REMARKS_PROPERTY_COMMENT_ANALYZER;
        protected override string Title => "プロパティコメントの<remarks>の記述が敬体ではありません";
        protected override string FormatedMessage => "プロパティ '{0}' のコメントの<remarks>の記述が敬体ではありません";
        protected override string Description => "プロパティのコメントの<remarks>は敬体で記述してください";

        protected override bool validate(DocumentComment comment) {
            return Predicates.NotRespectfulRemarksComment(comment);
        }
    }
}
