using Microsoft.CodeAnalysis;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
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

        // <returns>タグを表す文字列
        private const string TAG_NAME_RETURNS = "returns";

        // <param>タグを表す文字列
        private const string TAG_NAME_PARAM = "param";

        // name属性を表す文字列
        private const string ATTRIBUTE_NAME_NAME = "name";

        //<summary>の値
        public string Summary { get; set; }

        //key:<param>のname属性の値。value:<param>の値。
        private Dictionary<string, string> paramDictionary = null;

        //<returns>の値
        public string Returns { get; set; }

        //解析時に検出されるエラー種(同時に複数起こる)
        public enum Error
        {
            NOT_EXISTS,                 //ドキュメンテーションコメントが存在しない
            INVALID_FORMAT,             //ドキュメンテーションコメントの書式が不正
            MULTI_SUMMARY,              //<summary>が複数ある
            NOT_EXISTS_SUMMARY,         //<summary>が存在しない
            EMPTY_SUMMARY,              //<summary>の値が空
            NOT_RESPECTFUL_SUMMARY,     //<summary>の値が日本語かつ、敬体でない
            NOT_EXISTS_PARAM,           //必要な状況かつ、<param>が存在していない
            UNNECESSAY_PARAM,           //不要な状況かつ、<param>が1つ以上存在している
            EMPTY_PARAM,                //値が空の<param>が1つ以上存在している
            NOT_RESPECTFUL_PARAM,       //値が日本語かつ敬体ではない<param>が1つ以上存在している
            MULTI_RETURNS,              //<returns>が複数ある
            EMPTY_RETURNS,              //<returns>の値が空
            NOT_RESPECTFUL_RETURNS,     //<returns>の値が日本語かつ、敬体でない
            NOT_EXISTS_RETURNS,         //必要な状況かつ、<returns>が存在しない
            UNNECESSAY_RETURNS,         //不要な状況かつ、<returns>が存在する
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

        static public DocumentComment Parse(string xmlComment, SymbolKind kind)
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
            var doc = XDocument.Parse(xmlComment);

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

            //シンボルがメソッドの場合にのみ必要となる検証
            //TODO

            return obj;
        }

        //指定のメッセージが日本語かつ敬体でない場合trueとなる
        private static bool notRespectful(string message)
        {
            var isJapanese = Regex.IsMatch(message, @"[\p{IsHiragana}\p{IsKatakana}\p{IsCJKUnifiedIdeographs}]+");
            return isJapanese && !message.Contains("ます。") && !message.Contains("です。");
        }
    }
}