function validate() {
    var txt_Username = document.getElementById('txt_Username').value;
    var txt_Password = document.getElementById('txt_Password').value;
    var help_Username = document.getElementById('helpblock_Username');
    var help_UsernameEmp = document.getElementById('helpblock_UsernameEmp');
    var help_Password = document.getElementById('helpblock_Password');
    var help_PasswordEmp = document.getElementById('helpblock_PasswordEmp');

    if (txt_Username == "" || txt_Username == null) {
        $(help_UsernameEmp).removeClass("hidden");
        if (txt_Password == "" || txt_Password == null) {
            $(help_PasswordEmp).removeClass("hidden");
            return false;
        } else {
            $(help_PasswordEmp).addClass("hidden");
        }
        return false;
    } else {
        $(help_UsernameEmp).addClass("hidden");
    }

    if (txt_Password == "" || txt_Password == null) {
        $(help_PasswordEmp).removeClass("hidden");
        return false;
    } else {
        $(help_PasswordEmp).addClass("hidden");
    }
    return true;
}