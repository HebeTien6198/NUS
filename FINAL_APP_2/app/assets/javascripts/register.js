$("document").ready(function () {
  let isValidate = true;
  //-------------Ckech Validation on key up----------------
  //--------Check Name----------------
  $("#first_name").keyup(function () {
    firstNameValidation();
  });
  $("#last_name").keyup(function () {
    lastNameValidation();
  });

  //--------Check Pass------------------
  $("#password").keyup(function () {
    passwordValidation();
  });

  $("#confirm-password").keyup(function () {
    passwordValidation();
  });

  //---------Check Email----------------
  $("#user_email").keyup(function () {
    emailValidateion();
  });



  $( "form" ).submit(function( event ) {
    return validation();
  });
  // -------------Check validation on submit------------------
  validation = function () {
    isValidate = true;
    alert("say hi");
    //----------Default Message-------------
    defaultMessage()
    // --------Check Name -----------------
    firstNameValidation()
    lastNameValidation()
    //----------Check pass----------------
    passwordValidation()
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
  firstNameValidation = function () {
    let firstName = $("#first_name").val();
    // $("#first-name").removeClass("is-invalid");
    console.log("First Name" + firstName)
    if (firstName == "") {
      invalid("#first_name", "#first-name-message");
      $("#first-name-message").text("First Name can not be empty");
      isValidate = false;
    }
    else if (firstName.length > 25) {
      invalid("#first_name", "#first-name-message");
      $("#first-name-message").text("Your first name can only have maximum 25 characters");
      isValidate = false;
    }
    else {
      valid("#first_name", "#first-name-message");
      $("#first-name-message").text("Look good");
    }
  }
  //----------------Last Name Check-----------------------
  lastNameValidation = function () {
    let lastName = $("#last_name").val();
    console.log("Last Name " + lastName);
    if (lastName == "") {
      invalid("#last_name", "#last-name-message");
      $("#last-name-message").text("Last Name can not be empty");
      isValidate = false;
    }
    else if (lastName.length > 25) {
      invalid("#last_name", "#last-name-message");
      $("#last-name-message").text("Your last name can only have maximum 25 characters");
      isValidate = false;
    }
    else {
      valid("#last_name", "#last-name-message");
      $("#last-name-message").text("Look good");
    }
  }

  //----------------Password Check-----------------------------------
  passwordValidation = function () {
    let password = $("#password").val();
    let confirmPassword = $("#confirm-password").val();
    console.log("Password: " + password);
    console.log("Confirm password " + confirmPassword);

    if (password.length < 8) {
      invalid("#password", "#password-message");
      $("#password-message").text("You need at least 8 character for password");
      isValidate = false;
    }

    else if (password != confirmPassword) {
      invalid("#confirm-password", "#confirm-password-message");
      $("#confirm-password-message").text("Please confirm correct password");
      isValidate = false;
    }
    if (password.length >= 8) {
      valid("#password", "#password-message");
    }
    if (password === confirmPassword && confirmPassword.length >= 8) {
      valid("#confirm-password", "#confirm-password-message");
    }
  }


  //------------------------Email Check---------------------------------
  function emailValidateion() {
    let email = $("#user_email").val();
    console.log("c  " + email);
    var regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if (regex.test(email) === false) {
      console.log("c  " + email);
      invalid("#user_email", "#email-message");
      isValidate = false;
      $("#email-message").text("Please enter correct email");
      return;
    }
    else {
      valid("#user_email", "#email-message");
      $("#email-message").text("Look-good");
    }
  }

  //----valid-invalid stuff---------------------------
  invalid = function (id, idMessage) {
    $(id).removeClass("is-valid");
    $(id).addClass("is-invalid");
    $(idMessage).removeClass("valid-feedback").removeClass("text-muted");
    $(idMessage).addClass("invalid-feedback");
  }

  valid = function (id, idMessage) {
    $(id).addClass("is-valid");
    $(id).removeClass("is-invalid");
    $(idMessage).addClass("valid-feedback");
    $(idMessage).removeClass("invalid-feedback").removeClass("text-muted");

  }
});