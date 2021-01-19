using System.Diagnostics;
using System.Linq;
using System.Text.RegularExpressions;
using System.Xml.Linq;
using TsTypeDeclarationGenerator.Declarators;

namespace TsTypeDeclarationGenerator.Parser
{
    /// <summary>
    /// XML形式のコメントを解析するクラスです。
    /// </summary>
    public static class CommentParser
    {
        /// <summary>
        /// コメントのSymbolからXMLコメント文字列が正しく取得できなかったことを表す文字列
        /// </summary>
        /// <remarks>
        /// この文字列はシンボルからXMLドキュメントの取得に失敗した際に、ISymbol.GetDocumentationCommentXml()が通知する文字列に含まれる
        /// </remarks>
        private const string BADLY_FORMED_XML_COMMENT = "Badly formed XML comment";

        /// <summary>
        /// コメント本文を記述するタグの名前
        /// </summary>
        private const string COMMENT_TAG_NAME = "summary";

        /// <summary>
        /// 不正なコメントを検出した際にコンソールに出力するメッセージのヘッダ
        /// </summary>
        private const string MESSAGE_HEADER_FOR_BADLY_FORMED_XML_COMMENT = "不正な形式のコメントを検出";

        /// <summary>
        /// XML形式のコメントからコメント本文の情報を抽出します。
        /// </summary>
        /// <param name="xmlComment">XML形式のコメント情報です。</param>
        /// <param name="target">コメントの対象(型宣言 or メンバー宣言)です。</param>
        /// <returns>抽出したコメント情報です。</returns>
        public static CommentDeclarator Parse(string xmlComment, CommentDeclarator.CommentType target)
        {
            var comment = new CommentDeclarator(target);
            if (xmlComment == "")
            {
                return comment;
            }

            // XMLドキュメントの記載誤りの場合(例:終了タグがないなど)
            if (xmlComment.Contains(BADLY_FORMED_XML_COMMENT))
            {
                //Debug.WriteLine(xmlComment.ToString());
                Debug.WriteLine(MESSAGE_HEADER_FOR_BADLY_FORMED_XML_COMMENT + ":" + xmlComment);
                return comment;
            }

            // XDocumentクラスを用いてsummary要素を取得する
            XDocument doc = XDocument.Parse(xmlComment);
            var summary = doc.Descendants(COMMENT_TAG_NAME).FirstOrDefault();

            // summary要素が取得できた場合、不要な改行文字や空白文字を取り除く
            comment.Summary = (summary != null) ? RemoveAnySpaceChar(summary.Value) : string.Empty;

            return comment;
        }

        // 引数の文字列から空白文字を削除した文字列を返す
        private static string RemoveAnySpaceChar(string str)
        {
            return Regex.Replace(str, "\\s", "");
        }
    }
}