using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Collections.Specialized;
using System.Data;

public partial class Bag : System.Web.UI.Page
{
    //create globals
    DataTable bagTable = null; 
    int pID = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        //create bag variables
        bagTable = (DataTable)Session["bagTable"];
        int rowCount = bagTable.Rows.Count; //number of ITEM TYPES in the bag
        NameValueCollection qsData = Request.QueryString;
        pID = Convert.ToInt32(qsData.Get("ProductID"));

        //logic for Page
        if (!IsPostBack && pID > 0)
        {
            //first Page Display .... product selected in Products pages
            if (rowCount == 0 ) 
            {
                //no items in bg ... add NEW row 
                addRow();
            }
            else
            {
                //selected product MAY be in bag ... check bagTable
                checkTable();
            }
        }

        if(rowCount > 0 && pID == 0 ) 
        {
            //page accessed via NAV .. bag contains items .. Display TotalPrice 
            lblSumTotal.Text = "Total Purchase Price = " + Convert.ToDouble(Session["sumTotal"]).ToString("c");
        }

        // bing and display bagTable
        GridView1.DataSource = bagTable;
        GridView1.DataBind();

        //wire up RowCommand event for GridView 
        GridView1.RowCommand +=new GridViewCommandEventHandler(GridView1_RowCommand);
    }

    void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("IncrementRow"))
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            bagTable.Rows[rowIndex]["Quantity"] = Convert.ToInt32(bagTable.Rows[rowIndex]["Quantity"]) + 1;

            //save bagTable to session 
            Session["bagTable"] = bagTable;
            calcSumTotal();
            GridView1.DataBind();
        }
        else if (e.CommandName.Equals("DecrementRow"))
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            if (Convert.ToInt32(bagTable.Rows[rowIndex]["Quantity"]) > 1)
            {
                bagTable.Rows[rowIndex]["Quantity"] = Convert.ToInt32(bagTable.Rows[rowIndex]["Quantity"]) - 1;
                //save bagTable to session 
                Session["bagTable"] = bagTable;
                calcSumTotal();
                GridView1.DataBind();
            }
            else
            {
                bagTable.Rows[rowIndex].Delete();
                //save bagTable to session 
                Session["bagTable"] = bagTable;
                calcSumTotal();
                GridView1.DataBind();
            }
        }
        else if (e.CommandName.Equals("removeRow"))
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            bagTable.Rows[rowIndex].Delete();
            //save bagTable to session 
            Session["bagTable"] = bagTable;
            calcSumTotal();
            GridView1.DataBind();

        }
    }

    private void addRow()
    {
        ArrayList arrRow = bagReader.getRow(pID);
        if(arrRow != null ) 
        {
            if(arrRow.Count == 5)
            {
                DataRow dr = bagTable.NewRow();
                for (int i = 0; i < arrRow.Count; i++)
                {
                    dr[i] = arrRow[i];
                }
                bagTable.Rows.Add(dr);
                //save bagTable to session 
                Session["bagTable"] = bagTable;
                //display NEW total price 
                calcSumTotal();

            }
            else
            {
                //error in BagReader .... display message
                Response.Write("Error Reading Data");
            }
        }
    }

    private void checkTable()
    {
        bool productNeeded = true;

        for (int i= 0; i < bagTable.Rows.Count; i++)
        {
            if (pID == Convert.ToInt32(bagTable.Rows[i]["ProductID"]))
            {
                //bag contains selected item .... Increment Quantity
                bagTable.Rows[i]["Quantity"] = Convert.ToInt32(bagTable.Rows[i]["Quantity"]) + i;
                productNeeded = false;
                //save bagTable to session 
                Session["bagTable"] = bagTable;
                calcSumTotal();
            }
        }

        if (productNeeded)
        {
            //item NOT in bag ... add NEW row 
            addRow();
        }
    }

    private void calcSumTotal()
    {
        double sumTotal = 0.0;
        for (int i = 0; i < bagTable.Rows.Count; i++)
        {
            int q = Convert.ToInt32(bagTable.Rows[i]["Quantity"]);
            double rowTotal = q * Convert.ToDouble(bagTable.Rows[i]["UnitPrice"]);
            sumTotal += rowTotal;

            //save TotalPrice to session
            Session["sumTotal"] = sumTotal;
            //display NEW sumTotal as Currency 
            if (sumTotal > 0)
            {
                lblSumTotal.Text = "Total Purchase Price = " + sumTotal.ToString("c");
            }
            else
            {
                lblSumTotal.Text = "";
            }
        }
    }
}