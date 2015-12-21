using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;

namespace LoveDevLib
{
    static public class SendMail
    {
        static public void Send(string To, string Subject, string Body)
        {
            MailMessage message = new MailMessage();

            message.From = new MailAddress("lovedevhelp@gmail.com");
            message.To.Add(new MailAddress(To));
            message.Subject = Subject;
            message.Body = Body;
            SmtpClient client = new SmtpClient();
            client.Host = "smtp.gmail.com";
            client.Port = 587;
            client.EnableSsl = true;
            client.Credentials = new System.Net.NetworkCredential("lovedevhelp@gmail.com", "Lovedev123");
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.Send(message);
        }
    }
}
