class Validators{
  static final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  static bool isValidEmail(String email){
    return emailRegExp.hasMatch(email);
  }

  static bool isValidSimplePassword(String password){
    if(password != null && password.length > 1){
      return true;
    }else{
      return false;
    }
  }
}