using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class E_Medicines_Services : System.Web.UI.MasterPage
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["Usr"] != null && Session["UsrRole"] != null)
            {
                string[] usr = Session["Usr"].ToString().Split('@');
                lblUser.Text = usr[0].ToString();
                lblUser.ToolTip = Session["Usr"].ToString();
                if (Session["UsrRole"].ToString() == "A")
                {
                    mnu.Items[2].Enabled = true;
                }
                else
                {
                    mnu.Items[2].Enabled = false;
                }
                //mnu.Items[1].Enabled = true;
                mnu.Items[1].ChildItems[0].Enabled = true;
                mnu.Items[1].ChildItems[1].Enabled = false;
                mnu.Items[1].ChildItems[2].Enabled = true;
                mnu.Items[1].ChildItems[3].Enabled = true;
                mnu.Items[1].ChildItems[4].Enabled = true;
            }
            else
            {
                //mnu.Items[1].Enabled = true;
                mnu.Items[1].ChildItems[0].Enabled = true;
                mnu.Items[1].ChildItems[1].Enabled = true;
                mnu.Items[1].ChildItems[2].Enabled = false;
                mnu.Items[1].ChildItems[3].Enabled = false;
                mnu.Items[1].ChildItems[4].Enabled = false;
                mnu.Items[2].Enabled = false;
            }
            Date.Text = System.DateTime.Now.Date.ToLongDateString();
        }

    }
    protected void Timer_Tick(object sender, EventArgs e)
    {
        Timer.Text = System.DateTime.Now.ToLongTimeString();
    }
    protected void mnu_MenuItemClick(object sender, MenuEventArgs e)
    {
        if (e.Item.Text.ToString() == "SIGNOUT")
        {
            Session.Clear();
            lblUser.Text = "";
            Response.Redirect("Default.aspx");
        }
    }
}
