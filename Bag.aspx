<%@ Page Title="Shopping Cart" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Bag.aspx.cs" Inherits="Bag" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Contents of your Shopping Cart
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                EmptyDataText="There are no items in you Cart">
                                 <Columns>
                                     <asp:ButtonField ButtonType="Button" CommandName="IncrementRow" 
                                         HeaderText="Increment" ShowHeader="True" Text="+" />
                                     <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                                        SortExpression="Quantity" />
                                     <asp:ButtonField ButtonType="Button" CommandName="DecrementRow" 
                                         HeaderText="Decrement" ShowHeader="True" Text="-" />
                                    <asp:BoundField DataField="ProductName" HeaderText="ProductName" 
                                        SortExpression="ProductName" />
                                    <asp:BoundField DataField="Description" HeaderText="Description" 
                                        SortExpression="Description" />
                                    <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" 
                                        SortExpression="UnitPrice" />
                                     <asp:ButtonField ButtonType="Button" CommandName="removeRow" 
                                         HeaderText="Remove Item" ShowHeader="True" Text="Remove Item " />
                                </Columns>
                                
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblSumTotal" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/products.aspx">Continue Shopping</asp:HyperLink>
&nbsp;
                            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/checkout.aspx">Checkout</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>


