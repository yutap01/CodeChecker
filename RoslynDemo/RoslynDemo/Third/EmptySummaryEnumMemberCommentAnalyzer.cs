using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class EmptySummaryEnumMemberCommentAnalyzer : EnumMemberCommentAnalyzer
    {
        protected override string Id => Define.ID_EMPTY_SUMMARY_ENUM_MEMBER_COMMENT_ANALYZER;
        protected override string Title => "列挙定数コメントの<summary>内に有効な記述がありません";
        protected override string FormatedMessage => "列挙定数 '{0}' のコメントの<summary>内に有効な記述がありません";
        protected override string Description => "列挙定数コメントの<summary>には有効な記述が必要です";

        protected override bool validate(DocumentComment comment) {
            return Predicates.EmptySummaryComment(comment);
        }
    }
}
