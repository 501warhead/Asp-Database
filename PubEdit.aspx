<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PubEdit.aspx.vb" Inherits="PubEdit" %>
<!-- Sean Kelly -->
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Publishers</title>
    <link href="Styles/Default.css" rel="stylesheet" />
</head>
<body>
    <form id="frmPubEdit" runat="server">
    <div>
        <h2>Edit Publishers</h2>
        <h3>Sean Kelly</h3>
        <asp:DetailsView ID="dvPubEdit" runat="server" Height="50px" Width="455px" AllowPaging="True" AutoGenerateRows="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="PubID" DataSourceID="dsPubEdit" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="PubID" HeaderText="PubID" ReadOnly="True" SortExpression="PubID" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="dsPubEdit" runat="server" ConnectionString="<%$ ConnectionStrings:connBooksDB %>" DeleteCommand="DELETE FROM [Publisher] WHERE [PubID] = @PubID" InsertCommand="INSERT INTO [Publisher] ([PubID], [Name], [Contact], [Phone]) VALUES (@PubID, @Name, @Contact, @Phone)" SelectCommand="SELECT * FROM [Publisher] ORDER BY [PubID]" UpdateCommand="UPDATE [Publisher] SET [Name] = @Name, [Contact] = @Contact, [Phone] = @Phone WHERE [PubID] = @PubID">
            <DeleteParameters>
                <asp:Parameter Name="PubID" Type="Double" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PubID" Type="Double" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Contact" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Contact" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="PubID" Type="Double" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
        <footer>
            <a href="Default.aspx" class="fakebtn">Back to home</a>
        </footer>
    </form>
</body>
</html>
