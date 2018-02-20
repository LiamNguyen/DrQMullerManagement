<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AppointmentsPage.aspx.cs" Inherits="iCareManagement.AppointmentsPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="overflow-x: hidden;min-width: 735px;margin-bottom: 25px">
        <div class="col-md-5 info-container panel" style="margin-left: 20px; min-width: 370px">
            <div class="panel">
                <div class="panel-body">
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
                </div>
            </div>
        </div>
        <div class="col-md-5 info-container panel" style="margin-left: 10px; min-height: 336px; min-width: 370px">
            <div class="panel">
                <div class="panel-body">
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
                        <div class="form-group" style="text-align: left;">
                            <span style="color: grey;font-size: 14px;margin-left: 0px">*Chưa có chức năng chỉnh sửa</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
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
    </div>
</asp:Content>
