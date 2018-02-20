<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="iCareManagement.login" %>

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
    <script src="https://cloud.github.com/downloads/kopipejst/jqSnow/jquery.snow.js"></script>
    <script src="https://cloud.github.com/downloads/kopipejst/jqSnow/jquery.snow.min.1.0.js"></script>
</head>
<body onload="focusToTxtBox()" style="background-image: url(assets/images/bg_ChristmasTheme.jpg);">
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
                            <form novalidate class="form-vertical" runat="server">
                                <legend style="font-size:40px;text-align: center;"><b>Welcome to Dr.Q-Muller</b></legend>
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon input-group-addon-custom">
                                            <label class="control-label label-bold">Tên Đăng Nhập</label>
                                        </span>
                                        <asp:TextBox ID="txt_Username" ClientIDMode="Static" placeholder="Tên đăng nhập của bạn" CssClass="form-control form-control-custom" runat="server"></asp:TextBox>
                                    </div>
                                    <span id="helpblock_Username" class="help-block hidden" style="color:red; margin-left:160px">Tên đăng nhập có độ dài từ 6-64 ký tự, không có khoảng trắng ở giữa và không được bắt đầu hoặc kết thúc bằng ký hiệu(@@",!...).</span>
                                    <span id="helpblock_UsernameEmp" class="help-block hidden" style="color:red; margin-left:160px"">Tên đăng nhập trống.</span>

                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon input-group-addon-custom" style="min-width: 147px !important;">
                                            <label class="control-label label-bold">Mật Khẩu</label>
                                        </span>
                                        <asp:TextBox ID="txt_Password" ClientIDMode="Static" TextMode="Password" CssClass="form-control form-control-custom" placeholder="Mật khẩu của bạn" runat="server"></asp:TextBox>
                                    </div>
                                    <span id="helpblock_Password" class="help-block hidden" style="color:red; margin-left:160px">Mật khẩu có độ dài ít nhất 8 ký tự, yêu cầu bao gồm cả chữ số và ký tự để đảm bảo mức độ bảo mật, không được bắt đầu hoặc kết thúc bằng khoảng trắng.</span>
                                    <span id="helpblock_PasswordEmp" class="help-block hidden" style="color:red; margin-left:160px"">Mật khẩu trống.</span>                                                                        
                                </div>
                                <div class="field-pane" style="margin-top: 20px">
                                    <a href="reset.aspx" style="color: purple"><b>Bạn quên tên đăng nhập hoặc mật khẩu?</b></a>
                                    <asp:Button ID="btn_Signin" runat="server" OnClick="btn_Signin_Click" CssClass="btn btn-primary col-md-6 col-md-offset-3" style="margin-top: 20px" Text="Đăng Nhập" />
                                    <asp:Button ID="btn_Register" runat="server" OnClick="btn_Register_Click" CssClass="btn btn-primary col-md-6 col-md-offset-3" style="margin-top: 10px" Text="Đăng Ký" />
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready( function(){
            $.fn.snow({ minSize: 10, maxSize: 50, newOn: 100});
        });
    </script>
    <script type="text/javascript">
        function focusToTxtBox() {
            document.getElementById("txt_Username").focus();
        }
    </script>
    <script src="assets/scripts/validateLogin.js"></script>
</body>
</html>
