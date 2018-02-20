<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SchedulePage.aspx.cs" Inherits="iCareManagement.SchedulePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-5 info-container panel" style="min-width: 390px">
            <div class="panel panel-custom">
                <div class="panel-body">
                    <div class="info-head"><p>Thông tin khách hàng</p></div>
                    <table class="table">
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
</asp:Content>
