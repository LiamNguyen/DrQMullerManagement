<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="iCareManagement.profile" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Management Portal</title>
    <link rel="icon" href="assets/images/favicon.ico">
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" href="assets/bootstrap/bootstrap.min.css">
    <script src="assets/scripts/jquery-1.10.2.min.js"></script>
    <script src="assets/scripts/bootstrap.min.js"></script>
</head>
<body onload="focusToTxtBox()">
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
                    <p class="user-profile">Nguyễn Thiên Phúc</p>
                </li>
                <li>
                    <img src="assets/images/account.png" width="70" height="70">
                </li>
            </ul>
        </div>
    </div>
    <div class="mp-cabinet" style="padding-top: 70px">
        <div class="container top-container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="sign-in-panel panel panel-default" style="box-shadow: rgba(0, 0, 0, 0.14902) 3px 3px 10px 2px !important;
">
                        <div class="panel-body">
                            <form novalidate class="form-vertical" method="post" action="home.aspx">
                                <legend style="font-size:30px;text-align: center;"><b>Thông tin cá nhân</b></legend>
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon input-group-addon-custom input-group-addon-profile" style="text-align: left !important">
                                            <label class="control-label label-bold">Họ</label>
                                        </span>
                                        <input type="text" id="txt_Username" placeholder="Họ của bạn" class="form-control form-control-custom" aria-describedby="helpblock_Username" name="txt_Username">
                                    </div>
                                    <span id="helpblock_Username" class="help-block hidden" style="color:red">Tên đăng nhập có độ dài từ 6-64 ký tự, không có khoảng trắng ở giữa và không được bắt đầu hoặc kết thúc bằng ký hiệu(@@",!...).</span>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon input-group-addon-custom input-group-addon-profile" style="text-align: left !important">
                                            <label class="control-label label-bold">Tên</label>
                                        </span>
                                        <input type="password" id="txt_Password" class="form-control form-control-custom" placeholder="Tên của bạn" aria-describedby="helpblock_Password" name="txt_Password">
                                    </div>
                                    <span id="helpblock_Password" class="help-block hidden" style="color:red">Mật khẩu có độ dài ít nhất 8 ký tự, yêu cầu bao gồm cả chữ số và ký tự để đảm bảo mức độ bảo mật, không được bắt đầu hoặc kết thúc bằng khoảng trắng.</span>
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
                                        <input type="text" id="txt_Username" placeholder="Số điện thoại của bạn" class="form-control form-control-custom" aria-describedby="helpblock_Username" name="txt_Username">
                                    </div>
                                    <span id="helpblock_Username" class="help-block hidden" style="color:red">Tên đăng nhập có độ dài từ 6-64 ký tự, không có khoảng trắng ở giữa và không được bắt đầu hoặc kết thúc bằng ký hiệu(@@",!...).</span>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon input-group-addon-custom input-group-addon-profile" style="text-align: left !important">
                                            <label class="control-label label-bold">Email</label>
                                        </span>
                                        <input type="text" id="txt_Username" placeholder="Email của bạn" class="form-control form-control-custom" aria-describedby="helpblock_Username" name="txt_Username">
                                    </div>
                                    <span id="helpblock_Username" class="help-block hidden" style="color:red">Tên đăng nhập có độ dài từ 6-64 ký tự, không có khoảng trắng ở giữa và không được bắt đầu hoặc kết thúc bằng ký hiệu(@@",!...).</span>
                                    <span id="helpblock_Username" class="help-block" style="color:grey">*Lưu ý: Email này được sử dụng để khôi phục mật khẩu!</span>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon input-group-addon-custom input-group-addon-profile" style="text-align: left !important">
                                            <label class="control-label label-bold">Địa Chỉ</label>
                                        </span>
                                        <input type="text" id="txt_Username" placeholder="Địa chỉ của bạn" class="form-control form-control-custom" aria-describedby="helpblock_Username" name="txt_Username">
                                    </div>
                                    <span id="helpblock_Username" class="help-block hidden" style="color:red">Tên đăng nhập có độ dài từ 6-64 ký tự, không có khoảng trắng ở giữa và không được bắt đầu hoặc kết thúc bằng ký hiệu(@@",!...).</span>
                                </div>
                                <div class="field-pane" style="margin-top: 20px; margin-bottom: 20px">
                                    <button class="btn btn-primary" id="btn_SaveProfile" style="margin-top: 20px">Lưu</button>
                                </div>
                                <span id="helpblock_Username" class="help-block" style="color:grey">Xin vui lòng nhập đầy đủ thông tin trên. Thông tin này sẽ được sử dụng để chứng minh quyền hạn sử dụng đổi với phần mềm. Vui lòng cập nhật thông tin nếu có thay đổi.</span>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function focusToTxtBox() {
            document.getElementById("txt_Username").focus();
        }

        function toRegisterPage() {
            document.location.href = "register.html";
        }

    </script>
</body>
</html>
