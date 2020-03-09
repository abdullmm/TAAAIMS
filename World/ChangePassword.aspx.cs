using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using System.Configuration;

public partial class ChangePassword : System.Web.UI.Page
{
    static string connString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
    SqlConnection conn = new SqlConnection(connString);
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("SELECT UserId, [Password] FROM[dbo].Users WHERE UserId = @UserId AND[Password] = HASHBYTES('SHA2_512', @OldPassword + CAST(Salt AS NVARCHAR(36)))");
        cmd.Connection = conn;
        cmd.Parameters.AddWithValue("@UserId", (int)Session["userId"]);
        cmd.Parameters.AddWithValue("@OldPassword", txtPassword.Text);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader != null && reader.HasRows)
        {
            reader.Close();

            SqlCommand update = new SqlCommand();
            update.Connection = conn;
            
            update.CommandText = "UPDATE [dbo].Users SET[Password] = HASHBYTES('SHA2_512', @NewPassword + CAST(Salt AS NVARCHAR(36))) WHERE UserId = @Userid";
            update.Parameters.AddWithValue("@NewPassword", txtNewPassword.Text);
            update.Parameters.AddWithValue("@UserId", (int)Session["userId"]);
            update.ExecuteNonQuery();

            lblValid.Text = "Password has been changed successfully";
        }
        else
        {
            lblValid.Text = "Unsuccessful Password Change";
        }
        conn.Close();
        
    }

    protected void btnAccount_Click(object sender, EventArgs e)
    {
        Response.Redirect("MyAccount.aspx");
    }
}