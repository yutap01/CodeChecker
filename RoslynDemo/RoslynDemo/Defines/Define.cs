using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CodeChecker.Defines
{
    class Define
    {
        public static readonly string ID_CONTAIN_UNDERSCORE_TYPE_NAME_ANALYZER = typeof(ContainUnderscoreTypeNameAnalyzer).Name;
        public static readonly string ID_CONTAIN_UNDERSCORE_METHOD_NAME_ANALYZER = typeof(ContainUnderscoreMethodNameAnalyzer).Name;
        public static readonly string ID_CONTAIN_UNDERSCORE_PROPERTY_NAME_ANALYZER = typeof(ContainUnderscorePropertyNameAnalyzer).Name;
        public static readonly string ID_STARTS_WITH_LOWERCASE_TYPE_NAME_ANALYZER = typeof(StartsWithLowercaseTypeNameAnalyzer).Name;
        public static readonly string ID_STARTS_WITH_LOWERCASE_METHOD_NAME_ANALYZER = typeof(StartsWithLowercaseMethodNameAnalyzer).Name;
        public static readonly string ID_STARTS_WITH_LOWERCASE_PROPERTY_NAME_ANALYZER = typeof(StartsWithLowercasePropertyNameAnalyzer).Name;

    }
}
