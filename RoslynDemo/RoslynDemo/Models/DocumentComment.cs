using Microsoft.CodeAnalysis;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Xml;
using System.Xml.Linq;

namespace CodeChecker.Models
{
    /// <summary>
    /// ドキュメンテーションコメントを格納するクラスです。
    /// </summary>
    public class DocumentComment
    {
        /// <summary>
        /// コメントのSymbolからXMLコメント文字列が正しく取得できなかったことを表す文字列
        /// </summary>
        /// <remarks>
        /// この文字列はシンボルからXMLドキュメントの取得に失敗した際に、ISymbol.GetDocumentationCommentXml()が通知する文字列に含まれる
        /// </remarks>
        private const string BADLY_FORMED_XML_COMMENT = "Badly formed XML comment";

        // <summary>タグを表す文字列
        private const string TAG_NAME_SUMMARY = "summary";

        // <remarks>タグを表す文字列
        private const string TAG_NAME_REMARKS = "remarks";

        // <returns>タグを表す文字列
        private const string TAG_NAME_RETURNS = "returns";

        // <param>タグを表す文字列
        private const string TAG_NAME_PARAM = "param";

        // name属性を表す文字列
        private const string ATTRIBUTE_NAME_NAME = "name";

        //<summary>の値
        public string Summary { get; set; }

        //<remarks>の値
        public string Remarks { get; set; }

        //key:<param>のname属性の値。value:発生しているエラー
        private Dictionary<string, Error> paramErrorDictionary;

        //<returns>の値
        public string Returns { get; set; }

        //パース時に検出されるエラー種(同時に複数起こる)
        public enum Error
        {
            NOT_EXISTS,                 //ドキュメンテーションコメントが存在しない
            INVALID_FORMAT,             //ドキュメンテーションコメントの書式が不正
            MULTI_SUMMARY,              //<summary>が複数ある
            NOT_EXISTS_SUMMARY,         //<summary>が存在しない
            EMPTY_SUMMARY,              //<summary>の値が空
            NOT_RESPECTFUL_SUMMARY,     //<summary>の値が日本語かつ、敬体でない
            MULTI_REMARKS,              //<remarks>が複数ある
            EMPTY_REMARKS,              //<remarks>の値が空
            NOT_RESPECTFUL_REMARKS,     //<remarks>の値が日本語かつ、敬体でない
            NOT_EXISTS_PARAM,           //必要な状況かつ、<param>が全く存在していない
            NOT_EXISTS_EACH_PARAM,      //必要な状況かつ、ある引数に対応する<param>が存在していない
            UNNECESSARY_PARAM_NAME,     //不必要なnameの<param>が存在している
            NO_NAME_PARAM,              //name属性を持たない<param>が存在している
            UNNECESSARY_PARAM,          //メソッドに引数がないのに<param>が存在している
            EMPTY_PARAM,                //値が空の<param>が1つ以上存在している
            DUPULICATE_PARAM,           //同一のnameを持つ<param>が複数存在している
            NOT_RESPECTFUL_PARAM,       //値が日本語かつ敬体ではない<param>が1つ以上存在している
            MULTI_RETURNS,              //<returns>が複数ある
            EMPTY_RETURNS,              //<returns>の値が空
            NOT_RESPECTFUL_RETURNS,     //<returns>の値が日本語かつ、敬体でない
            NOT_EXISTS_RETURNS,         //必要な状況かつ、<returns>が存在しない
            UNNECESSARY_RETURNS,        //不要な状況かつ、<returns>が存在する
        }

        //解析時に検出されたエラー群
        private List<Error> errors = new List<Error>();

        public IReadOnlyList<Error> Errors
        {
            get
            {
                return errors;
            }
        }

        static public DocumentComment Parse(string xmlComment)
        {
            var obj = new DocumentComment();

            //***** 全シンボル 共通 *****

            //*** コメント全体 ***
            //ドキュメンテーションコメントの存在チェック
            if (string.IsNullOrEmpty(xmlComment))
            {
                obj.errors.Add(Error.NOT_EXISTS);
                return obj;
            }

            //書式不正
            if (xmlComment.Contains(BADLY_FORMED_XML_COMMENT))
            {
                obj.errors.Add(Error.INVALID_FORMAT);
                return obj;
            }

            //XDocumentによる解析
            XDocument doc;
            try
            {
                doc = XDocument.Parse(xmlComment);
            }
            catch (XmlException)
            {
                obj.errors.Add(Error.INVALID_FORMAT);
                return obj;
            }

            //*** <summary>について ***
            var summaryTags = doc.Descendants(TAG_NAME_SUMMARY).ToList();
            if (summaryTags.Count == 0)
            {
                obj.errors.Add(Error.NOT_EXISTS_SUMMARY);
            }
            else if (summaryTags.Count > 1)
            {
                obj.errors.Add(Error.MULTI_SUMMARY);
            }
            else
            {
                obj.Summary = summaryTags[0].Value;
                if (string.IsNullOrWhiteSpace(obj.Summary))
                {
                    obj.errors.Add(Error.EMPTY_SUMMARY);
                }
                else if (notRespectful(obj.Summary))
                {
                    obj.errors.Add(Error.NOT_RESPECTFUL_SUMMARY);
                }
            }

            //*** <remarks>について ***
            var remarksTags = doc.Descendants(TAG_NAME_REMARKS).ToList();
            if (remarksTags.Count > 1)
            {
                obj.errors.Add(Error.MULTI_REMARKS);
            }
            else if (remarksTags.Count == 1)
            {
                obj.Remarks = remarksTags[0].Value;
                if (string.IsNullOrWhiteSpace(obj.Remarks))
                {
                    obj.errors.Add(Error.EMPTY_REMARKS);
                }
                else if (notRespectful(obj.Remarks))
                {
                    obj.errors.Add(Error.NOT_RESPECTFUL_REMARKS);
                }
            }

            return obj;
        }

        /// <summary>
        /// コメントに対し、一般(型、プロパティ、フィールド、列挙定数と共通)の評価に加え、メソッド固有の評価を行う
        /// </summary>
        /// <param name="symbol"></param>
        /// <returns></returns>
        static public DocumentComment ParseForMethod(IMethodSymbol symbol)
        {
            var strXml = symbol.GetDocumentationCommentXml();

            //*** 共通のコメント評価 ***
            var comment = Parse(strXml);

            //*** 以下、メソッド固有の評価 ***

            // paramタグ一覧
            //XDocumentによる解析
            XDocument doc;
            try
            {
                doc = XDocument.Parse(strXml);
            }
            catch (XmlException)
            {
                //共通のコメント評価でエラーが登録されているはずなので、ここではエラーの登録を行わない
                return comment;
            }

            // メソッド定義の引数名一覧
            var decParamNames = symbol.Parameters.Select(param => param.Name).ToList();

            //引数コメントの評価
            parseParameterOfMethod(comment, doc, decParamNames);

            //戻り値コメントの評価
            ParseForReturnOfMethod(comment, doc, symbol.ReturnsVoid);

            return comment;
        }

        /// <summary>
        /// 指定のエラーを持つ、引数名の一覧を通知する
        /// </summary>
        /// <param name="targetError"></param>
        /// <returns></returns>
        public List<string> GetParamNamesByError(Error targetError)
        {
            var errors = paramErrorDictionary.Where(entry => entry.Value == targetError);
            return errors.Select(entry => entry.Key).ToList();
        }

        /// <summary>
        /// 特定のエラーを持つパラメータが存在するかどうかを通知する
        /// </summary>
        /// <param name="targetError"></param>
        /// <returns></returns>
        public bool hasParamError(Error targetError)
        {
            return (paramErrorDictionary != null) ?
                paramErrorDictionary.Select(entry => entry.Value).ToList().Contains(targetError) :
                false;
        }

        //指定のメッセージが日本語を含み、かつ敬体でない場合trueとなる
        private static bool notRespectful(string message)
        {
            var isJapanese = Regex.IsMatch(message, @"[\p{IsHiragana}\p{IsKatakana}\p{IsCJKUnifiedIdeographs}]+");
            return isJapanese &&
                !message.Contains("ます") &&
                !message.Contains("ません") &&
                !message.Contains("です") &&
                !message.Contains("ました") &&
                !message.Contains("ください");
        }

        /// <summary>
        /// 引数コメントの評価
        /// </summary>
        /// <param name="comment">コメントオブジェクトです</param>
        /// <param name="doc">XMLコメントです</param>
        /// <param name="decParamNames">メソッド定義における引数名の一覧です</param>
        private static void parseParameterOfMethod(DocumentComment comment, XDocument doc, IReadOnlyList<string> decParamNames)
        {
            //メソッド定義に引数がある場合
            List<XElement> paramTags = doc.Descendants(TAG_NAME_PARAM).ToList();

            //nameのないparam
            var noNameTags = paramTags.Where(tag => tag.Attribute(ATTRIBUTE_NAME_NAME) == null).ToList();
            if (noNameTags.Count > 0)
            {
                comment.errors.Add(Error.NO_NAME_PARAM);
                return;
            }

            if (decParamNames.Count > 0)
            {
                //<param>タグの一覧
                var commentParamNames = paramTags.Select(tag => tag.Attribute(ATTRIBUTE_NAME_NAME).Value).ToList();

                //<param>タグが全く存在しない
                if (paramTags.Count == 0)
                {
                    comment.errors.Add(Error.NOT_EXISTS_PARAM);
                    return;
                }

                //<param>タグのname値をkeyとし、とタグの値をvalueとする辞書を生成する(TODO:検証 キーが重複している場合どうなる？？)
                Dictionary<string, string> nameParamValueDictionary;
                try
                {
                    nameParamValueDictionary = paramTags.ToDictionary(tag => tag.Attribute(ATTRIBUTE_NAME_NAME).Value, tag => tag.Value);
                }
                catch (ArgumentException)
                {
                    comment.errors.Add(Error.DUPULICATE_PARAM);
                    return;
                }

                //各パラメータについての評価
                comment.paramErrorDictionary = ParseForMethodParameters(decParamNames, commentParamNames, nameParamValueDictionary);
            }
            else
            {
                //引数がないメソッドで<params>が存在している
                if (paramTags.Count > 0)
                {
                    comment.errors.Add(Error.UNNECESSARY_PARAM);
                    return;
                }
            }
        }

        /// <summary>
        /// メソッドの引数についての評価を行う
        /// </summary>
        /// <param name="decParamNames">メソッド定義の引数名の一覧</param>
        /// <param name="commentParamNames">メソッドコメントのparamタグのname属性値の一覧</param>
        /// <returns>引数名をキーとし、それに対して発生しているエラーをバリューとする辞書</returns>
        private static Dictionary<string, Error> ParseForMethodParameters(
            IReadOnlyList<string> decParamNames,
            IReadOnlyList<string> commentParamNames,
            Dictionary<string, string> nameParamValueDictionary)
        {
            //戻り値(引数名をキーとし、発生したエラーを値とする辞書)
            var res = new Dictionary<string, Error>();

            //それぞれの引数について
            foreach (var decParamName in decParamNames)
            {
                //引数に対応するparamタグが存在しない
                if (!commentParamNames.Contains(decParamName))
                {
                    res.Add(decParamName, Error.NOT_EXISTS_EACH_PARAM);
                    continue;
                }

                var tagValue = nameParamValueDictionary[decParamName];
                //引数に対応するparamタグは存在しているが、有効な値が存在しない
                if (string.IsNullOrWhiteSpace(tagValue))
                {
                    res.Add(decParamName, Error.EMPTY_PARAM);
                    continue;
                }

                //有効な値は書かれているが敬体ではない
                if (notRespectful(tagValue))
                {
                    res.Add(decParamName, Error.NOT_RESPECTFUL_PARAM);
                }
            }

            //不要なparamタグが存在している(nameが空やWhiteSpaceの場合も含む)
            foreach (var commentParamName in commentParamNames)
            {
                if (!decParamNames.Contains(commentParamName))
                {
                    res.Add(commentParamName, Error.UNNECESSARY_PARAM_NAME);
                }
            }

            return res;
        }

        /// <summary>
        /// 戻り値に対するコメントを評価する
        /// </summary>
        /// <param name="comment">commentオブジェクトです</param>
        /// <param name="doc">ドキュメントXMLです。</param>
        /// <param name="isVoid">関数に戻り値がない場合trueになります</param>
        private static void ParseForReturnOfMethod(DocumentComment comment, XDocument doc, bool isVoid)
        {
            XElement tagReturn;
            try
            {
                tagReturn = doc.Descendants(TAG_NAME_RETURNS).SingleOrDefault();
            }
            catch (InvalidOperationException)
            {
                //タグが複数ある場合
                comment.errors.Add(Error.MULTI_RETURNS);
                return;
            }

            if (isVoid)
            {
                //戻り値のないメソッド
                if (tagReturn != null)
                {
                    comment.errors.Add(Error.UNNECESSARY_RETURNS);
                    return;
                }
            }
            else
            {
                //<returns>タグが存在しない
                if (tagReturn == null)
                {
                    comment.errors.Add(Error.NOT_EXISTS_RETURNS);
                    return;
                }

                //値の評価
                var strReturnComment = tagReturn.Value;

                //値に有効な文字列がセットされていない
                if (string.IsNullOrWhiteSpace(strReturnComment))
                {
                    comment.errors.Add(Error.EMPTY_RETURNS);
                    return;
                }

                //値が敬体でない
                if (notRespectful(strReturnComment))
                {
                    comment.errors.Add(Error.NOT_RESPECTFUL_RETURNS);
                    return;
                }
            }
        }
    }
}