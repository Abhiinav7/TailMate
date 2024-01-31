class Validation {
  static String? validateEmail(String value) {
    if (value.toString().isEmpty) {
      return "  Field is Empty";
    } else if (!RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
        .hasMatch(value)) {
      return '  Please enter a valid email address.';
    } else {
      return null;
    }
  }

  static String? validateName(String value) {
    if (value!.isEmpty) {
      return '  Enter name';
    }
    return null;
  }
  static String? validateFields(String value) {
    if (value!.isEmpty) {
      return '  Field is empty';
    }
    return null;
  }
  static String? validateDropList(String value) {
    if (value==" ") {
      return '  Field is empty';
    }
    return null;
  }
  static String? validatePhone(String? value) {
    // String cleanedValue = value!.replaceAll(RegExp(r'[^0-9]'), '');
    if (value!.isEmpty) {
      return '  Enter number';
    } else if (value.length < 10) {
      return '  10 digit required';
    }

    // else if (!RegExp(r'^\d{10}$').hasMatch(cleanedValue)) {
    //   return ' enter a valid 10-digit phone number';
    // }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return '  Enter Password';
    }
    if (value.length < 6) {
      return '  password must be 6 digit';
    }
    return null;
  }
}
