using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL_Project;
using System.Data;
using LoveDevLib

namespace LoveDevMatchmakingLib
{
    class MatchMakingAlgorithm
    {
        public UserValues UserValues { get; set; }
        public List<UserValues> MatchedUserGeneralInterestValue { get; set; }

        static DAL dal;

        public MatchMakingAlgorithm()
        {
            UserValues = new UserValues(Security.CurrentUser.UserID);
            MatchedUserGeneralInterestValue = UsersToMatch.GetAllUsers();

        }
        // Personality :
        // 10 point difference available between both users. If not users will not be matched.
        //General Interest:
        //General interest will be all values added together and multiplied by the amount of categories there is
        //There will be a 10 point difference available for this as well. 
        //Users will be matched by PERSONALITY first. If their general interest points are close enough they will be matched.
        //NIKOS PERSONAL OPINOIN:
        //We should add a *5* point leeway in general interests where we could add a "Light match"
        //
        
    }
}
