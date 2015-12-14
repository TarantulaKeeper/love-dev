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
        public string UserPhoto { get; set; }
        public int GenderID { get; set; }     
        public int SexualOrientationID { get; set; }
        public bool IsAdmin { get; set; }
        public bool IsActive { get; set; }

        public User(int userID, string FirstName, string LastName, int Age, string City, string Country, string Email, int GenderID, int SexualOrientationID, bool IsAdmin, bool IsActive)
        {
            this.UserID = UserID;
            this.FirstName = FirstName;
            this.LastName = LastName;
            this.Age = Age;
            this.City = City;
            this.Country = Country;
            this.Email = Email;
            this.IsActive = IsActive;
            this.IsAdmin = IsAdmin;
            this.GenderID = GenderID;
            this.SexualOrientationID = SexualOrientationID;
        }
    }
}
