<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestDB.aspx.cs" Inherits="iCareManagement.TestDB" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" rel="Stylesheet" href="assets/scripts/JQWidgets/jqx.base.css"/>
    <script type="text/javascript" src="assets/scripts/JQWidgets/jqxcore.js"></script>
    <script type="text/javascript" src="assets/scripts/JQWidgets/jqxdata.js"></script>
    <script type="text/javascript" src="assets/scripts/JQWidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="assets/scripts/JQWidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="assets/scripts/JQWidgets/jqxcheckbox.js"></script>
    <script type="text/javascript" src="assets/scripts/JQWidgets/jqxdropdownlist.js"></script>
    <script type="text/javascript" src="assets/scripts/JQWidgets/jqxgrid.js"></script>
    <script type="text/javascript" src="assets/scripts/JQWidgets/jqxgrid.selection.js"></script>
    <link rel="stylesheet" type="text/css" href="style.css"/>
    <link rel="stylesheet" href="assets/bootstrap/bootstrap.min.css"/>
    <script src="assets/scripts/jquery-1.10.2.min.js"></script>
    <script src="assets/scripts/bootstrap.min.js"></script>
    <link rel="stylesheet" href="assets/css/jquery-ui.css"/>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="assets/scripts/jquery-ui.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="btn_Test" runat="server" Text="Button" OnClick="btn_Test_Click" /><br />
        <asp:Label ID="txt_Test" runat="server" Text="Label"></asp:Label>
        <table id="grid_Test"></table>
        <table id="jQGridDemo"></table>
        
        <asp:GridView ID="grid_ASP" CssClass="table" runat="server" AutoGenerateColumns="false" UseAccessibleHeader="true" border="0" BorderStyle="None">
            <Columns>
                <asp:BoundField DataField="TIME_ID" HeaderText="TIME ID" />
                <asp:BoundField DataField="TIME" HeaderText="TIME" />
            </Columns>
        </asp:GridView>
            
    </div>
    </form>
</body>
</html>
