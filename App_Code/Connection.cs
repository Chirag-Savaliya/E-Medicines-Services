using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
/// <summary>
/// Summary description for Connection
/// </summary>
public class Connection
{
    static SqlConnection cn;
    static SqlCommand cmd;
    public static string cnstr = "Data Source=CHIRAG-PC;Initial Catalog=E-Medicines Services;Integrated Security=True";
    public static void AddUpdtDltData(string qry)
    {
        cn = new SqlConnection(cnstr);
        cn.Open();
        cmd = new SqlCommand(qry, cn);
        cmd.ExecuteNonQuery();
        cn.Close();
    }
}