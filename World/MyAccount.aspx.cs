using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class MyAccount : System.Web.UI.Page
{
    static String imagelink;
    static String imagelink1;
    static string connString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
    SqlConnection con = new SqlConnection(connString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!this.IsPostBack)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from [dbo].[Users] where UserId = @UserId");
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@userId", (int)Session["userId"]);

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader != null && reader.HasRows)
            {
                reader.Read();
                txtName.Text = reader["Name"].ToString();
                txtAff.Text = reader["Organization"].ToString();
                txtEmail.Text = reader["Email"].ToString();
                Image1.ImageUrl = reader["Image"].ToString();
                imagelink1 = reader["Image"].ToString();
                lblError.Text = "";
            }
            else
            {
                lblError.Text = "";
            }
            reader.Close();
            con.Close();
        }
    }

    protected void btnChange_Click(object sender, EventArgs e)
    {
        Response.Redirect("ChangePassword.aspx");
    }

    protected void UploadFile(object sender, EventArgs e)
    {
        //if (FileUpload1.HasFile)
        //{
        //    string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
        //    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/ProfileImage/") + fileName);
        //    Response.Redirect(Request.Url.AbsoluteUri);
        //}
        string folderPath = Server.MapPath("~/Files/");

        //Check whether Directory (Folder) exists.
        if (!Directory.Exists(folderPath))
        {
            //If Directory (Folder) does not exists Create it.
            Directory.CreateDirectory(folderPath);
        }

        //Save the File to the Directory (Folder).
        FileUpload1.SaveAs(folderPath + Path.GetFileName(FileUpload1.FileName));

        //Display the Picture in Image control.
        Image1.ImageUrl = "~/Files/" + Path.GetFileName(FileUpload1.FileName);

        imagelink = "~/Files/" + Path.GetFileName(FileUpload1.FileName);



        //String imagelink1;
        //String myquery = "Select * from [dbo].[Users] where Image = @UserId";       
        //SqlCommand search = new SqlCommand();
        //search.Connection = con;
        //search.Parameters.AddWithValue("@UserId", (int)Session["userId"]);
        //search.CommandText = myquery;
        //SqlDataAdapter da = new SqlDataAdapter();
        //da.SelectCommand = search;
        //DataSet ds = new DataSet();
        //da.Fill(ds);
        //if (ds.Tables[0].Rows.Count > 0)
        //{
        //    lblError.Text = "Particular Roll Number Found";
        //    //TextBox2.Text = ds.Tables[0].Rows[0]["sname"].ToString();
        //    //TextBox3.Text = ds.Tables[0].Rows[0]["fname"].ToString();
        //    //TextBox4.Text = ds.Tables[0].Rows[0]["mname"].ToString();
        //    imagelink1 = ds.Tables[0].Rows[0]["Image"].ToString();
        //    Image1.ImageUrl = imagelink1 + "?n=" + DateTime.Now.Second.ToString();
        //}
        //else
        //{
        //    lblError.Text = "Particular Roll Number Not Found";
        //}
        //con.Close();

        if (FileUpload1.HasFile == true)
        {
            //if (uploadimage() == true)
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "Update [dbo].[Users] set Image = @image where UserId = @UserId";
                cmd.Parameters.AddWithValue("@image", imagelink);
                cmd.Parameters.AddWithValue("@UserId", (int)Session["userId"]);
                con.Open();
                cmd.ExecuteNonQuery();
                lblError.Text = "Profile Picture Has Been Updated!";
            }
        }
        else
        {
            lblError.Text = "Profile Picture did not update";
        }
        //{

        //    //String updatedata = "Update profiledetail set sname='" + TextBox2.Text + "', fname='" + TextBox3.Text + "', mname='" + TextBox4.Text + "' where rollno=" + TextBox1.Text;

        //    con.Open();
        //    SqlCommand cmd = new SqlCommand();
        //    //cmd.CommandText = updatedata;
        //    cmd.Connection = con;
        //    cmd.ExecuteNonQuery();
        //    lblError.Text = "Record Has Been Updated Successfully";
        //}
    }

    private Boolean uploadimage()
    {
        Boolean imagesaved = false;
        if (FileUpload1.HasFile == true)
        {
            String contenttype = FileUpload1.PostedFile.ContentType;
            if (contenttype == "image/jpeg")
            {
                int filesize;
                filesize = FileUpload1.PostedFile.ContentLength;

                if (filesize <= 51200)
                {
                    System.Drawing.Image img = System.Drawing.Image.FromStream(FileUpload1.PostedFile.InputStream);
                    int height = img.Height;
                    int width = img.Width;
                    if (height == 200 && width == 200)
                    {
                        if (FileUpload1.HasFile)
                        {
                            string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Profile/") + fileName);
                            Response.Redirect(Request.Url.AbsoluteUri);
                        }
                        string folderPath = Server.MapPath("~/Files/");

                        //Check whether Directory (Folder) exists.
                        if (!Directory.Exists(folderPath))
                        {
                            //If Directory (Folder) does not exists Create it.
                            Directory.CreateDirectory(folderPath);
                        }
                        //Save the File to the Directory (Folder).
                        FileUpload1.SaveAs(folderPath + Path.GetFileName(FileUpload1.FileName));

                        //Display the Picture in Image control.
                        Image1.ImageUrl = "~/Files/" + Path.GetFileName(FileUpload1.FileName);

                        imagelink = "~/Files/" + Path.GetFileName(FileUpload1.FileName);
                        //FileUpload1.SaveAs(Server.MapPath("~/ProfileImage/") + TextBox1.Text + ".jpg");
                        //Image1.ImageUrl = "~/ProfileImage/" + TextBox1.Text + ".jpg";
                        //imagelink = "ProfileImage/" + TextBox1.Text + ".jpg";
                        imagesaved = true;
                    }
                    else
                    {
                        lblError.Text = "Kindly Upload JPEG Image in Proper Dimensions 200 x 200";
                    }

                }
                else
                {
                    lblError.Text = "File Size exceeds 50 KB - Please Upload File Size Maximum 50 KB";
                }

            }
            else
            {
                lblError.Text = "Only JPEG/JPG Image File Acceptable - Please Upload Image File Again";
            }
        }
        else
        {
            lblError.Text = "You have not selected any file - Browse and Select File First";
        }
        return imagesaved;
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        SqlCommand update = new SqlCommand();
        update.Connection = con;
        con.Open();
        update.CommandText = "update [dbo].[Users] SET Name = @name, Email = @email, Organization = @org where UserId = @userId";
        update.Parameters.AddWithValue("@name", txtName.Text);
        update.Parameters.AddWithValue("@email", txtEmail.Text);
        update.Parameters.AddWithValue("@org", txtAff.Text);       
        update.Parameters.AddWithValue("@userId", (int)Session["userId"]);
        update.ExecuteNonQuery();
        con.Close();
    }
}