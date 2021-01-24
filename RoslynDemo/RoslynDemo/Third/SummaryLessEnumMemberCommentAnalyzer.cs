using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class SummaryLessEnumMemberCommentAnalyzer : EnumMemberCommentAnalyzer
    {
        protected override string Id => Define.ID_SUMMARY_LESS_ENUM_MEMBER_COMMENT_ANALYZER;
        protected override string Title => "列挙定数コメントに<summary>記述がありません";
        protected override string FormatedMessage => "列挙定数 '{0}' のコメントに<summary>記述がありません";
        protected override string Description => "列挙定数のコメントには<summary>記述が必要です";

        protected override bool validate(DocumentComment comment) {
            return Predicates.SummaryLessComment(comment);
        }
    }
}
