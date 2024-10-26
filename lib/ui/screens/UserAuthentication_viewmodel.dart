import 'package:car_servicing/extension/string_ext.dart';
import 'package:car_servicing/model/validation_model.dart';

class UserAuthenticationViewmodel {
  ValidationModel email = ValidationModel(value:  null,error: null);
  ValidationModel password = ValidationModel(value:  null,error: null);

  bool get isValid => email.value != null && password.value !=null;

  validateEmail(String value){
    if (value.isValidEmail) {
      email=ValidationModel(value: value,error: null);
    }else{
      email = ValidationModel(value: value,error: "Please ENTER a valid email");
    }
  }

  validatePassword(String value){
    if (value.isValidPassword) {
      password =ValidationModel(value: value,error: null);
    }else{
      password = ValidationModel(value: value,error: "Password must be at least 8 characters");
    }
  }

  Login(){
    //TODO: login
  }
  Register(){
    //TODO: login
  }
}