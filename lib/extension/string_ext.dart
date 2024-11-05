// Email: r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
//Password: r'[a-zA-Z0-9!@#$%^&*()]{8}'
extension StringExt on String {
  bool get isValidEmail =>
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);

  bool get isValidPassword =>
      RegExp(r'[a-zA-Z0-9!@#$%^&*()]{6}').hasMatch(this);
  
   bool get isValidName =>
      RegExp(r"^[a-zA-Z\s]+$").hasMatch(this);

  bool get isValidPhoneNumber =>
      RegExp(r'^\d{10}$').hasMatch(this);
}