using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class NotRespectfulSummaryEnumMemberCommentAnalyzer : EnumMemberCommentAnalyzer
    {
        protected override string Id => Define.ID_NOT_RESPECTFUL_SUMMARY_ENUM_MEMBER_COMMENT_ANALYZER;
        protected override string Title => "列挙定数コメントの<summary>の記述が敬体ではありません";
        protected override string FormatedMessage => "列挙定数 '{0}' のコメントの<summary>の記述が敬体ではありません";
        protected override string Description => "列挙定数のコメントの<summary>は敬体で記述してください";

        protected override bool validate(DocumentComment comment) {
            return Predicates.NotRespectfulSummaryComment(comment);
        }
    }
}
