using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for NewPassword
/// </summary>
public partial class NewPassword : System.Web.UI.Page
{
    private SqlCommand cmd;
    private static string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
    private SqlConnection con = new SqlConnection(constr);
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void resetPassBtn_Click(object sender, EventArgs e)
    {


    }
}