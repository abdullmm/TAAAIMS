using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for ResetPassword
/// </summary>
public partial class ResetPassword : System.Web.UI.Page
{
    private SqlCommand cmd;
    private static string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
    private SqlConnection con = new SqlConnection(constr);
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void resetPassBtn_Click(object sender, EventArgs e)
    {

            cmd = new SqlCommand("spResetPassword", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter paramUsername = new SqlParameter("@FindEmail", txtEmail.Text);

            cmd.Parameters.Add(paramUsername);

            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                if (Convert.ToBoolean(rdr["ReturnCode"]))
                {
                    SendPasswordResetEmail(rdr["Email"].ToString(), txtEmail.Text, rdr["UniqueId"].ToString());
                    lblMessage.Text = "An email with instructions to reset your password is sent to your registered email";
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Email not found!";
                }
            }
    }

    private void SendPasswordResetEmail(string ToEmail, string UserName, string UniqueId)
    {
        // MailMessage class is present is System.Net.Mail namespace
        MailMessage mailMessage = new MailMessage("clarityconsulting484@gmail.com", ToEmail);


        // StringBuilder class is present in System.Text namespace
        StringBuilder sbEmailBody = new StringBuilder();
        sbEmailBody.Append("Dear " + UserName + ",<br/><br/>");
        sbEmailBody.Append("Please click on the following link to reset your password");
        sbEmailBody.Append("<br/>"); sbEmailBody.Append("http://animalworld.us-east-1.elasticbeanstalk.com/NewPassword.aspx?uid=" + UniqueId);
        //sbEmailBody.Append("<br/>"); sbEmailBody.Append("http://localhost/World/NewPassword.aspx?uid=" + UniqueId);
        sbEmailBody.Append("<br/><br/>");
        sbEmailBody.Append("<b>Pragim Technologies</b>");

        mailMessage.IsBodyHtml = true;

        mailMessage.Body = sbEmailBody.ToString();
        mailMessage.Subject = "Reset Your Password";
        SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);

        smtpClient.Credentials = new System.Net.NetworkCredential()
        {
            UserName = "clarityconsulting484@gmail.com",
            Password = "TAAAIMS123"
        };

        smtpClient.EnableSsl = true;
        smtpClient.Send(mailMessage);
    }
}