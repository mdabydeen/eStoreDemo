using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

public class bagTable
{
    public static DataTable makeTable()
    {
        DataTable bagTable = new DataTable();
        //Create DataColumns, configure and add to BagTable
        DataColumn dc1 = new DataColumn();
        dc1.ColumnName = "Quantity";
        dc1.DataType = Type.GetType("System.Int32");
        bagTable.Columns.Add(dc1);
        //second column
        DataColumn dc2 = new DataColumn();
        dc2.ColumnName = "ProductsID";
        dc2.DataType = Type.GetType("System.Int32");
        bagTable.Columns.Add(dc2);
        //third column
        DataColumn dc3 = new DataColumn();
        dc3.ColumnName = "ProductsName";
        dc3.DataType = Type.GetType("System.String");
        bagTable.Columns.Add(dc3);
        //fouth column
        DataColumn dc4 = new DataColumn();
        dc4.ColumnName = "Desciption";
        dc4.DataType = Type.GetType("System.String");
        bagTable.Columns.Add(dc4);
        //fifth column
        DataColumn dc5 = new DataColumn();
        dc5.ColumnName = "UnitPrice";
        dc5.DataType = Type.GetType("System.Double");
        bagTable.Columns.Add(dc5);


        return bagTable;
    }

}