using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Project : System.Web.UI.Page
{
    static int projectId;
    static string connString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
    SqlConnection con = new SqlConnection(connString);
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }

    protected void projectList_SelectedIndexChanged(object sender, EventArgs e)
    {
        projectId = Convert.ToInt32(projectList.SelectedValue.ToString());
        Session["projectId"] = projectId;
    }

    protected void btnViewProject_Click(object sender, EventArgs e)
    {
        int index = projectList.SelectedIndex;
        switch (index)
        {
            case 0:
                Label1.Text = "Project1";
                break;
            case 1:
                Label1.Text = "Project2";
                break;
            case 2:
                Label1.Text = "Project3";
                break;
            case 3:
                Label1.Text = "Project4";
                break;
            default:
                Label1.Text = "Success";
                break;
        }
    }

    protected void btnRemoveTeam_Click(object sender, EventArgs e)
    {
        string username = "";
        int userId = Convert.ToInt32(myTeamList.SelectedValue.ToString());
        SqlCommand update = new SqlCommand("update [dbo].[TeamMember] SET ProjectId = NULL where OwnerId = @ownerId and UserId = @userId");
        update.Connection = con;
        update.Parameters.AddWithValue("@userId", userId);
        update.Parameters.AddWithValue("@ownerId", (int)Session["userId"]);
        con.Open();
        update.ExecuteNonQuery();
        //SqlCommand cmd = new SqlCommand("select * from [dbo].[TeamMember] where OwnerId = @ownerId and UserId = @userId");
        //cmd.Connection = con;
        //cmd.Parameters.AddWithValue("@userId", userId);
        //cmd.Parameters.AddWithValue("@ownerId", (int)Session["userId"]);
        //SqlDataReader reader = cmd.ExecuteReader();
        //if (reader != null && reader.HasRows)
        //{
        //    reader.Read();
        //    username = reader["UserId"].ToString();
        //    reader.Close();
        //}
        con.Close();

        Label1.Text = "Success";
        //teamList.AppendDataBoundItems = true;
        //teamList.Items.Add(new ListItem(username, userId.ToString()));       
    }

    protected void btnRemoveDevice_Click(object sender, EventArgs e)
    {

        string deviceName = "";
        int deviceId = Convert.ToInt32(myDeviceList.SelectedValue.ToString());
        SqlCommand update = new SqlCommand("update [dbo].[Device] SET ProjectId = NULL where OwnerId = @ownerId and DeviceId = @deviceId");
        update.Connection = con;
        update.Parameters.AddWithValue("@deviceId", deviceId);
        update.Parameters.AddWithValue("@ownerId", (int)Session["userId"]);
        con.Open();
        //SqlCommand cmd = new SqlCommand("select * from [dbo].[Device] where OwnerId = @ownerId and DeviceId = @deviceId");
        //cmd.Connection = con;
        //cmd.Parameters.AddWithValue("@deviceId", deviceId);
        //cmd.Parameters.AddWithValue("@ownerId", (int)Session["userId"]);
        //SqlDataReader reader = cmd.ExecuteReader();
        //if (reader != null && reader.HasRows)
        //{
        //    reader.Read();
        //    deviceName = reader["Nickname"].ToString();
        //    reader.Close();
        //}
        update.ExecuteNonQuery();
        con.Close();
        Label1.Text = "Success";
        //deviceList.AppendDataBoundItems = true;
        //deviceList.Items.Add(new ListItem(deviceName, deviceId.ToString()));       
    }

    protected void btnAddTeam_Click(object sender, EventArgs e)
    {
        int userId = Convert.ToInt32(teamList.SelectedValue.ToString());
        SqlCommand update = new SqlCommand("update [dbo].[TeamMember] SET ProjectId = @projectId where OwnerId = @ownerId and UserId = @userId");
        update.Connection = con;
        update.Parameters.AddWithValue("@userId", userId);
        update.Parameters.AddWithValue("@projectId", projectId);
        update.Parameters.AddWithValue("@ownerId", (int)Session["userId"]);
        con.Open();
        update.ExecuteNonQuery();
        con.Close();
        Label1.Text = "Success";
    }

    protected void btnAddDevice_Click(object sender, EventArgs e)
    {
        int deviceId = Convert.ToInt32(deviceList.SelectedValue.ToString());
        SqlCommand update = new SqlCommand("update [dbo].[Device] SET ProjectId = @projectId where OwnerID = @userId and DeviceId = @deviceId");
        update.Connection = con;
        update.Parameters.AddWithValue("@deviceId", deviceId);
        update.Parameters.AddWithValue("@projectId", projectId);
        update.Parameters.AddWithValue("@userId", (int)Session["userId"]);
        con.Open();
        update.ExecuteNonQuery();
        con.Close();
        Label1.Text = "Success";
    }
}