<%@ Page Title="Search" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
            height: 23px;
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
                        <table class="style1">
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    You searched for <span style=" color:'Blue'; "> <% =Srch %> in the Name and Description of products </span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:connStr_eStore %>" 
                                SelectCommand="SELECT * FROM [tProducts]"></asp:SqlDataSource>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
                                CellPadding="4" DataKeyNames="ProductID" DataSourceID="SqlDataSource1" 
                                HorizontalAlign="Center" EmptyDataText="Your search return no items. ">
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
                                <EmptyDataRowStyle Font-Bold="True" Font-Names="Arial,Helvetica" 
                                    ForeColor="Red" />
                                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                                <RowStyle BackColor="White" ForeColor="#003399" />
                                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                <SortedDescendingHeaderStyle BackColor="#002876" />
                            </asp:GridView></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="products.aspx">Continue Shopping</asp:HyperLink>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        
        </asp:Content>


