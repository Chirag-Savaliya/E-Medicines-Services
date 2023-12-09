using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Orders : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    SqlDataReader dr;
    string qry = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindData();
        }
        ((Menu)this.Master.FindControl("mnu")).Items[2].ChildItems[1].Selected = true;
    }
    protected void btnSrch_Click(object sender, EventArgs e)
    {
        qry = "select u.usrFrstNm,u.usrLstNm,u.usrAddrs,u.usrMoNo,o.ordrDt from tblUsers u,tblOrders o where u.usrId=o.usrId and u.usrIsAct='TRUE' and o.ordrId>0 and ";
        qry += "(";
        qry+="u.usrFrstNm like '%" + txtSrchOrdr.Text + "%' or u.usrLstNm like '%" + txtSrchOrdr.Text + "%' or o.ordrId like '%" + txtSrchOrdr.Text + "%' or ";
        qry += "o.ordrDt like '%" + txtSrchOrdr.Text + "%' or u.usrMoNo like '%" + txtSrchOrdr.Text + "%' or u.usrAddrs like '%" + txtSrchOrdr.Text + "%'";
        qry += ")";
        cn = new SqlConnection(Connection.cnstr);
        cn.Open();
        cmd = new SqlCommand(qry, cn);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        cn.Close();
        if (ds.Tables[0].Rows.Count >= 1)
        {
            dtGrdOrdrs.DataSource = ds.Tables[0];
            dtGrdOrdrs.DataBind();
            dtGrdOrdrs.Visible = true;
        }
        else
            dtGrdOrdrs.Visible = false;
    }
    void BindData()
    {
        qry = "select u.usrFrstNm,u.usrLstNm,u.usrAddrs,u.usrMoNo,o.ordrDt from tblUsers u,tblOrders o where u.usrId=o.usrId and u.usrIsAct='TRUE' and o.ordrId>0";
        cn = new SqlConnection(Connection.cnstr);
        cn.Open();
        cmd = new SqlCommand(qry, cn);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        cn.Close();
        if (ds.Tables[0].Rows.Count >= 1)
        {
            dtGrdOrdrs.DataSource = ds.Tables[0];
            dtGrdOrdrs.DataBind();
            dtGrdOrdrs.Visible = true;
        }
        else
            dtGrdOrdrs.Visible = false;
        for (int x = 0; x < ds.Tables[0].Rows.Count; x++)
        {
            String[] ar = ds.Tables[0].Rows[x][4].ToString().Split(' ');
            dtGrdOrdrs.Rows[x].Cells[4].Text = ar[0];
        }
    }
}