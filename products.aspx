<%@ Page Title="Products" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="products.aspx.cs" Inherits="products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
            height: 24px;
            text-align: center;
        }
        .style4
        {
            text-align: center;
            height: 23px;
        }
        .newStyle4
        {
            font-family: Arial, Helvetica, sans-serif;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <table class="style1">
        <tr>
            <td class="style2">
                Online Store</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="lblPageTitle" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="products.aspx">Products</asp:HyperLink>
&nbsp;<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="bag.aspx">Shopping Cart</asp:HyperLink>
&nbsp;<asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="checkout.aspx">Checkout</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <table align="center" class="style1">
                    <tr>
                        <td class="style3">
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtSearch" ErrorMessage="Please Enter Search Criteria" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label1" runat="server" Text="Search Criteria "></asp:Label>
                            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="cmdSearch" runat="server" Text="Search" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:connStr_eStore %>" 
                                SelectCommand="SELECT * FROM [tProducts]"></asp:SqlDataSource>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
                                CellPadding="4" DataKeyNames="ProductID" DataSourceID="SqlDataSource1" 
                                HorizontalAlign="Center">
                                <Columns>
                                    <asp:BoundField DataField="ProductName" HeaderText="ProductName" 
                                        SortExpression="ProductName" />
                                    <asp:BoundField DataField="Description" HeaderText="Description" 
                                        SortExpression="Description" />
                                    <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" 
                                        SortExpression="UnitPrice" />
                                    <asp:HyperLinkField DataNavigateUrlFields="ProductID" 
                                        DataNavigateUrlFormatString="Bag.aspx?ProductID={0}" HeaderText="Select Item " 
                                        Text="Add to Cart " />
                                </Columns>
                                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                                <RowStyle BackColor="White" ForeColor="#003399" />
                                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                <SortedDescendingHeaderStyle BackColor="#002876" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>


