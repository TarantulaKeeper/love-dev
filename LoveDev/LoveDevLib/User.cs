using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LoveDevLib
{
    public class User
    {
        public int UserID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int Age { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public string Email { get; set; }
        public int GenderID { get; set; }
        public string UserPhoto { get; set; }
        public bool IsAdmin { get; set; }
        public bool IsActive { get; set; }
        public List<int> MatchesUserIDList { get; set; }

        public User(int UserID, string FirstName, string LastName, int Age, string City, string Country, string Email, int GenderID, bool IsAdmin, bool IsActive)
        {
            this.UserID = UserID;
            this.FirstName = FirstName;
            this.LastName = LastName;
            this.Age = Age;
            this.City = City;
            this.Country = Country;
            this.Email = Email;
            this.GenderID = GenderID;
            this.IsActive = IsActive;
            this.IsAdmin = IsAdmin;
            this.MatchesUserIDList = UserManager.GetMatches(UserID);
        }

        public override string ToString()
        {
            return "UserID: " + UserID + " || Name: " + FirstName + " " + LastName + " || Age: " + Age + " || Country: " + Country;
        }
    }
}
