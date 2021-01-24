using CodeChecker.Defines;
using CodeChecker.Delegates;
using CodeChecker.Models;
using CodeChecker.Second;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.Diagnostics;

namespace CodeChecker.Third
{
    [DiagnosticAnalyzer(LanguageNames.CSharp)]
    class EmptyRemarksEnumMemberCommentAnalyzer : EnumMemberCommentAnalyzer
    {
        protected override string Id => Define.ID_EMPTY_REMARKS_ENUM_MEMBER_COMMENT_ANALYZER;
        protected override string Title => "列挙定数コメントの<remarks>内に有効な記述がありません";
        protected override string FormatedMessage => "列挙定数 '{0}' のコメントの<remarks>内に有効な記述がありません";
        protected override string Description => "列挙定数コメントの<remarks>には有効な記述が必要です";

        protected override bool validate(DocumentComment comment) {
            return Predicates.EmptyRemarksComment(comment);
        }
    }
}
