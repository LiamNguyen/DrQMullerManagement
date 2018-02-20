<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AppointmentsManagementPage.aspx.cs" Inherits="iCareManagement.AppointmentsManagementPage" %>
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
                </div>
            </div>
        </div>
        <div class="col-md-5 info-container panel" style="margin-left: 10px; min-height: 336px; min-width: 370px">
            <div class="panel">
                <div class="panel-body">
                    <div class="info-content" style="padding-left: 50px">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon input-group-addon-custom input-group-addon-content" style="text-align: left !important">
                                    <div class="selectContainer">
                                        <asp:DropDownList ID="cmb_DayOneManagement" CssClass="form-control" Style="width:110px" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="input-group" style="margin-left: 15px">
                                    <div class="selectContainer">
                                        <asp:DropDownList ID="cmb_TimeOneManagement" CssClass="form-control" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon input-group-addon-custom input-group-addon-content" style="text-align: left !important">
                                    <div class="selectContainer">
                                        <asp:DropDownList ID="cmb_DayTwoManagement" CssClass="form-control" Style="width:110px" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="input-group" style="margin-left: 15px">
                                    <div class="selectContainer">
                                        <asp:DropDownList ID="cmb_TimeTwoManagement" CssClass="form-control" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon input-group-addon-custom input-group-addon-content" style="text-align: left !important">
                                    <div class="selectContainer">
                                        <asp:DropDownList ID="cmb_DayThreeManagement" CssClass="form-control" Style="width:110px" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
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
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <asp:Button ID="refreshManagement" CssClass="btn btn-primary" runat="server" Text="Cập nhật" />
        <div class="col-md-offset-6" style="margin-bottom: 20px">
            <div class="input-group" style="width: 100%;position: relative;">
                <input type="text" class="form-control form-control-custom" placeholder="Tìm theo ngày hoặc tên khách hàng" style="width: 70% !important" name="txt_SearchApp" id="txt_SearchAppManagement">
                <span class="glyphicon glyphicon-search" style="position: absolute;font-size: 1.5em; padding-left: 5px; padding-top: 5px"></span>
            </div>
        </div>
        <div class="panel panel-default col-md-11" style="box-shadow: rgba(0, 0, 0, 0.14902) 3px 3px 10px 2px;">
            <asp:GridView ID="grid_AppointmentManagement" CssClass="table" runat="server" AutoGenerateColumns="false" UseAccessibleHeader="true" 
                border="0" BorderStyle="None" AllowSorting="true" AllowPaging="true" PageSize="5" OnPageIndexChanging="Grid_AppointmentManagement_PageIndexChanging"
                    OnRowDataBound="Grid_AppointmentManagement_RowDataBound" OnRowCommand="Grid_AppointmentManagement_RowCommand">
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
