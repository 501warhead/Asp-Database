<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Custom SQL.aspx.vb" Inherits="Custom_SQL" %>
<!-- Sean Kelly -->
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Browse our Orders!</title>
    <link href="Styles/Default.css" rel="stylesheet" />
</head>
<body>
    <h2>Browse the customer orders!</h2>
    <h3>Sean Kelly</h3>
    <form id="frmCustom" runat="server">
    <div>
        <asp:GridView ID="gvCustom" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="dsCustom" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="lastname" HeaderText="lastname" SortExpression="lastname" />
                <asp:BoundField DataField="firstname" HeaderText="firstname" SortExpression="firstname" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="Order Date" HeaderText="Order Date" ReadOnly="True" SortExpression="Order Date" />
                <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                <asp:BoundField DataField="Retail" HeaderText="Retail" ReadOnly="True" SortExpression="Retail" />
                <asp:BoundField DataField="Extended Price" HeaderText="Extended Price" ReadOnly="True" SortExpression="Extended Price" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:SqlDataSource ID="dsCustom" runat="server" ConnectionString="<%$ ConnectionStrings:connBooksDB %>" SelectCommand="SELECT customers.lastname,customers.firstname,books.title,CONVERT(VARCHAR(10),orders.orderdate,110) AS 'Order Date',orderitems.quantity, FORMAT(books.retail,'C') AS 'Retail',FORMAT(books.retail*orderitems.quantity,'C') AS 'Extended Price'
FROM customers
INNER JOIN orders
ON customers.customernum=orders.customernum
INNER JOIN orderitems
ON orders.ordernum=orderitems.ordernum
INNER JOIN books
ON books.isbn=orderitems.isbn
ORDER BY customers.lastname,books.title;"></asp:SqlDataSource>
        <footer>
            <a href="Default.aspx" class="fakebtn">Back to home</a>
        </footer>
    </div>
    </form>
</body>
</html>
