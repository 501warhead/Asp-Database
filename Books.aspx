<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Books.aspx.vb" Inherits="Books" %>
<!-- Sean Kelly -->
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Browse our Books</title>
    <link href="Styles/Default.css" rel="stylesheet" />
</head>
<body>
    <form id="frmBooks" runat="server">
    <div>
        <h2>Browse our books!</h2>
        <h3>Sean Kelly</h3>
        <label for="ddlPubName">Find books by publisher</label>
        <asp:DropDownList ID="ddlPubName" runat="server" DataSourceID="dsPubName" DataMember="DefaultView" DataTextField="Name" DataValueField="PubID" AutoPostBack="True"></asp:DropDownList>
        <asp:SqlDataSource ID="dsPubName" runat="server" ConnectionString="<%$ ConnectionStrings:connBooksDB %>" SelectCommand="SELECT [PubID],[Name] FROM [Publisher] ORDER BY [PubID]"></asp:SqlDataSource>

        <asp:GridView ID="gvBooks" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ISBN" DataSourceID="dsBooksTable" GridLines="Vertical" Width="847px">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="ISBN" HeaderText="ISBN" ReadOnly="True" SortExpression="ISBN">
                <ControlStyle Font-Bold="True" />
                <HeaderStyle Font-Bold="True" />
                <ItemStyle HorizontalAlign="Left" Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="PubID" HeaderText="PubID" SortExpression="PubId" Visible="False">
                </asp:BoundField>
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title">
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="PubDate" DataFormatString="{0:d}" HeaderText="Publish Date" SortExpression="PubDate">
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="Cost" DataFormatString="{0:c}" HeaderText="Wholesale" SortExpression="Cost">
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="Retail" DataFormatString="{0:c}" HeaderText="Retail" SortExpression="Retail">
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category">
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
            <EmptyDataTemplate>
                Sorry, there&#39;s nothing here for this selection.
            </EmptyDataTemplate>
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
    </div>
        <asp:SqlDataSource ID="dsBooksTable" runat="server" ConnectionString="<%$ ConnectionStrings:connBooksDB %>" SelectCommand="SELECT * FROM [Books] WHERE ([PubID] = @PubID) ORDER BY [Title]">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlPubName" Name="PubID" PropertyName="SelectedValue" Type="Double" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:DetailsView ID="dvBooksEdit" runat="server" AllowPaging="True" AutoGenerateRows="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ISBN" DataSourceID="dsBooksIUDAll" GridLines="Vertical" Height="50px" Width="343px">
            <AlternatingRowStyle BackColor="Gainsboro" />
            <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:TemplateField HeaderText="ISBN" SortExpression="ISBN">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" BackColor="Silver" Text='<%# Eval("ISBN") %>'></asp:Label>
                        <asp:Label ID="Label7" runat="server" Text="You cannot edit this field!"></asp:Label>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtISBN" runat="server" Text='<%# Bind("ISBN") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rvInsISBN" runat="server" ControlToValidate="txtISBN" ErrorMessage="ISBN must be 10 digits" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ISBN") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Title" SortExpression="Title">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="This field is required"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="This field is required"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PubDate" SortExpression="PubDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("PubDate", "{0:d}") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox5" ErrorMessage="This field is required"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="PubDate must be a valid date!" Type="Date" SetFocusOnError="True" Operator="DataTypeCheck" ControlToValidate="TextBox5"></asp:CompareValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("PubDate", "{0:d}") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox6" ErrorMessage="This field is required"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="PubDate must be a valid date!" Type="Date" SetFocusOnError="True" Operator="DataTypeCheck" ControlToValidate="TextBox6"></asp:CompareValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("PubDate", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Publisher" SortExpression="PubID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsPubIDFK" DataTextField="Name" DataValueField="PubID" SelectedValue='<%# Bind("PubID") %>'>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DropDownList1" ErrorMessage="This field is required"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsPubIDFK" DataTextField="Name" DataValueField="PubID" SelectedValue='<%# Bind("PubID") %>'>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="DropDownList1" ErrorMessage="This field is required"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("PubID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cost" SortExpression="Cost">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox33" runat="server" Text='<%# Bind("Cost") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox33" ErrorMessage="This field is required"></asp:RequiredFieldValidator>

                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox33" ErrorMessage="Cost must be greater than $4.99" MinimumValue="4.99" MaximumValue="2147483647" Type="Double"></asp:RangeValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox44" runat="server" Text='<%# Bind("Cost", "{0:c}") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox44" ErrorMessage="This field is required"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TextBox44" ErrorMessage="Cost must be greater than $4.99" MinimumValue="4.99" MaximumValue="2147483647" Type="Double"></asp:RangeValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Cost", "{0:c}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Retail" SortExpression="Retail">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Retail") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="This field is required"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="Retail must be greater than cost" ControlToCompare="TextBox33" Operator="GreaterThan" Type="Double"></asp:CompareValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Retail", "{0:c}") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBox5" ErrorMessage="This field is required"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox5" ErrorMessage="Retail must be greater than cost" ControlToCompare="TextBox44" Operator="GreaterThan" Type="Double"></asp:CompareValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Retail", "{0:c}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="dsBooksIUDAll" runat="server" ConnectionString="<%$ ConnectionStrings:connBooksDB %>" DeleteCommand="DELETE FROM [Books] WHERE [ISBN] = @ISBN" InsertCommand="INSERT INTO [Books] ([ISBN], [Title], [PubDate], [PubID], [Cost], [Retail], [Category]) VALUES (@ISBN, @Title, @PubDate, @PubID, @Cost, @Retail, @Category)" SelectCommand="SELECT * FROM [Books]" UpdateCommand="UPDATE [Books] SET [Title] = @Title, [PubDate] = @PubDate, [PubID] = @PubID, [Cost] = @Cost, [Retail] = @Retail, [Category] = @Category WHERE [ISBN] = @ISBN">
            <DeleteParameters>
                <asp:Parameter Name="ISBN" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ISBN" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="PubDate" Type="DateTime" />
                <asp:Parameter Name="PubID" Type="Double" />
                <asp:Parameter Name="Cost" Type="Double" />
                <asp:Parameter Name="Retail" Type="Double" />
                <asp:Parameter Name="Category" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="PubDate" Type="DateTime" />
                <asp:Parameter Name="PubID" Type="Double" />
                <asp:Parameter Name="Cost" Type="Double" />
                <asp:Parameter Name="Retail" Type="Double" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="ISBN" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsPubIDFK" runat="server" ConnectionString="<%$ ConnectionStrings:connBooksDB %>" SelectCommand="SELECT [PubID], [Name] FROM [Publisher]"></asp:SqlDataSource>
        <footer>
            <a href="Default.aspx" class="fakebtn">Back to home</a>
        </footer>
    </form>
</body>
</html>
