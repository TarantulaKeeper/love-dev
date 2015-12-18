using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LoveDevMatchmakingLib
{
    class PersonalityCategory : Questions
    {
        public int TotalValue { get; set; }
        public List<string> Questions { get; set; }
    }
}
