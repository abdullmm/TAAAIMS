using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class OwnerSignUp : System.Web.UI.Page
{
    private SqlCommand cmd;
    private static string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
    private SqlConnection con = new SqlConnection(constr);
    private static String imagelink = "~/Files/personavatar.png";
    private static int userId = 0;

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
        cmd = new SqlCommand("select count(*) from users where @username=username",con);
        cmd.Parameters.AddWithValue("@Username", txtUserName.Text);
        con.Open();
        int UserExist = (int)cmd.ExecuteScalar();
        con.Close();
        string roles = string.Empty;

        if (UserExist > 0)
        {
            lblValid.Text = "Username already exists, please try again.";
            lblValid.Visible = true;
        }
        else
        {
            cmd = new SqlCommand("select count(*) from users where @email=email",con);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            con.Open();
            int emailExist = (int)cmd.ExecuteScalar();
            con.Close();
            if (emailExist>0)
            {
                lblValid.Text = "Email already already in use, please try again.";
                lblValid.Visible = true;
            }
            else
            {
                using (cmd = new SqlCommand("Insert_User",con))
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
                    txtEmail.Text = String.Empty;
                    txtUserName.Text = String.Empty;
                    btnLogin.Visible = true;
                }
                SqlCommand find = new SqlCommand();
                find.Connection = con;
                con.Open();
                find.CommandText = "select max(UserId) from [dbo].[Users]";
                userId = Convert.ToInt32(find.ExecuteScalar());
                Session["userId"] = userId;
                con.Close();
                SqlCommand update = new SqlCommand("update [dbo].[Device] SET UserId = @userId where DeviceID = @deviceId",con);
                update.Parameters.AddWithValue("@deviceId", (int)Session["deviceId"]);
                update.Parameters.AddWithValue("@userId", (int)Session["userId"]);
                con.Open();
                update.ExecuteNonQuery();
                con.Close();
            }
           
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