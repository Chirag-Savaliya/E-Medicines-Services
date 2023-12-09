using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class EditMedicines : System.Web.UI.Page
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
            FillControls(Request["mid"].ToString());
        }
    }
    void FillControls(String mid)
    {
        
        qry = "SELECT * FROM tblMedicines WHERE medcnId='"+int.Parse(mid)+"' AND medcnIsAct='TRUE'";
        cn = new SqlConnection(Connection.cnstr);
        cn.Open();
        cmd = new SqlCommand(qry, cn);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        cn.Close();
        if (ds.Tables[0].Rows.Count >= 1)
        {
            txtMedcnName.Text = ds.Tables[0].Rows[0][1].ToString();
            txtMedcnDescrptn.Text = ds.Tables[0].Rows[0][2].ToString();
            ddlMedcnTyp.Text = ds.Tables[0].Rows[0][3].ToString();
            ddlMedcnUnt.Text = ds.Tables[0].Rows[0][4].ToString();
            txtMedcnQnttPrUnt.Text = ds.Tables[0].Rows[0][5].ToString();
            txtMedcnRtPrUnt.Text = ds.Tables[0].Rows[0][6].ToString();
            txtMedcnStkUnt.Text = ds.Tables[0].Rows[0][7].ToString();
        }
    }
    protected void btnUpdtMedcn_Click(object sender, EventArgs e)
    {

        qry = "UPDATE tblMedicines SET ";
        qry += "medcnNm='" + txtMedcnName.Text + "',";
        qry += "medcnDescrptn='" + txtMedcnDescrptn.Text + "',";
        qry += "medcnType='" + ddlMedcnTyp.SelectedItem.ToString() + "',";
        qry += "medcnUnt='" + ddlMedcnUnt.SelectedItem.ToString() + "',";
        qry += "medcnQnttPerUnt='" + txtMedcnQnttPrUnt.Text + "',";
        qry += "medcnRtPerUnt='" + txtMedcnRtPrUnt.Text + "',";
        qry += "medcnStockUnt='" + txtMedcnStkUnt.Text + "' WHERE medcnId='" + Request["mid"] + "' AND medcnIsAct='TRUE'";
        Connection.AddUpdtDltData(qry);
        try
        {
            Connection.AddUpdtDltData(qry);
            Response.Write("<script>alert('Medicine Updated Successfully.')</script>");
            Response.Write("<script>window.location.href='Medicines.aspx'</script>");
        }
        catch (Exception UsrExit)
        {
            lblError.Text = "Medicine Could Not Be Updated Successfully.";
        }
    }
}