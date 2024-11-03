import 'dart:developer';
import 'package:car_servicing/presentation/widgets/snackbarMessage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  //register with email & pass
  Future<User?> createUserWithEmailAndPassword(String email,String password,BuildContext context) async{
    try {
      final cred= await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return cred.user;
    } on FirebaseAuthException catch (e) {
       if (e.code == 'email-already-in-use') {
          snackbarMessage(message: "The email already exists.", context: context,).show();
       }
       else if (e.code == 'network-request-failed') {
          snackbarMessage(message: "Network request failed. Please turn on the internet", context: context,).show();
        }
      return null;
    } catch (e) {
      // Handle any unexpected errors
    debugPrint("Error: $e");
    snackbarMessage(message: "Something went wrong. Please try again later.", context: context).show();
    }
  }
  //login with email & pass
  Future<User?> loginUserWithEmailAndPassword(String email,String password,context) async{
    try {
      final cred= await _auth.signInWithEmailAndPassword(email: email, password: password);
      return cred.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        snackbarMessage(message: "Invalid Email",context: context).show();
    }
     else if (e.code == 'user-not-found') {
      snackbarMessage(message: "User not found for this Email", context: context,).show();
    } else if (e.code == 'wrong-password') {
      snackbarMessage(message: "Wrong Password", context: context,).show();
    }
    else if (e.code == 'network-request-failed') {
      snackbarMessage(message: "Network request failed. Please turn on the internet", context: context,).show();
    }
      return null;
    } catch (e) {
      // Handle any unexpected errors
      debugPrint("Error: $e");
      snackbarMessage(message: "Something went wrong. Please try again later.",context: context,).show();
    }
  }

  Future<void> signout(context) async{
    try {
      await _auth.signOut();
      snackbarMessage(message: "signOut successful!", context: context,isError: false,).show();
    } catch (e) {
      debugPrint("Error: $e");
      snackbarMessage(message: "Something went wrong. Please try again later.",context: context,).show();
    }
  }
}