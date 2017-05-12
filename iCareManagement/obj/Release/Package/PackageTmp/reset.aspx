<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reset.aspx.cs" Inherits="iCareManagement.reset" %>

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
<body onload="focusToTxtBox()" style="background-image: url(assets/images/bg.jpg);">
    <div class="navbar">
        <div class="navbar-header">
            <b>Dr.Q-Muller's Beauty Therapist Centre</b>
        </div>
        <div class="mp-navbar-right" style="padding-top: 25px;padding-right: 25px;font-family: Villa;font-size: 30px;">
            <p>Forever young</p>
        </div>
    </div>
    <div class="mp-cabinet" style="padding-top: 0px">
        <div class="container top-container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="sign-in-panel panel panel-default">
                        <div class="panel-body">
                            <form novalidate class="form-vertical" action="login.html" method="post">
                                <legend style="font-size:40px;text-align: center;"><b>Welcome to Dr.Q-Muller</b></legend>
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon input-group-addon-custom">
                                            <label class="control-label label-bold">Mật Khẩu Mới</label>
                                        </span>
                                        <input type="text" id="txt_Password" placeholder="Mật khẩu mới của bạn" class="form-control form-control-custom" aria-describedby="helpblock_Password" name="txt_Password">
                                    </div>
                                    <span id="helpblock_Password" class="help-block hidden" style="color:red">Tên đăng nhập có độ dài từ 6-64 ký tự, không có khoảng trắng ở giữa và không được bắt đầu hoặc kết thúc bằng ký hiệu(@@",!...).</span>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon input-group-addon-custom" style="min-width: 137px !important;">
                                            <label class="control-label label-bold">Xác Nhận</label>
                                        </span>
                                        <input type="password" id="txt_Confirm" class="form-control form-control-custom" placeholder="Xác nhận lại mật khẩu của bạn" aria-describedby="helpblock_Confirm" name="txt_Confirm">
                                    </div>
                                    <span id="helpblock_Confirm" class="help-block hidden" style="color:red">Mật khẩu có độ dài ít nhất 8 ký tự, yêu cầu bao gồm cả chữ số và ký tự để đảm bảo mức độ bảo mật, không được bắt đầu hoặc kết thúc bằng khoảng trắng.</span>
                                </div>
                                <div class="field-pane" style="margin-top: 20px">
                                    <button class="btn btn-primary col-md-6 col-md-offset-3" id="btn_Reset" style="margin-top: 20px">Tạo Mới</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function focusToTxtBox() {
            document.getElementById("txt_Password").focus();
        }
    </script>
</body>
</html>
