using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CodeChecker.Delegates
{
    static class Predicates
    {
        public static readonly Predicate<string> ContainUnderscore = (name => name.Contains("_"));
        public static readonly Predicate<string> StartsWithLowercase = (name => Char.IsLower(name[0]));
    }
}
