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

    }

    protected void btnCreate_Click(object sender, EventArgs e)
    {
        //Checks to see if username exists.
        cmd = new SqlCommand("select count(*) from users where @username=lower(username)",con);
        cmd.Parameters.AddWithValue("@Username", txtUserName.Text.ToLower());
        con.Open();
        int UserExist = (int)cmd.ExecuteScalar();
        con.Close();
        string roles = string.Empty;

        // Username check
        if (UserExist > 0)
        {
            lblValid.Text = "Username already exists, please try again.";
            lblValid.Visible = true;
        }
        else
        {
            //Checks to see if email exists.
            cmd = new SqlCommand("select count(*) from users where @email=lower(email)",con);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text.ToLower());
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
                //Creates account in user table
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
                    btnLogin.Visible = true;
                }
                //get the id of the user you just inserted
                cmd = new SqlCommand("select userid from users where @email=lower(email)", con);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text.ToLower());
                con.Open();
                userId = (int)cmd.ExecuteScalar();
                Session["userId"] = userId;
                con.Close();

                //creates owner in owner table 
                SqlCommand create = new SqlCommand("insert [dbo].[TeamOwner] (UserId) values @userId");
                cmd.Parameters.AddWithValue("@userId", (int)Session["userId"]);
                create.Connection = con;
                con.Open();
                create.ExecuteNonQuery();
                con.Close();

                //set the userid to the specific box.
                SqlCommand update = new SqlCommand("update [dbo].[Device] SET OwnerID = @userId where DeviceID = @deviceId",con);
                update.Parameters.AddWithValue("@deviceId", (int)Session["deviceId"]);
                update.Parameters.AddWithValue("@userId", (int)Session["userId"]);
                con.Open();
                update.ExecuteNonQuery();
                con.Close();

                txtEmail.Text = String.Empty;
                txtUserName.Text = String.Empty;
            }
           
        }

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Login.aspx");
    }
}