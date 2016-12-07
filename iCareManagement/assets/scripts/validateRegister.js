function validate() {
    var valid = true,
        txt_Username = $("#txt_Username"),
        txt_Password = $("#txt_Password"),
        txt_Confirm = $("#txt_Confirm"),
        txt_AuthID = $("#txt_AuthID"),
        help_Username = $("#helpblock_Username"),
        help_Password = $("#helpblock_Password"),
        help_Confirm = $("#helpblock_Confirm"),
        help_UsernameEmp = $("#helpblock_UsernameEmp"),
        help_PasswordEmp = $("#helpblock_PasswordEmp"),
        help_ConfirmEmp = $("#helpblock_ConfirmEmp"),
        help_ConfirmMatch = $("#helpblock_ConfirmMatch"),
        help_AuthIDEmp = $("#helpblock_AuthIDEmp");

    function checkEmpty(o, h) {
        console.log("In Func");
        if (o.val() == "" || o.val() == null) {
            console.log("In if emp");
            h.removeClass("hidden");
            return false;
        }
        h.addClass("hidden");
        return true;
    }

    function checkLength(o, min, max, h) {
        if (o.val().length > max || o.val().length < min) {
            h.removeClass("hidden");
            return false;
        } else {
            h.addClass("hidden");
            return true;
        }
    }

    function checkRegexp(o, regexp, h) {
        
        if (!(regexp.test(o.val()))) {
            h.removeClass("hidden");
            return false;
        } else {
            h.addClass("hidden");
            return true;
        }
    }

    function checkMatch(h) {
        if (txt_Password.val() != txt_Confirm.val()) {
            h.removeClass("hidden");
            return false;
        } else {
            h.addClass("hidden");
            return true;
        }
    }

    valid = valid && checkEmpty(txt_Username, help_UsernameEmp);
    valid = valid && checkEmpty(txt_Password, help_PasswordEmp);
    valid = valid && checkEmpty(txt_Confirm, help_ConfirmEmp);
    valid = valid && checkEmpty(txt_AuthID, help_AuthIDEmp);
    valid = valid && checkMatch(help_ConfirmMatch);

    return valid;
};