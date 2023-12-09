using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Signup : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    string qry = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        ((Menu)this.Master.FindControl("mnu")).Items[1].ChildItems[0].Selected = true;
    }
    protected void btnSignup_Click(object sender, EventArgs e)
    {

        qry = "INSERT INTO tblUsers VALUES((SELECT MAX(usrId) FROM tblUsers)+1,";
        qry += "'" + txtFrstName.Text + "',";
        qry += "'" + txtLstName.Text + "',";
        qry += "'" + txtAddrs.Text + "',";
        qry += "'" + txtMono.Text + "',";
        qry += "'" + txtEml.Text + "',";
        qry += "'" + txtPasswrd.Text + "',";
        qry += "'" + txtSecQstn.Text + "',";
        qry += "'" + txtQstnAnsr.Text + "',";
        qry += "'C',";
        qry += "'TRUE')";
        try
        {
            Connection.AddUpdtDltData(qry);
            Response.Write("<script>alert('User Added Successfully.')</script>");
            ResetControls();
        }
        catch (Exception UsrExit)
        {
            lblError.Text = "User Having Following Email Address Already Existed.";
        }
    }
    void ResetControls()
    {
        txtFrstName.Text = "";
        txtLstName.Text = "";
        txtMono.Text = "";
        txtAddrs.Text = "";
        txtEml.Text = "";
        txtSecQstn.Text = "";
        txtQstnAnsr.Text = "";
        lblError.Text = "";
    }
}