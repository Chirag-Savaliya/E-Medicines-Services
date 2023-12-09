using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class _Default : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    SqlDataReader dr;
    string qry = "";
    static int mid;
    int uid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindData();
        }
        ((Menu)this.Master.FindControl("mnu")).Items[0].Selected = true;
    }
    protected void btnAddtoCart_Click(object sender, EventArgs e)
    {
        if (((Label)this.Master.FindControl("lblUser")).ToolTip.ToString().Length < 1)
        {
            Response.Write("<script>alert('You Are Not Loggedin.')</script>");
        }
        else
        {
            cn = new SqlConnection(Connection.cnstr);
            cn.Open();
            cmd = new SqlCommand("SELECT usrId FROM tblUsers WHERE usrEml='" + ((Label)this.Master.FindControl("lblUser")).ToolTip.ToString() + "'", cn);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                uid = int.Parse(dr[0].ToString());
            }
            cn.Close();
            qry = "INSERT INTO tblCart VALUES((SELECT MAX(itmId) FROM tblCart)+1,";
            qry += "'" +uid+ "',";
            qry += "'" +mid+ "',";
            qry += "'" + int.Parse(txtMedcnQntt.Text.ToString()) + "')";
            try
            {
                Connection.AddUpdtDltData(qry);
                Response.Write("<script>alert('Medicine Added Into Cart Successfully.')</script>");
            }
            catch (Exception UsrExit)
            {
                lblError.Text = "Medicine Could Not Be Added Into Cart Successfully.";
            }
        }
    }
    protected void dtGrdMedcns_SelectedIndexChanged(object sender, EventArgs e)
    {
        int indx = int.Parse(((GridView)sender).SelectedIndex.ToString());
        mid = int.Parse(((GridView)sender).Rows[indx].Cells[1].Text.ToString());
        txtMedcnName.Text = ((GridView)sender).Rows[indx].Cells[2].Text.ToString();
        txtMedcnStkUnt.Text = ((GridView)sender).Rows[indx].Cells[8].Text.ToString();
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
        qry = "SELECT * FROM tblMedicines WHERE medcnNm LIKE '%" + txtSrchMedcn.Text.ToString() + "%' AND medcnIsAct='TRUE'";
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