using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CreateProject
/// </summary>
public partial class CreateProject : System.Web.UI.Page
{
    private SqlCommand cmd;
    private static string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
    private SqlConnection con = new SqlConnection(constr);
    protected void Page_Load(object sender, EventArgs e)
    {
     
    }

    protected void Create_Click(object sender, EventArgs e)
    {
        ////set the projectid to the specific box.
        //cmd = new SqlCommand("insert into project(ownerid, projectname, lastupdated) values(@ownerid, @projectname,getdate())", con);
        //cmd.Parameters.AddWithValue("@userId", (int)Session["userId"]);
        //cmd.Parameters.AddWithValue("@projectname", txtProjectName.Text);
        //con.Open();
        //cmd.ExecuteNonQuery();
        //con.Close();

        ////set the projectid to the specific box.
        //cmd = new SqlCommand("update [dbo].[Device] SET projectid = @projectid where DeviceID = @deviceId", con);
        //cmd.Parameters.AddWithValue("@deviceId", (int)Session["deviceId"]);
        //cmd.Parameters.AddWithValue("@projectid", (int)Session["projectid"]);
        //con.Open();
        //cmd.ExecuteNonQuery();
        //con.Close();

    }
}