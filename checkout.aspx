<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="checkout" %>

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
                                <td align="center">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="center">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="center">
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <% if(bagTable.Rows.Count > 0 ) 
                           {%>
                        <table class="style1">
                            <tr>
                                <% for (int i = 0; i < bagTable.Columns.Count; i++)
                                   {
                                       if (i == 1)
                                       {
                                           continue;
                                       }
                                           %>
                                <th align="center">
                                     <% =bagTable.Columns[i].ColumnName%>
                                </th>
                                <% } %>
                            </tr>
                            <% for (int row = 0; row < bagTable.Rows.Count; row++)
                               {
                                    %>
                            <tr>
                                <% for (int call = 0; call < bagTable.Columns.Count; call++)
                                   {
                                       if (call == 1)
                                       {
                                           continue;
                                       }
                                               %>
                                <td align="center" class="style3">
                                    <% =bagTable.Rows[row][call].ToString() %>
                                </td>
                                    <% } %>
                            </tr>
                            <% } %>
                            <tr>
                                <td align="center">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:Button ID="Button1" runat="server" Text="Continue Checkout" />
                                </td>
                            </tr>
                        </table>
                        <% } %>
                         <% if (bagTable.Rows.Count > 0)
                            {
                                    %>
                        <table align="center" border="2">
                            <tr>
                                <td align="center">
                                    Total Purchase Price =  <% =sumTotal.ToString("c") %></td>
                            </tr>
                            <tr>
                                <td align="center">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="center">
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <% } %>
                    </td>
                </tr>
            </table>
        
        </asp:Content>


