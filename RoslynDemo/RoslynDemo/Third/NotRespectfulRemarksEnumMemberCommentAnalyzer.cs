using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class NotRespectfulRemarksEnumMemberCommentAnalyzer : EnumMemberCommentAnalyzer
    {
        protected override string Id => Define.ID_NOT_RESPECTFUL_REMARKS_ENUM_MEMBER_COMMENT_ANALYZER;
        protected override string Title => "列挙定数コメントの<remarks>の記述が敬体ではありません";
        protected override string FormatedMessage => "列挙定数 '{0}' のコメントの<remarks>の記述が敬体ではありません";
        protected override string Description => "列挙定数のコメントの<remarks>は敬体で記述してください";

        protected override bool validate(DocumentComment comment) {
            return Predicates.NotRespectfulRemarksComment(comment);
        }
    }
}
