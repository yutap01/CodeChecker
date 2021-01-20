using CodeChecker.Models;
using System;
using System.Linq;

namespace CodeChecker.Delegates
{
    static class Predicates
    {
        public static readonly Predicate<string> ContainUnderscore = (name => name.Contains("_"));
        public static readonly Predicate<string> StartsWithLowercase = (name => Char.IsLower(name[0]));
        public static readonly Predicate<DocumentComment> SummaryLessComment = (comment => comment.Errors.Contains(DocumentComment.Error.NOT_EXISTS_SUMMARY));
        public static readonly Predicate<DocumentComment> CommentLessComment = (comment => comment.Errors.Contains(DocumentComment.Error.NOT_EXISTS));
        public static readonly Predicate<DocumentComment> InvalidFormatComment = (comment => comment.Errors.Contains(DocumentComment.Error.INVALID_FORMAT));
        public static readonly Predicate<DocumentComment> MultiSummaryComment = (comment => comment.Errors.Contains(DocumentComment.Error.MULTI_SUMMARY));
        public static readonly Predicate<DocumentComment> EmptySummaryComment = (comment => comment.Errors.Contains(DocumentComment.Error.EMPTY_SUMMARY));
        public static readonly Predicate<DocumentComment> NotRespectfulSummaryComment = (comment => comment.Errors.Contains(DocumentComment.Error.NOT_RESPECTFUL_SUMMARY));
    }
}
