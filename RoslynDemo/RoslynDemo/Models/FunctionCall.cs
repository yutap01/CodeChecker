using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.CodeAnalysis.Diagnostics;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;

namespace CodeChecker.Models
{
    /// <summary>
    /// 関数(メソッド)呼び出しに関する情報を管理するオブジェクト
    /// </summary>
    public class FunctionCall
    {
        public SyntaxNodeAnalysisContext Context { get; private set; }

        /// <summary>
        /// 呼び出されているメソッドの名前
        /// </summary>
        public string MethodName
        {
            get
            {
                var node = Context.Node as InvocationExpressionSyntax;
                if (node == null)
                {
                    return null;
                }
                var expression = node.Expression as MemberAccessExpressionSyntax;
                return (expression != null) ? expression.Name.Identifier.ToString() : null;
            }
        }

        /// <summary>
        /// 呼び出されているメソッドの名前(クラス名.メソッド名)
        /// </summary>
        public string MethodNameFromClass
        {
            get
            {
                var node = Context.Node as InvocationExpressionSyntax;
                if (node == null)
                {
                    return null;
                }
                var expression = node.Expression as MemberAccessExpressionSyntax;
                return (expression != null) ? expression.ToString() : null;
            }
        }

        /// <summary>
        /// 呼び出し側のメソッドの名前
        /// </summary>
        public string ContainMethodName
        {
            get
            {
                return Context.ContainingSymbol.Name;
            }
        }

        /// <summary>
        /// 呼び出し側のメソッドのnamespace
        /// </summary>
        public string ContainNamespace
        {
            get
            {
                //TODO:削除
                Debug.WriteLine("Namespace:" + Context.ContainingSymbol.ContainingNamespace.Name);
                return Context.ContainingSymbol.ContainingNamespace.Name;
            }
        }

        /// <summary>
        /// 引数のリストを返す
        /// </summary>
        public IList<ArgumentSyntax> Arguments
        {
            get
            {
                var node = Context.Node as InvocationExpressionSyntax;
                if (node == null)
                {
                    return null;
                }
                return node.ArgumentList.Arguments.ToList();
            }
        }

        /// <summary>
        /// コンストラクタ
        /// </summary>
        /// <param name="context"></param>
        public FunctionCall(SyntaxNodeAnalysisContext context)
        {
            Context = context;
        }
    }
}