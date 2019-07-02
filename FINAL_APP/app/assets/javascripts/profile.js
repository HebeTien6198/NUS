
$("#document").ready(function(){

    console.log("----------------EDIT INFO---------------------")
    let basicValidate = true;
    let passwordValidate = true;

//-------------Ckech Validation on key up----------------
    //--------Check Name----------------
    $("#first-name").keyup(function () { 
        firstNameValidation();
    });
    $("#last-name").keyup(function () { 
        lastNameValidation();
    });

    //--------Check Pass------------------
    $("#new-password").keyup(function () { 
        resetPasswordValidation();
    });

    $("#confirm-password").keyup(function () { 
        resetPasswordValidation();
    });

    //---------Check Email----------------
    $("#email").keyup(function () { 
        emailValidateion();
    });



    // -------------Check validation on submit------------------
    validation = function() {
        isValidate = true;
        //----------Default Message-------------
        defaultMessage()
        // --------Check Name -----------------
        firstNameValidation()
        lastNameValidation()
        //----------Check pass----------------
        resetPasswordValidation()
        //----------Check email-----------------
        emailValidateion()
        return isValidate;
    }

    //-----------------Set default message-------------------------
    defaultMessage = function () {
        $("#first-name-message").text("");
        $("#last-name-message").text("");
        $("#password-message").text("");
        $("#confirm-password-message").text("");
      }


     //----------------First Name Check-----------------------
     firstNameValidation = function() {
        let firstName = $("#first-name").val();
        // $("#first-name").removeClass("is-invalid");
        console.log("First Name" + firstName)
        if (firstName == "") {
            invalid("#first-name", "#first-name-message");
            $("#first-name-message").text("First Name can not be empty");
            isValidate = false;
        }   
        else if (firstName.length > 25) {
            invalid("#first-name", "#first-name-message");
            $("#first-name-message").text("Your first name can only have maximum 25 characters");
            isValidate = false;
        }
        else {
            valid("#first-name", "#first-name-message");
            $("#first-name-message").text("Look good");
        }
    }

    //----------------Last Name Check-----------------------
    lastNameValidation = function() {
        let lastName = $("#last-name").val();
        console.log("Last Name " + lastName);
        if (lastName == "") {
            invalid("#last-name", "#last-name-message");
            $("#last-name-message").text("Last Name can not be empty");
            isValidate = false;
        }   
        else if (lastName.length > 25) {
            invalid("#last-name", "#last-name-message");
            $("#last-name-message").text("Your last name can only have maximum 25 characters");
            isValidate = false;
        }
        else {
            valid("#last-name", "#last-name-message");
            $("#last-name-message").text("Look good");
        }
    }


    //------------------------Email Check---------------------------------
    function emailValidateion() {
        let email = $("#email").val();
        console.log("c  " + email);
        var regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if (regex.test(email) === false) {
            console.log("c  " + email);
            invalid("#email", "#email-message");
            isValidate = false;
            $("#email-message").text("Please enter correct email");
            return;
        }
        else {
            valid("#email", "#email-message");
            $("#email-message").text("Look-good");
        }
      }


    //----------------Password Check-----------------------------------
    resetPasswordValidation = function() {
        let password = $("#new-password").val();
        let confirmPassword = $("#confirm-password").val();
        console.log("Password: " + password);
        console.log("Confirm password " + confirmPassword) ;

        if (password.length < 8) {
            invalid("#new-password", "#new-password-message");
            $("#new-password-message").text("You need at least 8 character for password");
            isValidate = false;
        }

        else if (password != confirmPassword) {
            invalid("#confirm-password", "#confirm-password-message");
            $("#confirm-password-message").text("Please confirm correct password");
            isValidate = false;
        }
        if (password.length >= 8){
            valid("#new-password", "#new-password-message");
        }
        if (password === confirmPassword && confirmPassword.length >= 8) {
            valid("#confirm-password", "#confirm-password-message");
        }
    }
    //----valid-invalid stuff---------------------------
    invalid = function(id, idMessage) {
        $(id).removeClass("is-valid");
        $(id).addClass("is-invalid");
        $(idMessage).removeClass("valid-feedback").removeClass("text-muted");
        $(idMessage).addClass("invalid-feedback");
    }

    valid = function(id, idMessage) {
        $(id).addClass("is-valid");
        $(id).removeClass("is-invalid");
        $(idMessage).addClass("valid-feedback");
        $(idMessage).removeClass("invalid-feedback").removeClass("text-muted");

    }
});