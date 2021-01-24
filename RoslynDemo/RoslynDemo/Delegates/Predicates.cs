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
        public static readonly Predicate<DocumentComment> MultiRemarksComment = (comment => comment.Errors.Contains(DocumentComment.Error.MULTI_REMARKS));
        public static readonly Predicate<DocumentComment> EmptyRemarksComment = (comment => comment.Errors.Contains(DocumentComment.Error.EMPTY_REMARKS));
        public static readonly Predicate<DocumentComment> NotRespectfulRemarksComment = (comment => comment.Errors.Contains(DocumentComment.Error.NOT_RESPECTFUL_REMARKS));
        public static readonly Predicate<DocumentComment> ParamLessComment = (comment => comment.Errors.Contains(DocumentComment.Error.NOT_EXISTS_PARAM));
        public static readonly Predicate<DocumentComment> EachParamLessComment = (comment => comment.hasParamError(DocumentComment.Error.NOT_EXISTS_EACH_PARAM));
        public static readonly Predicate<DocumentComment> DuplicateParamComment = (comment => comment.Errors.Contains(DocumentComment.Error.DUPULICATE_PARAM));
        public static readonly Predicate<DocumentComment> EmptyParamComment = (comment => comment.hasParamError(DocumentComment.Error.EMPTY_PARAM));
        public static readonly Predicate<DocumentComment> NotRespectfulEachParamComment = (comment => comment.hasParamError(DocumentComment.Error.NOT_RESPECTFUL_PARAM));
        public static readonly Predicate<DocumentComment> ReturnLessComment = (comment => comment.Errors.Contains(DocumentComment.Error.NOT_EXISTS_RETURNS));
        public static readonly Predicate<DocumentComment> EmptyReturnsComment = (comment => comment.Errors.Contains(DocumentComment.Error.EMPTY_RETURNS));
        public static readonly Predicate<DocumentComment> NotRespectfulReturnsComment = (comment => comment.Errors.Contains(DocumentComment.Error.NOT_RESPECTFUL_RETURNS));
        public static readonly Predicate<DocumentComment> MultiReturnsComment = (comment => comment.Errors.Contains(DocumentComment.Error.MULTI_RETURNS));
        public static readonly Predicate<DocumentComment> UnnecessaryReturnsComment = (comment => comment.Errors.Contains(DocumentComment.Error.UNNECESSARY_RETURNS));
        public static readonly Predicate<DocumentComment> UnnecessaryParamComment = (comment => comment.Errors.Contains(DocumentComment.Error.UNNECESSARY_PARAM));
        public static readonly Predicate<DocumentComment> UnnecessaryParamNameComment = (comment => comment.hasParamError(DocumentComment.Error.UNNECESSARY_PARAM_NAME));
        public static readonly Predicate<DocumentComment> NameLessParamComment = (comment => comment.Errors.Contains(DocumentComment.Error.NO_NAME_PARAM));
    }
}
