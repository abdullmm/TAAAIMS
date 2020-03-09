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

public partial class OwnerSignUp : System.Web.UI.Page
{
    static String imagelink = "~/Files/personavatar.png";
    static int userId = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!this.IsPostBack)
        //{
        //    if (Session["UserId"] != null)
        //    {
        //        Label1.Text = Session["userId"].ToString();
        //        //Label1.Text = Session["deviceId"].ToString();
        //    }
        //}
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
                cmd.Parameters.AddWithValue("@Role", 3);
                cmd.Parameters.AddWithValue("@Image", imagelink);
                cmd.ExecuteNonQuery();
                con.Close();
                lblValid.Visible = true;
                lblValid.Text = "Your Account has been created successfully!";
                btnLogin.Visible = true;
            }           
            SqlCommand find = new SqlCommand();
            find.Connection = conn;
            conn.Open();
            find.CommandText = "select max(UserId) from [dbo].[Users]";
            userId = Convert.ToInt32(find.ExecuteScalar());
            Session["userId"] = userId;
            conn.Close();
            SqlCommand update = new SqlCommand();
            update.Connection = conn;
            conn.Open();
            update.CommandText = "update [dbo].[Device] SET UserId = @userId where DeviceID = @deviceId";
            update.Parameters.AddWithValue("@deviceId", (int)Session["deviceId"]);
            update.Parameters.AddWithValue("@userId", (int)Session["userId"]);
            update.ExecuteNonQuery();
            conn.Close();
        }   
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {       
        //find.CommandText = "select UserId from [dbo].[Users] where Username = @username and password = @Password";
        //find.Parameters.AddWithValue("@username", txtUserName.Text);
        //find.Parameters.AddWithValue("@password", txtPassword.Text);

        //SqlDataReader reader = find.ExecuteReader();
        //if (reader != null && reader.HasRows)
        //{
        //    userId = Convert.ToInt32(reader["UserId"]);
        //    Session["userId"] = userId;
        //}
        //else
        //{

        //}
        Response.Redirect("~/Login.aspx");
    }
}