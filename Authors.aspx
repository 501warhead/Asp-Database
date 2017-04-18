<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Authors.aspx.vb" Inherits="Authors" %>
<!-- Sean Kelly -->
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Authors</title>
    <link href="Styles/Default.css" rel="stylesheet" />
</head>
<body>
    <form id="frmAuthor" runat="server">
    <div>
        <h2>Browse and Edit Authors!</h2>
        <h3>Sean Kelly</h3>
        <h3>Go ahead, ruin our stuff! We have terrible security <span><img src="Images/ok_hand.png" alt="OK hand" style="width:16px;height:16px;"/></span></h3>
        
        
        <asp:GridView ID="gvAuthor" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="AuthorID" DataSourceID="dsAuthors" ForeColor="#333333" GridLines="None" CssClass="GridView" EnableViewState="False" ViewStateMode="Disabled">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                <asp:BoundField DataField="AuthorID" HeaderText="AuthorID" ReadOnly="True" SortExpression="AuthorID" />
                <asp:BoundField DataField="Lname" HeaderText="Lname" SortExpression="Lname" />
                <asp:BoundField DataField="Fname" HeaderText="Fname" SortExpression="Fname" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="dsAuthors" runat="server" ConnectionString="<%$ ConnectionStrings:connBooksDB %>" SelectCommand="SELECT * FROM [Author] ORDER BY [AuthorID]">
        </asp:SqlDataSource>
        <asp:FormView ID="fvGridAuthorSelect" runat="server" DataKeyNames="AuthorID" DataSourceID="dsAuthFormView" CellPadding="4" ForeColor="#333333" Height="101px" Width="160px">
            <EditItemTemplate>
                AuthorID:
                <asp:Label ID="AuthorIDLabel1" runat="server" Text='<%# Eval("AuthorID") %>' />
                <br />
                <label>You cannot edit Author ID.</label>
                <br />
                Lname:
                <asp:TextBox ID="LnameTextBox" runat="server" Text='<%# Bind("Lname") %>' />
                <asp:RequiredFieldValidator ID="rfEditLName" runat="server" ErrorMessage="Last Name is required" Display="Dynamic" SetFocusOnError="True" ControlToValidate="LnameTextBox"></asp:RequiredFieldValidator>
                <br />
                Fname:
                <asp:TextBox ID="FnameTextBox" runat="server" Text='<%# Bind("Fname") %>' />
                                <asp:RequiredFieldValidator ID="rfEditFname" runat="server" ErrorMessage="First Name is Required" SetFocusOnError="True" ControlToValidate="FnameTextBox" Display="Dynamic"></asp:RequiredFieldValidator>
                <br />
                <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                AuthorID:
                <asp:TextBox ID="AuthorIDTextBox" runat="server" Text='<%# Bind("AuthorID") %>' />
                <asp:RequiredFieldValidator ID="rfInsAuthId" runat="server" ErrorMessage="Author ID is required" SetFocusOnError="True" ControlToValidate="AuthorIDTextBox" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regInsAuthId" runat="server" ErrorMessage="Author ID Must be in the following format: [A-Z###], capital letters only" Display="Dynamic" ControlToValidate="AuthorIDTextBox" SetFocusOnError="True" ValidationExpression="[A-Z][0-9]{3}"></asp:RegularExpressionValidator>
                <br />
                Lname:
                <asp:TextBox ID="LnameTextBox" runat="server" Text='<%# Bind("Lname") %>' />
                <asp:RequiredFieldValidator ID="rfInsLName" runat="server" ErrorMessage="Last Name is required" Display="Dynamic" SetFocusOnError="True" ControlToValidate="LnameTextBox"></asp:RequiredFieldValidator>
                <br />
                Fname:
                <asp:TextBox ID="FnameTextBox" runat="server" Text='<%# Bind("Fname") %>' />
                <asp:RequiredFieldValidator ID="rfInsFname" runat="server" ErrorMessage="First Name is Required" SetFocusOnError="True" ControlToValidate="FnameTextBox" Display="Dynamic"></asp:RequiredFieldValidator>
                <br />
                <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" ViewStateMode="Inherit" PostBackUrl="~/Authors.aspx" />
                &nbsp;<asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                AuthorID:
                <asp:Label ID="AuthorIDLabel" runat="server" Text='<%# Eval("AuthorID") %>' />
                <br />
                Lname:
                <asp:Label ID="LnameLabel" runat="server" Text='<%# Bind("Lname") %>' />
                <br />
                Fname:
                <asp:Label ID="FnameLabel" runat="server" Text='<%# Bind("Fname") %>' />
                <br />
                <asp:Button ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:Button ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:Button ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:FormView>
        <asp:SqlDataSource ID="dsAuthFormView" runat="server" ConnectionString="<%$ ConnectionStrings:connBooksDB %>" DeleteCommand="DELETE FROM [Author] WHERE [AuthorID] = @AuthorID" InsertCommand="INSERT INTO [Author] ([AuthorID], [Lname], [Fname]) VALUES (@AuthorID, @Lname, @Fname)" SelectCommand="SELECT * FROM [Author] WHERE ([AuthorID] = @AuthorID)" UpdateCommand="UPDATE [Author] SET [Lname] = @Lname, [Fname] = @Fname WHERE [AuthorID] = @AuthorID">
            <DeleteParameters>
                <asp:Parameter Name="AuthorID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="AuthorID" Type="String" />
                <asp:Parameter Name="Lname" Type="String" />
                <asp:Parameter Name="Fname" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="gvAuthor" DefaultValue="A105" Name="AuthorID" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Lname" Type="String" />
                <asp:Parameter Name="Fname" Type="String" />
                <asp:Parameter Name="AuthorID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <footer>
            <a href="Default.aspx" class="fakebtn">Back to home</a>
        </footer>
    </div>
    </form>
</body>
</html>
