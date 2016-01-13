using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LoveDevLib
{
    class Message
    {
        public int ToUserID { get; set; }
        public int FromUserID { get; set; }
        public string ToFirstName { get; set; }
        public string FromFirstName { get; set; }
        public string DateSent { get; set; }
        public string MessageSent { get; set; }

        public Message(int toUserID, int fromUserID, string toFirstName, string fromFirstName, string dateSent, string messageSent)
        {
            this.ToUserID = toUserID;
            this.FromUserID = fromUserID;
            this.ToFirstName = toFirstName;
            this.FromFirstName = fromFirstName;
            this.DateSent = dateSent;
            this.MessageSent = messageSent;
        }
        
    }
}
