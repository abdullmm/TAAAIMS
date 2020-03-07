using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class ActivateUnit : System.Web.UI.Page
{
    static string connString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
    SqlConnection conn = new SqlConnection(connString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    
    protected void Activate_Click(object sender, EventArgs e)
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("select ActivationCode from [dbo].[Unit] where ActivationCode = @code and DeviceID = @id");
        cmd.Connection = conn;
        cmd.Parameters.AddWithValue("@code", AccessCode.Text);
        cmd.Parameters.AddWithValue("@id", DeviceNumber.Text);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader != null && reader.HasRows)
        {
            Label2.Text = "Hello There Champ";
            Response.Redirect("OwnerSignUp.aspx");
        }
        else
        {
            Label2.Text = "Invalid Code";
        }
    }
}