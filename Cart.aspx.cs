using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Cart : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    string qry = "";
    SqlDataReader dr;
    int uid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindData();
        }
        ((Menu)this.Master.FindControl("mnu")).Items[1].ChildItems[3].Selected = true;
    }
    protected void dtGrdCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        qry = "DELETE FROM tblCart WHERE medcnId=" + int.Parse(((GridView)sender).Rows[e.RowIndex].Cells[0].Text.ToString());
        Connection.AddUpdtDltData(qry);
        BindData();
    }
    void BindData()
    {
        qry = "select m.medcnId,m.medcnNm,m.medcnType,m.medcnUnt,m.medcnQnttPerUnt,m.medcnRtPerUnt,c.medcnQnttUnt from tblMedicines m,tblCart c where m.medcnId=c.medcnId and m.medcnId>0 and c.medcnId>0";
        cn = new SqlConnection(Connection.cnstr);
        cn.Open();
        cmd = new SqlCommand(qry, cn);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        cn.Close();
        if (ds.Tables[0].Rows.Count >= 1)
        {
            dtGrdCart.DataSource = ds.Tables[0];
            dtGrdCart.DataBind();
            dtGrdCart.Visible = true;
            float amnt, totlamnt = 0;
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                amnt = int.Parse(dtGrdCart.Rows[i].Cells[6].Text.ToString()) * float.Parse(dtGrdCart.Rows[i].Cells[5].Text.ToString());
                dtGrdCart.Rows[i].Cells[7].Text = amnt.ToString();
                totlamnt += amnt;
            }
            lblTotlAmnt.Visible = true;
            msgTtlAmnt.InnerText = "Total Amount : ";
            lblTotlAmnt.Text = totlamnt.ToString();
        }
        else
        {
            dtGrdCart.Visible = false;
            lblTotlAmnt.Visible = false;
            msgTtlAmnt.InnerText = "Nothing In Cart.";
        }
    }
    protected void btnPlcOrdr_Click(object sender, EventArgs e)
    {
        if (((Label)this.Master.FindControl("lblUser")).ToolTip.ToString().Length > 0)
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
            qry = "INSERT INTO tblOrders VALUES((SELECT MAX(ordrId) FROM tblOrders)+1,";
            qry += "'" + uid + "',";
            qry += "convert(date,getdate(),0))";
            try
            {
                Connection.AddUpdtDltData(qry);
            }
            catch (Exception UsrExit)
            {
            }
            qry = "insert into tblSales select o.ordrId,c.medcnId,c.medcnQnttUnt from tblOrders o,tblCart c where o.usrId=c.usrId and o.ordrId>0 and o.ordrId=(select max(ordrId) from tblOrders)";
            Connection.AddUpdtDltData(qry);
            qry = "update tblMedicines set medcnStockUnt=medcnStockUnt-c.medcnQnttUnt from tblMedicines m inner join tblCart c on m.medcnId=c.medcnId and m.medcnId>0 and c.medcnId>0";
            Connection.AddUpdtDltData(qry);
            qry = "DELETE FROM tblCart WHERE usrId=" + uid;
            Connection.AddUpdtDltData(qry);
            Response.Write("<script>alert('Your Order Placed Successfully.')</script>");
            Response.Write("<script>window.location.href='Default.aspx'</script>");
        }
    }
}