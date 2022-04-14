class ValidationMixin {
  String? validateEmail(String? value){
    // return null if valid or string message if invalid
    if(value == null || !value.contains('@')) return "Not a valid email address!";
    return null;
  }

  String? validatePassword(String? value){
    if(value == null || value == "") return "Please insert the password";
    return null;
  }
}