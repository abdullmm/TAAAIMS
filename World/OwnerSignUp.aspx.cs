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

    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnCreate_Click(object sender, EventArgs e)
    {
        int userId = 0;
        string roles = string.Empty;
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
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
                cmd.Parameters.AddWithValue("@Role", "Owner");
                cmd.ExecuteNonQuery();
                
                //SqlDataReader reader = cmd.ExecuteReader();
                //reader.Read();
                //userId = Convert.ToInt32(reader["UserId"]);
                //roles = reader["Roles"].ToString();
                con.Close();
                
            }
            lblValid.Visible = true;
            lblValid.Text = "Your Account has been created successfully!"; 

        }
    }
}