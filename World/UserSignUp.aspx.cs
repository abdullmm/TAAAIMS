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

public partial class UserSignUp : System.Web.UI.Page
{
    static int userId = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnCreate_Click(object sender, EventArgs e)
    {
        string roles = string.Empty;
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection conn = new SqlConnection(constr);
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("Insert_User"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                con.Open();
                cmd.Parameters.AddWithValue("@Username", txtUserName.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Role", "User");
                cmd.ExecuteNonQuery();
                con.Close();
                lblValid.Visible = true;
                lblValid.Text = "Your Account has been created successfully!";
                btnLogin.Visible = true;
            }
            //SqlCommand find = new SqlCommand();
            //find.Connection = conn;
            //conn.Open();
            //find.CommandText = "select max(UserId) from [dbo].[Users]";
            //userId = Convert.ToInt32(find.ExecuteScalar());
            //Session["userId"] = userId;
            //conn.Close();
            //SqlCommand update = new SqlCommand();
            //update.Connection = conn;
            //conn.Open();
            //update.CommandText = "update [dbo].[Device] SET UserId = @userId where DeviceID = @deviceId";
            //update.Parameters.AddWithValue("@deviceId", (int)Session["deviceId"]);
            //update.Parameters.AddWithValue("@userId", (int)Session["userId"]);
            //update.ExecuteNonQuery();
            //conn.Close();
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Login.aspx");
    }
}