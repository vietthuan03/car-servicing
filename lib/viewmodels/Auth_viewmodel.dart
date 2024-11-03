import 'dart:developer';

import 'package:car_servicing/extension/string_ext.dart';
import 'package:car_servicing/models/auth_validation_model.dart';
import 'package:car_servicing/presentation/pages/Home.dart';
import 'package:car_servicing/presentation/pages/auth/Login.dart';
import 'package:car_servicing/presentation/widgets/snackbarMessage.dart';
import 'package:car_servicing/services/Auth_service.dart';
import 'package:flutter/material.dart';

class UserAuthenticationViewmodel {
  ValidationModel name = ValidationModel(value:  null,error: null);
  ValidationModel email = ValidationModel(value:  null,error: null);
  ValidationModel password = ValidationModel(value:  null,error: null);
  ValidationModel rePassword = ValidationModel(value:  null,error: null);
  final _auth = AuthService();

  bool get isValidLogin => email.value?.isValidEmail == true && password.value?.isValidPassword == true;
  bool get isValidRegister => email.value?.isValidEmail == true && password.value?.isValidPassword == true && password.value==rePassword.value ;

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
      password = ValidationModel(value: value,error: "Password must be at least 6 characters");
    }
  }

  validateRePassword(String value){
    if (value == password.value) {
      rePassword=ValidationModel(value: value,error: null);
    }else{
      rePassword = ValidationModel(value: value,error: "Passwords do not match");
    }
  }

  Future<void> login(BuildContext context) async {
    // try {
      final user= await _auth.loginUserWithEmailAndPassword(email.value!, password.value!,context);
      if (user!=null) {
        // Show success snackbar
        snackbarMessage(message: "Login successful!",isError: false, context: context,).show();
        // Navigate to Home page
        goToHome(context);
      }
  }

  Future<void> register(BuildContext context) async {
    final user = await _auth.createUserWithEmailAndPassword(email.value!, password.value!,context);
    if (user!=null) {
      // Show success snackbar
        snackbarMessage(message: "Registration successful!",isError: false, context: context,).show();
      // Navigate to Home page
      goToHome(context);
    }  
    
  }
  goToHome(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
  goToLogin(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
}