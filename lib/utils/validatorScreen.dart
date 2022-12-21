
String? validateExpenseName(String value) {
    if (value.isEmpty) {
        return "* Required";
    } else if (value.length<3) {
        return "Name must be at least 3 character long";
    } else {
      return null;
    }
}


String? validateEmail(String value) {
    if (value.isEmpty) {
        return "* Required";
    } else if (!value.contains("@")) {
        return "Invalid Email";
    } else
        return null;
}


String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
        return "* Required";
    } else if (value.length < 11) {
        return "Incomplete phone number";
    } else
        return null;
}



String? validatePassword(String value) {
    if (value.isEmpty) {
        return "* Required";
    } else if (value.length < 6) {
        return "Password should be atleast 6 characters";
    } else if (value.length > 15) {
        return "Password should not be greater than 15 characters";
    } else
        return null;
}



String? validateAddress(String value) {
    if (value.isEmpty) {
        return "* Required";
    } else
        return null;
}


String? validatePackageDescription(String value) {
    if (value.isEmpty) {
        return "* Required";
    } else
        return null;
}