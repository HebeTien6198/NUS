$("document").ready(function(){
    console.log("goiing");
    let isValidate = true;
    // -------------Check validation------------------
    validation = function() {
        //----------Default Message-------------
        defaultMessage()
        // --------Check Name -----------------
        firstNameValidation()
        lastNameValidation()
        //----------Check pass----------------
        passwordValidation()
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
        firstName = $("#first-name").val();
        console.log("First Name" + firstName)
        if (firstName == "") {
            $("#first-name-message").text("First Name can not be empty");
            isValidate = false;
        }   
        else if (firstName.length > 25) {
            $("#first-name-message").text("Your first name can only have maximum 25 characters");
            isValidate = false;
        }
    }
    //----------------Last Name Check-----------------------
    lastNameValidation = function() {
        lastName = $("#last-name").val();
        console.log("Last Name " + lastName);
        if (lastName == "") {
            $("#last-name-message").text("Last Name can not be empty");
            isValidate = false;
        }   
        else if (lastName.length > 25) {
            $("#last-name-message").text("Your last name can only have maximum 25 characters");
            isValidate = false;
        }
    }

    //----------------Password Check-----------------------------------
    passwordValidation = function() {
        password = $("#password").val();
        confirmPassword = $("#confirm-password").val();
        console.log("Password: " + password);
        console.log("Confirm password " + confirmPassword) ;


        if (password.length < 8) {
            $("#password-message").text("You need at least 8 character for password");
            isValidate = false;
        }

        else if (password != confirmPassword) {
            $("#confirm-password-message").text("Please confirm correct password");
            isValidate = false;
        }
    }
});