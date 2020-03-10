using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Configuration;

namespace User_Login_CS
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!this.IsPostBack)
            {
                
            }
        }
        protected void OnMenuItemDataBound(object sender, MenuEventArgs e)
        {
            if (SiteMap.CurrentNode != null)
            {
                if (e.Item.Text == SiteMap.CurrentNode.Title)
                {
                    if (e.Item.Parent != null)
                    {
                        e.Item.Parent.Selected = true;
                    }
                    else
                    {
                        e.Item.Selected = true;
                    }
                }
            }


        }
        
    }
}