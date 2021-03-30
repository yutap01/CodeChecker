using CommentAnalyzerTest.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CommentAnalyzerTest
{
    class Program
    {
        static int Main(string[] arg) {
            var methodName = "bad Name";
            LogUtility.WarnLog("ClassName", "MainProc", "parameters");
            return 0;
        }
    }

    /// <dummysummary>
    /// 型のXMLコメントの書式不正
    /// </summary>
    class Dummy1
    {

    }

    /// <dummysummary>
    /// 型のXMLコメントにsummaryなし
    /// </dummysummary>
    class Dummy2
    {

    }

    /// <summary>
    ///          
    /// </summary>
    /// <remarks>
    /// 型のsummaryに有効な値がない
    /// </remarks>
    class Dummy3
    {

    }

    /// <summary>
    /// 型のsummaryが複数 
    /// </summary>
    /// <summary>
    ///          
    /// </summary>
    class Dummy4
    {

    }

    /// <summary>
    /// 型のsummaryが敬体で書かれていない 
    /// </summary>
    class Dummy5
    {

    }

    /// <summary>
    /// 型のremarksが複数書かれています
    /// </summary>
    /// <remarks>
    /// remarks1です。
    /// </remarks>
    /// <remarks>
    /// remarks2です。
    /// </remarks>
    class Dummy6
    {

    }

    /// <summary>
    /// 型のremarksに有効な値がない
    /// </summary>
    /// <remarks>
    /// 
    /// </remarks>
    class Dummy7
    {

    }

    /// <summary>
    /// 型のremarksが敬体で書かれていない。
    /// </summary>
    /// <remarks>
    /// remaks1ずら。
    /// </remarks>
    class Dummy8
    {

    }

    /// <summary>
    /// 型のremarksが敬体で書かれていません。
    /// </summary>
    /// <remarks>
    /// remaks1です
    /// </remarks>
    class Dummy9
    {

    }

    /// <summary>
    /// 型サマリです。
    /// </summary>
    /// <remarks>
    /// remaks1です
    /// </remarks>
    class Dummy10
    {
        //コメントなし
        void Method01() {
            Method02(30);
            Utility.LogUtility.WarnLog("className", "Method01", "parameters");
        }

        /// <dummysummary>
        /// メソッド書式不正
        /// </summary>
        void Method02(int a) {
            ; }

        /// <dummysummary>
        /// メソッドサマリなし不正
        /// </dummysummary>
        void Method03() {; }

        /// <summary>
        /// メソッドサマリが複数
        /// </summary>
        /// <summary>
        /// メソッドサマリが複数
        /// </summary>
        void Method04() {; }

        //メソッドサマリに有効な値が存在しない
        /// <summary>
        ///    
        /// </summary>
        void Method05() {; }

        /// <summary>
        /// メソッドサマリが敬体でない
        /// </summary>
        void Method06() {; }

        /// <summary>
        /// remarksが複数あります
        /// </summary>
        /// <remarks>
        /// remarksです
        /// </remarks>
        /// <remarks>
        /// remarksです
        /// </remarks>
        void Method07() {; }

        /// <summary>
        /// remarksに有効な値がありません
        /// </summary>
        /// <remarks>
        /// 
        /// </remarks>
        void Method08() {; }

        /// <summary>
        /// サマリです。
        /// </summary>
        /// <remarks>
        /// remarksだ
        /// </remarks>
        void Method09() {; }

        /// <summary>
        /// 正常系のサマリです。
        /// </summary>
        /// <remarks>
        /// 正常系のremaksです。
        /// </remarks>
        void Method10() {; }
    }
    /// <summary>
    /// 型サマリです。
    /// </summary>
    /// <remarks>
    /// remaks1です
    /// </remarks>
    class Dummy11
    {
        //コメントなし
        int Property01 {get; set; }

        /// <dummysummary>
        /// プロパティ書式不正
        /// </summary>
        int Property02 {get; set; }

        /// <dummysummary>
        /// プロパティサマリなし不正
        /// </dummysummary>
        int Property03 {get; set; }

        /// <summary>
        /// プロパティサマリが複数
        /// </summary>
        /// <summary>
        /// プロパティサマリが複数
        /// </summary>
        int Property04 {get; set; }

        //プロパティサマリに有効な値が存在しない
        /// <summary>
        ///    
        /// </summary>
        int Property05 {get; set; }

        /// <summary>
        /// プロパティサマリが敬体でない
        /// </summary>
        int Property06 {get; set; }

        /// <summary>
        /// remarksが複数あります
        /// </summary>
        /// <remarks>
        /// remarksです
        /// </remarks>
        /// <remarks>
        /// remarksです
        /// </remarks>
        int Property07 {get; set; }

        /// <summary>
        /// remarksに有効な値がありません
        /// </summary>
        /// <remarks>
        /// 
        /// </remarks>
        int Property08 {get; set; }

        /// <summary>
        /// サマリです。
        /// </summary>
        /// <remarks>
        /// remarksだ
        /// </remarks>
        int Property09 {get; set; }

        /// <summary>
        /// 正常系のサマリです。
        /// </summary>
        /// <remarks>
        /// 正常系のremaksです。
        /// </remarks>
        int Property10 {get; set; }


        /// <summary>
        /// 正常系のサマリです。
        /// </summary>
        /// <remarks>
        /// 正常系のremaksです。
        /// </remarks>
        int this[int i] {
            get {
                return 0;
            }
            set {

            }
        }
    }

    


    /// <summary>
    /// 型サマリです。
    /// </summary>
    /// <remarks>
    /// remaks1です
    /// </remarks>
    class Dummy12
    {
        //コメントなし
        int Field01 ;

        /// <dummysummary>
        /// フィールド書式不正
        /// </summary>
        int Field02 ;

        /// <dummysummary>
        /// フィールドサマリなし不正
        /// </dummysummary>
        int Field03 ;

        /// <summary>
        /// フィールドサマリが複数
        /// </summary>
        /// <summary>
        /// フィールドサマリが複数
        /// </summary>
        int Field04 ;

        //フィールドサマリに有効な値が存在しない
        /// <summary>
        ///    
        /// </summary>
        int Field05 ;

        /// <summary>
        /// フィールドサマリが敬体でない
        /// </summary>
        int Field06 ;

        /// <summary>
        /// remarksが複数あります
        /// </summary>
        /// <remarks>
        /// remarksです
        /// </remarks>
        /// <remarks>
        /// remarksです
        /// </remarks>
        int Field07 ;

        /// <summary>
        /// remarksに有効な値がありません
        /// </summary>
        /// <remarks>
        /// 
        /// </remarks>
        int Field08 ;

        /// <summary>
        /// サマリです。
        /// </summary>
        /// <remarks>
        /// remarksだ
        /// </remarks>
        int Field09 ;

        /// <summary>
        /// 正常系のサマリです。
        /// </summary>
        /// <remarks>
        /// 正常系のremaksです。
        /// </remarks>
        int Field10 ;
    }


    /// <summary>
    /// 型サマリです。
    /// </summary>
    /// <remarks>
    /// remaks1です
    /// </remarks>
    enum DummyEnum
    {
        //コメントなし
        EnumMember01,

        /// <dummysummary>
        /// フィールド書式不正
        /// </summary>
        EnumMember02,

        /// <dummysummary>
        /// フィールドサマリなし不正
        /// </dummysummary>
        EnumMember03,

        /// <summary>
        /// フィールドサマリが複数
        /// </summary>
        /// <summary>
        /// フィールドサマリが複数
        /// </summary>
        EnumMember04,

        //フィールドサマリに有効な値が存在しない
        /// <summary>
        ///    
        /// </summary>
        EnumMember05,

        /// <summary>
        /// フィールドサマリが敬体でない
        /// </summary>
        EnumMember06,

        /// <summary>
        /// remarksが複数あります
        /// </summary>
        /// <remarks>
        /// remarksです
        /// </remarks>
        /// <remarks>
        /// remarksです
        /// </remarks>
        EnumMember07,

        /// <summary>
        /// remarksに有効な値がありません
        /// </summary>
        /// <remarks>
        /// 
        /// </remarks>
        EnumMember08,

        /// <summary>
        /// サマリです。
        /// </summary>
        /// <remarks>
        /// remarksだ
        /// </remarks>
        EnumMember09,

        /// <summary>
        /// 正常系のサマリです。
        /// </summary>
        /// <remarks>
        /// 正常系のremaksです。
        /// </remarks>
        EnumMember10
    }

}
