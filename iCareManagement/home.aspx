<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="home.aspx.cs" Inherits="iCareManagement.home" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Management Portal</title>
    <link rel="icon" href="assets/images/favicon.ico">
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" href="assets/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="assets/bootstrap/bootstrap.min.css">

    <script src="assets/scripts/jquery-1.10.2.min.js"></script>
    <script src="assets/scripts/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
    <form runat="server">
    <asp:HiddenField ID="isFirstLoad" runat="server" Value="true" Visible="false" />
    <asp:ScriptManager ID="ScriptManager1" EnablePageMethods="true" EnablePartialRendering="true" runat="server" ></asp:ScriptManager>

<!--Nav Bar Top-->

    <div class="navbar navbar-fixed-top">
        <div class="navbar-header">
            <b>Dr.Q-Muller's Beauty Therapist Centre</b>
        </div>
        <div class="mp-navbar-right" style="padding-right: 10px">
            <ul>
                <li>
                    <div class="notification-container">
                        <p class="notification-icon">2</p>
                    </div>
                </li>
                <li>
                    <p href="#profile" class="user-profile">Nguyễn Thiên Phúc</p>
                </li>
                <li>
                    <img href="#profile" src="assets/images/account.png" width="70" height="70">
                </li>
            </ul>
        </div>
    </div>
    <div class="mp-cabinet">
        <div class="cabinet-sidebar">
            <ul class="cabinet-menu">
                <li class="active">
                    <a href="#home">
                        <i class="glyphicon-custom glyphicon glyphicon-home page-active"></i>
                        <span class="page-active">Trang chủ</span>
                    </a>
                </li>
                <li class="separator"></li>
                <li>
                    <a href="#appointment">
                        <i class="glyphicon-custom glyphicon glyphicon-list"></i>
                        <span>Tiếp Nhận Lịch Hẹn</span>
                    </a>
                </li>
                <li>
                    <a href="#appointment_management">
                        <i class="glyphicon-custom glyphicon glyphicon-list"></i>
                        <span>Quản Lý Lịch Hẹn</span>
                    </a>
                </li>
                <li>
                    <a href="#schedule">
                        <i class="glyphicon-custom glyphicon glyphicon-calendar"></i>
                        <span>Quản Lý Liệu Trình</span>
                    </a>
                </li>
                <li>
                    <a href="#customer">
                        <i class="glyphicon-custom glyphicon glyphicon-user"></i>
                        <span>Quản Lý Khách Hàng</span>
                    </a>
                </li>
                <li class="separator"></li>
                <li>
                    <a href="#instruction">
                        <i class="glyphicon-custom glyphicon glyphicon-info-sign"></i>
                        <span>Hướng Dẫn</span>
                    </a>
                </li>
                <li style="margin-bottom: 70px">
                    <a href="#signout" class="btn_Logout">
                        <i class="glyphicon-custom glyphicon glyphicon-log-out"></i>
                        <span>Đăng Thoát</span>
                    </a>
                </li>
            </ul>
        </div>

<!--Page Content-->

        <div class="cabinet-sidebar-content">
            <div class="cabinet-container" style="padding-left: 40px !important">

<!--Home Page-->

                <div id="home" class="cabinet-container-item active">
                    <p>Trang chu</p>
                </div>

<!--Appointment Page-->

                <div id="appointment" class="cabinet-container-item">
                    <div class="row" style="overflow-x: hidden;min-width: 735px;margin-bottom: 25px">
                        <div class="col-md-5 info-container panel" style="margin-left: 20px; min-width: 370px">
                            <div class="panel">
                                <div class="panel-body">
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <div class="info-content">
                                                <div class="input-group">
                                                    <span class="input-group-addon input-group-addon-custom input-group-addon-content">
                                                        <label class="control-label">Khách hàng</label>
                                                    </span>
                                                    <asp:TextBox ID="txt_Customer" CssClass="form-control form-control-custom" runat="server"></asp:TextBox>
                                                </div>
                                                <div class="input-group">
                                                    <span class="input-group-addon input-group-addon-custom input-group-addon-content">
                                                        <label class="control-label">Liệu trình</label>
                                                    </span>
                                                    <div class="selectContainer">
                                                        <asp:DropDownList ID="cmb_Vouchers" CssClass="form-control form-control-custom" runat="server">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="input-group">
                                                    <span class="input-group-addon input-group-addon-custom input-group-addon-content">
                                                        <label class="control-label">Trung tâm</label>
                                                    </span>
                                                    <div class="selectContainer">
                                                        <asp:DropDownList ID="cmb_Locations" CssClass="form-control form-control-custom" runat="server">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="input-group">
                                                    <span class="input-group-addon input-group-addon-custom input-group-addon-content">
                                                        <label class="control-label">Ngày bắt đầu</label>
                                                    </span>
                                                    <asp:TextBox ID="from" CssClass="form-control form-control-custom" runat="server"></asp:TextBox>
                                                </div>
                                                <div class="input-group">
                                                    <span class="input-group-addon input-group-addon-custom input-group-addon-content">
                                                        <label class="control-label">Ngày kết thúc</label>
                                                    </span>
                                                    <asp:TextBox ID="to" CssClass="form-control form-control-custom" runat="server"></asp:TextBox>
                                                </div>
                                                <div class="input-group">
                                                    <span class="input-group-addon input-group-addon-custom input-group-addon-content">
                                                        <label class="control-label">Loại</label>
                                                    </span>
                                                    <div class="selectContainer">
                                                        <asp:DropDownList ID="cmb_Type" CssClass="form-control form-control-custom" runat="server">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="input-group">
                                                    <asp:Button ID="btn_EditGeneralAppInfo" CssClass="btn btn-primary" OnClick="btn_EditGeneralAppInfo_Click" runat="server" Text="Chỉnh sửa" />
                                                    <asp:Button ID="btn_SaveGeneralAppInfo" CssClass="btn btn-primary" Style="margin-left: 10px" OnClick="btn_SaveGeneralAppInfo_Click" runat="server" Text="Lưu" />
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5 info-container panel" style="margin-left: 10px; min-height: 336px; min-width: 370px">
                            <div class="panel">
                                <div class="panel-body">
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
                                           <div class="info-content" style="padding-left: 50px">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <span class="input-group-addon input-group-addon-custom input-group-addon-content" style="text-align: left !important">
                                                            <div class="selectContainer">
                                                                <asp:DropDownList ID="cmb_DayOne" CssClass="form-control" Style="width:110px" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </span>
                                                        <div class="input-group" style="margin-left: 15px">
                                                            <div class="selectContainer">
                                                                <asp:DropDownList ID="cmb_TimeOne" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <span class="input-group-addon input-group-addon-custom input-group-addon-content" style="text-align: left !important">
                                                            <div class="selectContainer">
                                                                <asp:DropDownList ID="cmb_DayTwo" CssClass="form-control" Style="width:110px" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </span>
                                                        <div class="input-group" style="margin-left: 15px">
                                                            <div class="selectContainer">
                                                                <asp:DropDownList ID="cmb_TimeTwo" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <span class="input-group-addon input-group-addon-custom input-group-addon-content" style="text-align: left !important">
                                                            <div class="selectContainer">
                                                                <asp:DropDownList ID="cmb_DayThree" CssClass="form-control" Style="width:110px" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </span>
                                                        <div class="input-group" style="margin-left: 15px">
                                                            <div class="selectContainer">
                                                                <asp:DropDownList ID="cmb_TimeThree" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <span class="input-group-addon input-group-addon-custom input-group-addon-content">
                                                            <label class="control-label">Mã xác nhận</label>
                                                        </span>
                                                        <asp:TextBox ID="verification_Code" CssClass="form-control form-control-custom" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                               <div class="form-group">
                                                   <div class="input-group">
                                                       <span class="input-group-addon input-group-addon-custom input-group-addon-content">
                                                            <label class="control-label">Số điện thoại</label>
                                                        </span>
                                                        <asp:TextBox ID="customer_Phone" CssClass="form-control form-control-custom" runat="server"></asp:TextBox>
                                                   </div>
                                               </div>
                                                <div class="form-group" style="text-align: left;">
                                                    <span style="color: grey;font-size: 14px;margin-left: 0px">*Chưa có chức năng chỉnh sửa</span>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Button ID="refresh" CssClass="btn btn-primary" runat="server" Text="Cập nhật" />
                                <div class="col-md-offset-6" style="margin-bottom: 20px">
                                    <div class="input-group" style="width: 100%;position: relative;">
                                        <input type="text" class="form-control form-control-custom" placeholder="Tìm theo ngày hoặc tên khách hàng" style="width: 70% !important" name="txt_SearchApp" id="txt_SearchApp">
                                        <span class="glyphicon glyphicon-search" style="position: absolute;font-size: 1.5em; padding-left: 5px; padding-top: 5px"></span>
                                    </div>
                                </div>
                                <div class="panel panel-default col-md-11" style="box-shadow: rgba(0, 0, 0, 0.14902) 3px 3px 10px 2px;">
                                    <asp:GridView ID="grid_Appointment" CssClass="table" runat="server" AutoGenerateColumns="false" UseAccessibleHeader="true" 
                                        border="0" BorderStyle="None" AllowSorting="true" AllowPaging="true" PageSize="5" OnPageIndexChanging="OnPaging"
                                        OnRowDataBound="grid_Appointment_RowDataBound" OnRowCommand="grid_Appointment_RowCommand">
                                        <Columns>
                                            <asp:BoundField DataField="APPOINTMENT_ID" HeaderText="Mã lịch hẹn" />
                                            <asp:BoundField DataField="VOUCHER" HeaderText="Liệu trình" />
                                            <asp:BoundField DataField="START_DATE" HeaderText="Ngày bắt đầu" dataformatstring="{0:dd.MM.yyyy}" htmlencode="false"/>
                                            <asp:BoundField DataField="EXPIRED_DATE" HeaderText="Ngày kết thúc" dataformatstring="{0:dd.MM.yyyy}" htmlencode="false"/>
                                            <asp:BoundField DataField="TYPE" HeaderText="Loại" />
                                            <asp:BoundField DataField="LOCATION_NAME" HeaderText="Trung tâm" />
                                            <asp:BoundField DataField="CUSTOMER_NAME" HeaderText="Khách hàng" />
                                            <asp:BoundField DataField="CREATEDAT" HeaderText="Ngày khởi tạo" dataformatstring="{0:dd.MM.yyyy hh:mm tt}" htmlencode="false"/>
                                        </Columns>
                                        <selectedrowstyle backcolor="Purple"
                                        forecolor="White"
                                        font-bold="true"/>
                                    </asp:GridView>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="refresh" />
                                <asp:AsyncPostBackTrigger ControlID="btn_SaveGeneralAppInfo" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                    <!--<div class="row">
                        <asp:Button ID="btn_AppDetail" CssClass="btn-primary btn" runat="server" Text="PDF" />
                    </div>-->
                </div>

<!--Appointment Management Page-->

                <div id="appointment_management" class="cabinet-container-item">
                    <div class="row" style="overflow-x: hidden;min-width: 735px;margin-bottom: 25px">
                        <div class="col-md-5 info-container panel" style="margin-left: 20px; min-width: 370px">
                            <div class="panel">
                                <div class="panel-body">
                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                        <ContentTemplate>
                                            <div class="info-content">
                                                <div class="input-group">
                                                    <span class="input-group-addon input-group-addon-custom input-group-addon-content">
                                                        <label class="control-label">Khách hàng</label>
                                                    </span>
                                                    <asp:TextBox ID="txt_CustomerManagement" CssClass="form-control form-control-custom" runat="server"></asp:TextBox>
                                                </div>
                                                <div class="input-group">
                                                    <span class="input-group-addon input-group-addon-custom input-group-addon-content">
                                                        <label class="control-label">Liệu trình</label>
                                                    </span>
                                                    <div class="selectContainer">
                                                        <asp:DropDownList ID="cmb_VouchersManagement" CssClass="form-control form-control-custom" runat="server">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="input-group">
                                                    <span class="input-group-addon input-group-addon-custom input-group-addon-content">
                                                        <label class="control-label">Trung tâm</label>
                                                    </span>
                                                    <div class="selectContainer">
                                                        <asp:DropDownList ID="cmb_LocationsManagement" CssClass="form-control form-control-custom" runat="server">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="input-group">
                                                    <span class="input-group-addon input-group-addon-custom input-group-addon-content">
                                                        <label class="control-label">Ngày bắt đầu</label>
                                                    </span>
                                                    <asp:TextBox ID="fromManagement" CssClass="form-control form-control-custom" runat="server"></asp:TextBox>
                                                </div>
                                                <div class="input-group">
                                                    <span class="input-group-addon input-group-addon-custom input-group-addon-content">
                                                        <label class="control-label">Ngày kết thúc</label>
                                                    </span>
                                                    <asp:TextBox ID="toManagement" CssClass="form-control form-control-custom" runat="server"></asp:TextBox>
                                                </div>
                                                <div class="input-group">
                                                    <span class="input-group-addon input-group-addon-custom input-group-addon-content">
                                                        <label class="control-label">Loại</label>
                                                    </span>
                                                    <div class="selectContainer">
                                                        <asp:DropDownList ID="cmb_TypeManagement" CssClass="form-control form-control-custom" runat="server">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5 info-container panel" style="margin-left: 10px; min-height: 336px; min-width: 370px">
                            <div class="panel">
                                <div class="panel-body">
                                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                        <ContentTemplate>
                                           <div class="info-content" style="padding-left: 50px">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <span class="input-group-addon input-group-addon-custom input-group-addon-content" style="text-align: left !important">
                                                            <div class="selectContainer">
                                                                <asp:DropDownList ID="cmb_DayOneManagement" CssClass="form-control" Style="width:110px" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </span>
                                                        <div class="input-group" style="margin-left: 15px">
                                                            <div class="selectContainer">
                                                                <asp:DropDownList ID="cmb_TimeOneManagement" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <span class="input-group-addon input-group-addon-custom input-group-addon-content" style="text-align: left !important">
                                                            <div class="selectContainer">
                                                                <asp:DropDownList ID="cmb_DayTwoManagement" CssClass="form-control" Style="width:110px" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </span>
                                                        <div class="input-group" style="margin-left: 15px">
                                                            <div class="selectContainer">
                                                                <asp:DropDownList ID="cmb_TimeTwoManagement" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <span class="input-group-addon input-group-addon-custom input-group-addon-content" style="text-align: left !important">
                                                            <div class="selectContainer">
                                                                <asp:DropDownList ID="cmb_DayThreeManagement" CssClass="form-control" Style="width:110px" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </span>
                                                        <div class="input-group" style="margin-left: 15px">
                                                            <div class="selectContainer">
                                                                <asp:DropDownList ID="cmb_TimeThreeManagement" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <span class="input-group-addon input-group-addon-custom input-group-addon-content">
                                                            <label class="control-label">Mã xác nhận</label>
                                                        </span>
                                                        <asp:TextBox ID="verification_CodeManagement" CssClass="form-control form-control-custom" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                   <div class="input-group">
                                                       <span class="input-group-addon input-group-addon-custom input-group-addon-content">
                                                            <label class="control-label">Số điện thoại</label>
                                                        </span>
                                                        <asp:TextBox ID="custome_PhoneManagement" CssClass="form-control form-control-custom" runat="server"></asp:TextBox>
                                                   </div>
                                               </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Button ID="refreshManagement" CssClass="btn btn-primary" runat="server" Text="Cập nhật" />
                            <div class="col-md-offset-6" style="margin-bottom: 20px">
                                <div class="input-group" style="width: 100%;position: relative;">
                                    <input type="text" class="form-control form-control-custom" placeholder="Tìm theo ngày hoặc tên khách hàng" style="width: 70% !important" name="txt_SearchApp" id="txt_SearchAppManagement">
                                    <span class="glyphicon glyphicon-search" style="position: absolute;font-size: 1.5em; padding-left: 5px; padding-top: 5px"></span>
                                </div>
                            </div>
                            <div class="panel panel-default col-md-11" style="box-shadow: rgba(0, 0, 0, 0.14902) 3px 3px 10px 2px;">
                                <asp:GridView ID="grid_AppointmentManagement" CssClass="table" runat="server" AutoGenerateColumns="false" UseAccessibleHeader="true" 
                                    border="0" BorderStyle="None" AllowSorting="true" AllowPaging="true" PageSize="5" OnPageIndexChanging="grid_AppointmentManagement_PageIndexChanging"
                                        OnRowDataBound="grid_AppointmentManagement_RowDataBound" OnRowCommand="grid_AppointmentManagement_RowCommand">
                                    <Columns>
                                        <asp:BoundField DataField="APPOINTMENT_ID" HeaderText="Mã lịch hẹn" />
                                        <asp:BoundField DataField="VOUCHER" HeaderText="Liệu trình" />
                                        <asp:BoundField DataField="START_DATE" HeaderText="Ngày bắt đầu" dataformatstring="{0:dd.MM.yyyy}" htmlencode="false"/>
                                        <asp:BoundField DataField="EXPIRED_DATE" HeaderText="Ngày kết thúc" dataformatstring="{0:dd.MM.yyyy}" htmlencode="false"/>
                                        <asp:BoundField DataField="TYPE" HeaderText="Loại" />
                                        <asp:BoundField DataField="LOCATION_NAME" HeaderText="Trung tâm" />
                                        <asp:BoundField DataField="CUSTOMER_NAME" HeaderText="Khách hàng" />
                                        <asp:BoundField DataField="CREATEDAT" HeaderText="Ngày khởi tạo" dataformatstring="{0:dd.MM.yyyy hh:mm tt}" htmlencode="false"/>
                                    </Columns>
                                    <selectedrowstyle backcolor="Purple"
                                        forecolor="White"
                                        font-bold="true"/>
                                </asp:GridView>
                            </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="refreshManagement" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                    <!--<div class="row">
                        <asp:Button ID="Button4" CssClass="btn-primary btn" runat="server" Text="PDF" />
                    </div>-->
                </div>

<!--Schedule Page-->

                <div id="schedule" class="cabinet-container-item">
                    <div class="row">
                        <div>
                            <div class="col-md-5 info-container panel" style="min-width: 390px">
                                <div class="panel panel-custom">
                                    <div class="panel-body">
                                        <table class="table">
                                            <div class="info-head"><p>Thông tin khách hàng</p></div>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">Mã khách hàng:</th>
                                                    <td>CN612</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Khách hàng:</th>
                                                    <td>Nguyễn Thiên Phúc</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Điện thoại:</th>
                                                    <td>0468574938</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Email:</th>
                                                    <td>phuc.nguyen@edenred.com</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Loại khách hàng:</th>
                                                    <td>VIP Customer</td>
                                                </tr>
                                            </tbody>        
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5 col-md-offset-1 info-container panel" style="min-width: 390px">
                                <div class="panel panel-custom">
                                    <div class="panel-body">
                                        <table class="table">
                                            <tbody>
                                                <div class="info-head"><p>Thông tin dịch vụ</p></div>
                                                <tr>
                                                    <th scope="row">Liệu trình:</th>
                                                    <td>Smart Choice</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Ngày bắt đầu:</th>
                                                    <td>15.02.2016</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Ngày kết thúc:</th>
                                                    <td>15.03.2016</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Trung tâm:</th>
                                                    <td>Nguyễn Thị Minh Khai</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Số buổi đã đến:</th>
                                                    <td>24 (40%)</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-offset-6" style="margin-top: 20px;margin-bottom: 20px">
                            <div class="input-group" style="width: 100%;position: relative;">
                                <input type="text" class="form-control form-control-custom" placeholder="Tìm theo ngày hoặc tên khách hàng" style="width: 70% !important" name="txt_SearchSchedule" id="txt_SearchSchedule">
                                <span class="glyphicon glyphicon-search" style="position: absolute;font-size: 1.5em; padding-left: 5px; padding-top: 5px"></span>
                            </div>
                        </div>
                        <div class="panel panel-default col-md-11" style="box-shadow: rgba(0, 0, 0, 0.14902) 3px 3px 10px 2px;">
                            <div class="tbl_Schedule">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>Thứ Hai</th>
                                            <th>Thứ Ba</th>
                                            <th>Thứ tư</th>
                                            <th>Thứ năm</th>
                                            <th>Thứ sáu</th>
                                            <th>Thứ bảy</th>
                                            <th>Chủ Nhật</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">Tuần 1</th>
                                            <td>X</td>
                                            <td></td>
                                            <td>X</td>
                                            <td></td>
                                            <td>X</td>
                                            <td></td>
                                            <td>X</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Tuần 2</th>
                                            <td></td>
                                            <td>X</td>
                                            <td></td>
                                            <td>X</td>
                                            <td></td>
                                            <td>X</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Tuần 3</th>
                                            <td>X</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>X</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Tuần 4</th>
                                            <td>X</td>
                                            <td>X</td>
                                            <td></td>
                                            <td>X</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Tuần 5</th>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>X</td>
                                            <td></td>
                                            <td>X</td>
                                            <td>X</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Tuần 6</th>
                                            <td></td>
                                            <td>X</td>
                                            <td></td>
                                            <td>X</td>
                                            <td></td>
                                            <td>X</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Tuần 7</th>
                                            <td>X</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>X</td>
                                            <td>X</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <button id="btn_ExportPDFSchedule" class="btn-primary btn">PDF</button>
                        <button id="btn_ExportCSVSchedule" class="btn-primary btn">Excel</button>
                    </div>
                </div>

<!--Customer Page-->

                <div id="customer" class="cabinet-container-item">
                    <div class="row">
                        <div class="col-md-5 info-container panel" style="min-width: 390px">
                            <div class="panel panel-custom">
                                <div class="panel-body">
                                    <table class="table">
                                        <div class="info-head"><p>Thông tin dịch vụ hiện tại</p></div>
                                        <tbody>
                                            <tr>
                                                <th scope="row">Loại khách hàng:</th>
                                                <td>VIP Customer</td>
                                           </tr>
                                           <tr>
                                               <th scope="row">Điện thoại:</th>
                                               <td>0468435439</td>
                                            </tr>
                                           <tr>
                                                <th scope="row">Liệu trình:</th>
                                                <td>Smart Choice</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Tiến độ liệu trình:</th>
                                                <td>40%</td>
                                            </tr>
                                        </tbody>        
                                    </table>
                                </div>
                              </div>
                         </div>
                    </div>
                    <div class="row">
                        <div class="col-md-offset-6" style="margin-bottom: 20px">
                            <div class="input-group" style="width: 100%;position: relative;">
                                <input type="text" class="form-control form-control-custom" placeholder="Tìm theo ngày hoặc tên khách hàng" style="width: 70% !important" name="txt_SearchCustomer" id="txt_SearchCustomer">
                                <span class="glyphicon glyphicon-search" style="position: absolute;font-size: 1.5em; padding-left: 5px; padding-top: 5px"></span>
                            </div>
                        </div>
                        <div class="panel panel-default col-md-11" style="box-shadow: rgba(0, 0, 0, 0.14902) 3px 3px 10px 2px;">
                            <div>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Mã khách hàng</th>
                                            <th>Tên khách hàng</th>
                                            <th>Ngày sinh</th>
                                            <th>Giới tính</th>
                                            <th>Địa chỉ</th>
                                            <th>Email</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Nguyễn Thiên Phúc</td>
                                            <td>06.10.1996</td>
                                            <td>Nam</td>
                                            <td>Hồ Chí Minh</td>
                                            <td>phuc.nguyen@edenred.com</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Nguyễn Quang Minh</td>
                                            <td>18.11.1999</td>
                                            <td>Nam</td>
                                            <td>Hồ Chí Minh</td>
                                            <td>minh.nguyen1811@gmail.com</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>Nguyễn Cao Độ</td>
                                            <td>02.04.1965</td>
                                            <td>Nam</td>
                                            <td>Hồ Chí Minh</td>
                                            <td>do.nguyen0204@gmail.com</td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td>Lưu Thị Hồng Điệp</td>
                                            <td>29.11.1964</td>
                                            <td>Nữ</td>
                                            <td>Hồ Chí Minh</td>
                                            <td>diep.luu2911@gmail.com</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <button id="btn_ExportPDFCustomer" class="btn-primary btn">PDF</button>
                        <button id="btn_ExportCSVCustomer" class="btn-primary btn">Excel</button>
                    </div>                              
                </div>

<!--Instruction Page-->

                <div id="instruction" class="cabinet-container-item"><p>instruction</p>

                </div>

<!--Profile Page-->

                <div id="profile" class="cabinet-container-item">
                    <div class="container top-container">
                        <div class="row">
                            <div class="col-md-6 col-md-offset-2">
                                <div class="sign-in-panel panel panel-default" style="box-shadow: rgba(0, 0, 0, 0.14902) 3px 3px 10px 2px !important;">
                                    <div class="panel-body">
                                            <legend style="font-size:30px;text-align: center;"><b>Thông tin cá nhân</b></legend>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon input-group-addon-custom input-group-addon-profile" style="text-align: left !important">
                                                        <label class="control-label label-bold">Họ</label>
                                                    </span>
                                                    <input type="text" id="txt_LName" placeholder="Họ của bạn" class="form-control form-control-custom" aria-describedby="helpblock_LName" name="txt_LName">
                                                </div>
                                                <span id="helpblock_LName" class="help-block hidden" style="color:red">Tên đăng nhập có độ dài từ 6-64 ký tự, không có khoảng trắng ở giữa và không được bắt đầu hoặc kết thúc bằng ký hiệu(@@",!...).</span>
                                            </div>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon input-group-addon-custom input-group-addon-profile" style="text-align: left !important">
                                                        <label class="control-label label-bold">Tên</label>
                                                    </span>
                                                    <input type="text" id="txt_FName" class="form-control form-control-custom" placeholder="Tên của bạn" aria-describedby="helpblock_FName" name="txt_FName">
                                                </div>
                                                <span id="helpblock_FName" class="help-block hidden" style="color:red">Mật khẩu có độ dài ít nhất 8 ký tự, yêu cầu bao gồm cả chữ số và ký tự để đảm bảo mức độ bảo mật, không được bắt đầu hoặc kết thúc bằng khoảng trắng.</span>
                                            </div>
                                            <div class="form-group">
                                                <label class="radio-inline control-label label-bold">
                                                    <input type="radio" name="optradio">Nam
                                                </label>
                                                <label class="radio-inline control-label label-bold">
                                                    <input type="radio" name="optradio">Nữ
                                                </label>
                                            </div>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon input-group-addon-custom input-group-addon-profile" style="text-align: left !important">
                                                        <label class="control-label label-bold">Số Điện Thoại</label>
                                                    </span>
                                                    <input type="text" id="txt_Phone" placeholder="Số điện thoại của bạn" class="form-control form-control-custom" aria-describedby="helpblock_Username" name="txt_Phone">
                                                </div>
                                                <span id="helpblock_Phone" class="help-block hidden" style="color:red">Tên đăng nhập có độ dài từ 6-64 ký tự, không có khoảng trắng ở giữa và không được bắt đầu hoặc kết thúc bằng ký hiệu(@@",!...).</span>
                                            </div>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon input-group-addon-custom input-group-addon-profile" style="text-align: left !important">
                                                        <label class="control-label label-bold">Email</label>
                                                    </span>
                                                    <input type="text" id="txt_Email" placeholder="Email của bạn" class="form-control form-control-custom" aria-describedby="helpblock_Email" name="txt_Email">
                                                </div>
                                                <span id="helpblock_Email" class="help-block hidden" style="color:red">Tên đăng nhập có độ dài từ 6-64 ký tự, không có khoảng trắng ở giữa và không được bắt đầu hoặc kết thúc bằng ký hiệu(@@",!...).</span>
                                                <span id="helpblock_EmailHint" class="help-block" style="color:grey">*Lưu ý: Email này được sử dụng để khôi phục mật khẩu!</span>
                                            </div>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon input-group-addon-custom input-group-addon-profile" style="text-align: left !important">
                                                        <label class="control-label label-bold">Địa Chỉ</label>
                                                    </span>
                                                    <input type="text" id="txt_Address" placeholder="Địa chỉ của bạn" class="form-control form-control-custom" aria-describedby="helpblock_Address" name="txt_Address">
                                                </div>
                                                <span id="helpblock_Address" class="help-block hidden" style="color:red">Tên đăng nhập có độ dài từ 6-64 ký tự, không có khoảng trắng ở giữa và không được bắt đầu hoặc kết thúc bằng ký hiệu(@@",!...).</span>
                                            </div>
                                            <div class="field-pane" style="margin-top: 20px; margin-bottom: 20px">
                                                <button class="btn btn-primary" id="btn_SaveProfile" style="margin-top: 20px">Lưu</button>
                                            </div>
                                            <span id="helpblock_Info" class="help-block" style="color:grey">Xin vui lòng nhập đầy đủ thông tin trên. Thông tin này sẽ được sử dụng để chứng minh quyền hạn sử dụng đổi với phần mềm. Vui lòng cập nhật thông tin nếu có thay đổi.</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="assets/scripts/app.js"></script>
    <script src="assets/scripts/datePicker.js"></script>
    </form>
</body>
</html>