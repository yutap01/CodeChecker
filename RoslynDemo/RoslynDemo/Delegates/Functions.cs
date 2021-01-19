using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CodeChecker.Delegates
{
    class Functions {
        public static Func<string, string> DeleteUnderscore = (name => name.Replace("_", ""));
        public static Func<string, string> ToUpeerFirstChar = ((name) => {
            var characters = name.ToCharArray();
            var upperCharcter = char.ToUpper(characters[0]);
            characters[0] = upperCharcter;

            return new string(characters);
        });
    }
}
