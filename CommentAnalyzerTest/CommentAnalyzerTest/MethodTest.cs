using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CommentAnalyzerTest
{
    /// <summary>
    /// メソッドコメントに対する評価を行うためのクラスです。
    /// </summary>
    class MethodTest
    {
        /// <summary>
        /// メソッドのテストです。
        /// </summary>
        /// <param name="">あああます</param>
        /// <param name="b"></param>
        /// <param name="c">ううう</param>
        /// <returns>   aaa </returns>
        int DumyMethod(int a,string b, List<int> c) {
            return 0;
        }

        /// <summary>
        /// aaaです
        /// </summary>
        /// <param></param>
        /// <returns>戻り値ないよ</returns>
        public MethodTest() {

        }

        /// <summary>
        /// サマリです。
        /// </summary>
        /// <param name="a">です</param>
        /// <param>nameのないparam</param>
        /// <param name="">nameが空のparam</param>
        /// <param name="b">不要なparam</param>
        /// <returns>戻り値です</returns>
        public int DummyMethod2(int a) {
            return 0;
        }

    }
}
