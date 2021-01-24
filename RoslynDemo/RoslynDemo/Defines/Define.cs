using CodeChecker.Third;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CodeChecker.Defines
{
    class Define
    {
        //無視リストの定義ファイル
        public const string IGNOERE_LIST_FILE_NAME = "ignorelist.json";

        //アナライザーID(各アナライザークラス名と一致)
        public static readonly string ID_CONTAIN_UNDERSCORE_TYPE_NAME_ANALYZER = typeof(ContainUnderscoreTypeNameAnalyzer).Name;
        public static readonly string ID_CONTAIN_UNDERSCORE_METHOD_NAME_ANALYZER = typeof(ContainUnderscoreMethodNameAnalyzer).Name;
        public static readonly string ID_CONTAIN_UNDERSCORE_PROPERTY_NAME_ANALYZER = typeof(ContainUnderscorePropertyNameAnalyzer).Name;
        public static readonly string ID_STARTS_WITH_LOWERCASE_TYPE_NAME_ANALYZER = typeof(StartsWithLowercaseTypeNameAnalyzer).Name;
        public static readonly string ID_STARTS_WITH_LOWERCASE_METHOD_NAME_ANALYZER = typeof(StartsWithLowercaseMethodNameAnalyzer).Name;
        public static readonly string ID_STARTS_WITH_LOWERCASE_PROPERTY_NAME_ANALYZER = typeof(StartsWithLowercasePropertyNameAnalyzer).Name;
        public static readonly string ID_SUMMARY_LESS_TYPE_COMMENT_ANALYZER = typeof(SummaryLessTypeCommentAnalyzer).Name;
        public static readonly string ID_COMMENT_LESS_TYPE_COMMENT_ANALYZER = typeof(CommentLessTypeCommentAnalyzer).Name;
        public static readonly string ID_INVALID_FORMAT_TYPE_COMMENT_ANALYZER = typeof(InvalidFormatTypeCommentAnalyzer).Name;
        public static readonly string ID_MULTI_SUMMARY_TYPE_COMMENT_ANALYZER = typeof(MultiSummaryTypeCommentAnalyzer).Name;
        public static readonly string ID_EMPTY_SUMMARY_TYPE_COMMENT_ANALYZER = typeof(EmptySummaryTypeCommentAnalyzer).Name;
        public static readonly string ID_NOT_RESPECTFUL_SUMMARY_TYPE_COMMENT_ANALYZER = typeof(NotRespectfulSummaryTypeCommentAnalyzer).Name;
        public static readonly string ID_MULTI_REMARKS_TYPE_COMMENT_ANALYZER = typeof(MultiRemarksTypeCommentAnalyzer).Name;
        public static readonly string ID_EMPTY_REMARKS_TYPE_COMMENT_ANALYZER = typeof(EmptyRemarksTypeCommentAnalyzer).Name;
        public static readonly string ID_NOT_RESPECTFUL_REMARKS_TYPE_COMMENT_ANALYZER = typeof(NotRespectfulRemarksTypeCommentAnalyzer).Name;
        public static readonly string ID_SUMMARY_LESS_METHOD_COMMENT_ANALYZER = typeof(SummaryLessMethodCommentAnalyzer).Name;
        public static readonly string ID_COMMENT_LESS_METHOD_COMMENT_ANALYZER = typeof(CommentLessMethodCommentAnalyzer).Name;
        public static readonly string ID_INVALID_FORMAT_METHOD_COMMENT_ANALYZER = typeof(InvalidFormatMethodCommentAnalyzer).Name;
        public static readonly string ID_MULTI_SUMMARY_METHOD_COMMENT_ANALYZER = typeof(MultiSummaryMethodCommentAnalyzer).Name;
        public static readonly string ID_EMPTY_SUMMARY_METHOD_COMMENT_ANALYZER = typeof(EmptySummaryMethodCommentAnalyzer).Name;
        public static readonly string ID_NOT_RESPECTFUL_SUMMARY_METHOD_COMMENT_ANALYZER = typeof(NotRespectfulSummaryMethodCommentAnalyzer).Name;
        public static readonly string ID_MULTI_REMARKS_METHOD_COMMENT_ANALYZER = typeof(MultiRemarksMethodCommentAnalyzer).Name;
        public static readonly string ID_EMPTY_REMARKS_METHOD_COMMENT_ANALYZER = typeof(EmptyRemarksMethodCommentAnalyzer).Name;
        public static readonly string ID_NOT_RESPECTFUL_REMARKS_METHOD_COMMENT_ANALYZER = typeof(NotRespectfulRemarksMethodCommentAnalyzer).Name;
        public static readonly string ID_SUMMARY_LESS_PROPERTY_COMMENT_ANALYZER = typeof(SummaryLessPropertyCommentAnalyzer).Name;
        public static readonly string ID_COMMENT_LESS_PROPERTY_COMMENT_ANALYZER = typeof(CommentLessPropertyCommentAnalyzer).Name;
        public static readonly string ID_INVALID_FORMAT_PROPERTY_COMMENT_ANALYZER = typeof(InvalidFormatPropertyCommentAnalyzer).Name;
        public static readonly string ID_MULTI_SUMMARY_PROPERTY_COMMENT_ANALYZER = typeof(MultiSummaryPropertyCommentAnalyzer).Name;
        public static readonly string ID_EMPTY_SUMMARY_PROPERTY_COMMENT_ANALYZER = typeof(EmptySummaryPropertyCommentAnalyzer).Name;
        public static readonly string ID_NOT_RESPECTFUL_SUMMARY_PROPERTY_COMMENT_ANALYZER = typeof(NotRespectfulSummaryPropertyCommentAnalyzer).Name;
        public static readonly string ID_MULTI_REMARKS_PROPERTY_COMMENT_ANALYZER = typeof(MultiRemarksPropertyCommentAnalyzer).Name;
        public static readonly string ID_EMPTY_REMARKS_PROPERTY_COMMENT_ANALYZER = typeof(EmptyRemarksPropertyCommentAnalyzer).Name;
        public static readonly string ID_NOT_RESPECTFUL_REMARKS_PROPERTY_COMMENT_ANALYZER = typeof(NotRespectfulRemarksPropertyCommentAnalyzer).Name;
        public static readonly string ID_SUMMARY_LESS_FIELD_COMMENT_ANALYZER = typeof(SummaryLessFieldCommentAnalyzer).Name;
        public static readonly string ID_COMMENT_LESS_FIELD_COMMENT_ANALYZER = typeof(CommentLessFieldCommentAnalyzer).Name;
        public static readonly string ID_INVALID_FORMAT_FIELD_COMMENT_ANALYZER = typeof(InvalidFormatFieldCommentAnalyzer).Name;
        public static readonly string ID_MULTI_SUMMARY_FIELD_COMMENT_ANALYZER = typeof(MultiSummaryFieldCommentAnalyzer).Name;
        public static readonly string ID_EMPTY_SUMMARY_FIELD_COMMENT_ANALYZER = typeof(EmptySummaryFieldCommentAnalyzer).Name;
        public static readonly string ID_NOT_RESPECTFUL_SUMMARY_FIELD_COMMENT_ANALYZER = typeof(NotRespectfulSummaryFieldCommentAnalyzer).Name;
        public static readonly string ID_MULTI_REMARKS_FIELD_COMMENT_ANALYZER = typeof(MultiRemarksFieldCommentAnalyzer).Name;
        public static readonly string ID_EMPTY_REMARKS_FIELD_COMMENT_ANALYZER = typeof(EmptyRemarksFieldCommentAnalyzer).Name;
        public static readonly string ID_NOT_RESPECTFUL_REMARKS_FIELD_COMMENT_ANALYZER = typeof(NotRespectfulRemarksFieldCommentAnalyzer).Name;
        public static readonly string ID_SUMMARY_LESS_ENUM_MEMBER_COMMENT_ANALYZER = typeof(SummaryLessEnumMemberCommentAnalyzer).Name;
        public static readonly string ID_COMMENT_LESS_ENUM_MEMBER_COMMENT_ANALYZER = typeof(CommentLessEnumMemberCommentAnalyzer).Name;
        public static readonly string ID_INVALID_FORMAT_ENUM_MEMBER_COMMENT_ANALYZER = typeof(InvalidFormatEnumMemberCommentAnalyzer).Name;
        public static readonly string ID_MULTI_SUMMARY_ENUM_MEMBER_COMMENT_ANALYZER = typeof(MultiSummaryEnumMemberCommentAnalyzer).Name;
        public static readonly string ID_EMPTY_SUMMARY_ENUM_MEMBER_COMMENT_ANALYZER = typeof(EmptySummaryEnumMemberCommentAnalyzer).Name;
        public static readonly string ID_NOT_RESPECTFUL_SUMMARY_ENUM_MEMBER_COMMENT_ANALYZER = typeof(NotRespectfulSummaryEnumMemberCommentAnalyzer).Name;
        public static readonly string ID_MULTI_REMARKS_ENUM_MEMBER_COMMENT_ANALYZER = typeof(MultiRemarksEnumMemberCommentAnalyzer).Name;
        public static readonly string ID_EMPTY_REMARKS_ENUM_MEMBER_COMMENT_ANALYZER = typeof(EmptyRemarksEnumMemberCommentAnalyzer).Name;
        public static readonly string ID_NOT_RESPECTFUL_REMARKS_ENUM_MEMBER_COMMENT_ANALYZER = typeof(NotRespectfulRemarksEnumMemberCommentAnalyzer).Name;
        public static readonly string ID_PARAM_LESS_METHOD_COMMENT_ANALYZER = typeof(ParamLessMethodCommentAnalyzer).Name;
        public static readonly string ID_EACH_PARAM_LESS_METHOD_COMMENT_ANALYZER = typeof(EachParamLessMethodCommentAnalyzer).Name;
        public static readonly string ID_DUPLICATE_PARAM_METHOD_COMMENT_ANALYZER = typeof(DuplicateParamMethodCommentAnalyzer).Name;
        public static readonly string ID_EMPTY_EACH_PARAM_METHOD_COMMENT_ANALYZER = typeof(EmptyEachParameterMethodCommentAnalyzer).Name;
        public static readonly string ID_NOT_RESPECTFUL_EACH_PARAM_METHOD_COMMENT_ANALYZER = typeof(NotRespectfulEachParameterMethodCommentAnalyzer).Name;
        public static readonly string ID_RETURN_LESS_METHOD_COMMENT_ANALYZER = typeof(ReturnLessMethodCommentAnalyzer).Name;
        public static readonly string ID_EMPTY_RETURNS_METHOD_COMMENT_ANALYZER = typeof(EmptyReturnsMethodCommentAnalyzer).Name;
        public static readonly string ID_NOT_RESPECTFUL_RETURNS_METHOD_COMMENT_ANALYZER = typeof(NotRespectfulReturnsMethodCommentAnalyzer).Name;
        public static readonly string ID_MULTI_RETURNS_METHOD_COMMENT_ANALYZER = typeof(MultiReturnsMethodCommentAnalyzer).Name;
        public static readonly string ID_UNNECESSARY_RETURNS_METHOD_COMMENT_ANALYZER = typeof(UnnecessaryReturnsMethodCommentAnalyzer).Name;
        public static readonly string ID_UNNECESSARY_PARAM_METHOD_COMMENT_ANALYZER = typeof(UnnecessaryParamMethodCommentAnalyzer).Name;
        public static readonly string ID_UNNECESSARY_PARAM_NAME_METHOD_COMMENT_ANALYZER = typeof(UnnecessaryParamNameMethodCommentAnalyzer).Name;
        public static readonly string ID_NAME_LESS_PARAM_METHOD_COMMENT_ANALYZER = typeof(NameLessParamMethodCommentAnalyzer).Name;
    }
}
