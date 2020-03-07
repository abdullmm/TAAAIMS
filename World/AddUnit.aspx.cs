using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class AddUnit : System.Web.UI.Page
{
    static string connString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
    SqlConnection conn = new SqlConnection(connString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.GridView1.DataBind();
            //BindGridView();
            if (this.Page.User.Identity.IsAuthenticated)
            {
                if (Session["UserId"] != null)
                {
                    //Label1.Text = "Your id is " + Session["userId"].ToString();
                }                   
            }
        }       
    }

    //private void BindGridView()
    //{       
    //    {
    //        if (Session["UserId"] != null)
    //        {
    //            conn.Open();
    //            SqlCommand attach = new SqlCommand("grid_Bind");
    //            //"SELECT * FROM [dbo].[Device] INNER JOIN [dbo].[Users] ON Device.DeviceID = Users.DeviceID WHERE(Users.UserId = @userid)"
    //            attach.CommandType = CommandType.StoredProcedure;
    //            attach.Connection = conn;
    //            attach.Parameters.AddWithValue("@userId", (int)Session["userId"]);
    //            attach.ExecuteNonQuery();
    //            //cmd.CommandType = CommandType.StoredProcedure;
    //            //"spGetProductList"
                           
    //            GridView1.DataSource = attach.ExecuteReader();
    //            GridView1.DataBind();
    //            conn.Close();


    //        }                    
    //    }
    //}


    protected void add_Click(object sender, EventArgs e)
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("select ActivationCode from [dbo].[Device] where ActivationCode = @code and DeviceID = @id");
        cmd.Connection = conn;
        cmd.Parameters.AddWithValue("@code", accessCode.Text);
        cmd.Parameters.AddWithValue("@id", deviceNumber.Text);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader != null && reader.HasRows)
        {
            reader.Close();

            SqlCommand update = new SqlCommand();
            update.Connection = conn;
            //cmd.CommandType = CommandType.StoredProcedure;
            update.CommandText = "update [dbo].[Device] SET UserId = @userId where DeviceID = @deviceId";
            update.Parameters.AddWithValue("@deviceId", deviceNumber.Text);
            update.Parameters.AddWithValue("@userId", (int)Session["userId"]);
            update.ExecuteNonQuery();
            
            lblError.Text = "Device Number: " + deviceNumber.Text + " Has been successfuly added"; ;
        }
        else
        {
            lblError.Text = "Invalid Code";
        }
        conn.Close();
        this.GridView1.DataBind();
    }
}