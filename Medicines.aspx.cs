using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Medicines : System.Web.UI.Page
{

    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    string qry = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindData();
        }
        ((Menu)this.Master.FindControl("mnu")).Items[1].ChildItems[0].Selected = true;
    }
    protected void btnAddMdcn_Click(object sender, EventArgs e)
    {

        qry = "INSERT INTO tblMedicines VALUES((SELECT MAX(medcnId) FROM tblMedicines)+1,";
        qry += "'" + txtMedcnName.Text + "',";
        qry += "'" + txtMedcnDescrptn.Text + "',";
        qry += "'" + ddlMedcnTyp.SelectedItem.ToString() + "',";
        qry += "'" + ddlMedcnUnt.SelectedItem.ToString() + "',";
        qry += "'" + txtMedcnQnttPrUnt.Text + "',";
        qry += "'" + txtMedcnRtPrUnt.Text + "',";
        qry += "'" + txtMedcnStkUnt.Text + "',";
        qry += "'TRUE')";
        try
        {
            Connection.AddUpdtDltData(qry);
            Response.Write("<script>alert('Medicine Added Successfully.')</script>");
            ResetControls();
            BindData();
        }
        catch (Exception UsrExit)
        {
            lblError.Text = "Medicine Could Not Be Added Successfully.";
        }
    }
    void ResetControls()
    {
        txtMedcnName.Text="";
        txtMedcnDescrptn.Text="";
        ddlMedcnTyp.SelectedIndex=0;
        ddlMedcnUnt.SelectedIndex=0;
        txtMedcnQnttPrUnt.Text = "0";
        txtMedcnRtPrUnt.Text = "0";
        txtMedcnStkUnt.Text = "0";
        lblError.Text = "";
    }
    protected void dtGrdMedcns_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView gv=(GridView)sender;
        Response.Redirect("EditMedicines.aspx?mid=" + gv.Rows[e.NewEditIndex].Cells[0].Text.ToString());
    }
    protected void dtGrdMedcns_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView gv = (GridView)sender;
        qry = "UPDATE tblMedicines SET medcnIsAct='FALSE' WHERE medcnId=" + gv.Rows[e.RowIndex].Cells[0].Text.ToString();
        Connection.AddUpdtDltData(qry);
        BindData();
    }
    void BindData()
    {
        qry = "SELECT * FROM tblMedicines WHERE medcnIsAct='TRUE'";
        cn = new SqlConnection(Connection.cnstr);
        cn.Open();
        cmd = new SqlCommand(qry, cn);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        cn.Close();
        if (ds.Tables[0].Rows.Count >= 1)
        {
            dtGrdMedcns.DataSource = ds.Tables[0];
            dtGrdMedcns.DataBind();
            dtGrdMedcns.Visible = true;
        }
        else
            dtGrdMedcns.Visible = false;
    }
    protected void btnSrch_Click(object sender, EventArgs e)
    {
        qry = "SELECT * FROM tblMedicines WHERE medcnNm LIKE '%"+txtSrchMedcn.Text.ToString()+"%' AND medcnIsAct='TRUE'";
        cn = new SqlConnection(Connection.cnstr);
        cn.Open();
        cmd = new SqlCommand(qry, cn);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        cn.Close();
        if (ds.Tables[0].Rows.Count >= 1)
        {
            dtGrdMedcns.DataSource = ds.Tables[0];
            dtGrdMedcns.DataBind();
            dtGrdMedcns.Visible = true;
        }
        else
            dtGrdMedcns.Visible = false;
    }
}