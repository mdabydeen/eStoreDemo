using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Specialized;

public partial class search : System.Web.UI.Page
{
    public string Srch = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        NameValueCollection qsData = Request.QueryString;
        Srch = qsData.Get("search");
        if (Srch == null)
        {
            Response.Redirect("products.aspx");
        }
        else
        {
            string sql = "SELECT * FROM [tProducts] WHERE [ProductName] LIKE '%" + Srch + "%' OR [Description] LIKE '%" + Srch + "%'";
            SqlDataSource1.SelectCommand = sql;
        }


    }
}