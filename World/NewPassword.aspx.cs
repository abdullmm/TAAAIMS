using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;

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
        if (!IsPostBack)
        {
            if (!IsPasswordResetLinkValid())
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Password Reset link has expired or is invalid";
            }
        }
    }

    protected void resetPassBtn_Click(object sender, EventArgs e)
    {
        if (ChangeUserPassword())
        {
            lblMessage.Text = "Password Changed Successfully!";
        }
        else
        {
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = "Password Reset link has expired or is invalid";
        }
    }

    private bool ExecuteSP(string SPName, List<SqlParameter> SPParameters)
    {
        SqlCommand cmd = new SqlCommand(SPName, con);
        cmd.CommandType = CommandType.StoredProcedure;

        foreach (SqlParameter parameter in SPParameters)
        {
            cmd.Parameters.Add(parameter);
        }

        con.Open();
        return Convert.ToBoolean(cmd.ExecuteScalar());
    }

    private bool IsPasswordResetLinkValid()
    {
        List<SqlParameter> paramList = new List<SqlParameter>()
        {
            new SqlParameter()
            {
                ParameterName = "@GUID",
                Value = Request.QueryString["uid"]
            }
        };

        return ExecuteSP("spIsPasswordResetLinkValid", paramList);
    }

    private bool ChangeUserPassword()
    {
        List<SqlParameter> paramList = new List<SqlParameter>()
        {
            new SqlParameter()
            {
                ParameterName = "@GUID",
                Value = Request.QueryString["uid"]
            },
            new SqlParameter()
            {
                ParameterName = "@Password",
                Value = txtNewPassword.Text
            }
        };

        return ExecuteSP("spChangePassword", paramList);
    }
}