using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

namespace TravelThings.BackEnd
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSendOtp_Click(object sender, EventArgs e)
        {
            pnlSendMail.Visible = false;
            pnlResetPassword.Visible = true;
        }

        protected void SendMail()
        {
            MailMessage msg = new MailMessage();
            System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
            try
            {
                msg.Subject = "Add Subject";
                msg.Body = "Add Email Body Part";
                msg.From = new MailAddress("chiranjeeviaratakatla@gmail.com");
                msg.To.Add("prmilamohan@gmail.com");//To mail address
                msg.IsBodyHtml = true;
                client.Host = "smtp.gmail.com";
                System.Net.NetworkCredential basicauthenticationinfo = new System.Net.NetworkCredential("chiranjeeviaratakatla@gmail.com", "Chiru%%!@86#");
                client.Port = int.Parse("587");
                client.EnableSsl = true;
                client.UseDefaultCredentials = false;
                //client.UseDefaultCredentials = false;
                client.Credentials = basicauthenticationinfo;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.Send(msg);
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}