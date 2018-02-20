<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CustomerPage.aspx.cs" Inherits="iCareManagement.CustomerPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-5 info-container panel" style="min-width: 390px">
            <div class="panel panel-custom">
                <div class="panel-body">
                    <div class="info-head"><p>Thông tin dịch vụ hiện tại</p></div>
                    <table class="table">
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
</asp:Content>
