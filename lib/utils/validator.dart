import 'package:flutter/material.dart';

const String username = "username";
const String emptyEmailField = "Email address is required";
const String emptyTextField = "Field cannot be empty";
const String emptyPasswordField = "Password is required";
const String invalidEmailField = "Incorrect email address format";
const String passwordLengthError =
    "Password must be between 6 to 20 characters";
const String passwordMismatch = "Passwords do not match";
const String phoneNumberError = "Phone number must be 11 digits";
const String emptyUsernameField = "Username cannot be empty";
const String usernameLengthError = "Username length must be greater than 6";
const String passwordPatternError = "Password must contain a numeric character";

class RegularExpression {
  static final RegExp email = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\'
      r'.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  static final RegExp numberOnly = RegExp(r'[0-9]');
  static final RegExp personName = RegExp(r"[a-zA-Z]");
}

class TextFieldValidator {
  static String? validateField(TextInputType type, String? value) {
    if (type == TextInputType.text) {
      return validate(value);
    } else if (type == TextInputType.emailAddress) {
      return validateEmail(value);
    } else if (type == TextInputType.phone) {
      return validatePhone(value);
    } else if (type == TextInputType.number) {
      return validateNumber(value);
    }
    return null;
  }

  static String? validatePassword(
    String? password,
  ) {
    if (password!.isEmpty) {
      return emptyPasswordField;
    } else if (password.length < 6 || password.length > 20) {
      return passwordLengthError;
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyEmailField;
      }
      // Regex for email validation
      RegExp regExp = RegularExpression.email;
      if (regExp.hasMatch(value)) {
        return null;
      }
      return invalidEmailField;
    } else {
      return null;
    }
  }

  static String? validatePhone(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyTextField;
      }

      if (value.length != 11) {
        return phoneNumberError;
      }
    } else {
      return null;
    }
  }

  static String? validateNumber(String? value) {
    return null;
  }

  static String? validateUsername(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyUsernameField;
      }

      if (value.length < 6) {
        return usernameLengthError;
      }
    }
    return null;
  }

  static String? validate(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyTextField;
      }
    }
    return null;
  }
}
