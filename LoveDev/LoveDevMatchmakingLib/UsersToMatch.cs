using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL_Project;

namespace LoveDevMatchmakingLib
{
    class UsersToMatch
    {
        public int UsersToMatchGeneralInterestValue { get; set; }
        public int UsersToMatchPersonalityValue { get; set; }
        static DAL dal;

        public UsersToMatch()
        {
            dal = new DAL();
            dal.ExecuteProcedure("spGetAllUsersForMatch");
        }
    }
}
