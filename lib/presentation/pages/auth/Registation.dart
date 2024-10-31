import 'dart:developer';

import 'package:car_servicing/constants.dart';
import 'package:car_servicing/presentation/pages/auth/Login.dart';
import 'package:car_servicing/viewModel/Auth_viewmodel.dart';
import 'package:car_servicing/presentation/widgets/button_widget.dart';
import 'package:car_servicing/presentation/widgets/textfield_widget.dart';

import 'package:flutter/material.dart';

class Registation extends StatefulWidget {
  const Registation({super.key});
  static const String id = 'registration_screen';

  @override
  State<Registation> createState() => _RegistationState();
}

class _RegistationState extends State<Registation> {
  final validation = UserAuthenticationViewmodel();

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
return SafeArea(
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(16),
              child: SafeArea(
                child: 
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                     const Center(child: Text("REGISTER",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color:kTextColor),)),
                     const SizedBox(height: 40),
                     CustomTextField(
                      label: "Name",
                      hint: "Enter Your Name",
                      controller: _name,
                      // errorText: validation.username.error,
                      onChanged: (value){
                        // validation.validateEmail(value);
                        setState(() {});
                    },),
                    const SizedBox(
                      height: 24,
                    ),
                     CustomTextField(
                      label: "Email",
                      hint: "Enter Your Email",
                      controller: _email,
                      errorText: validation.email.error,
                      onChanged: (value){
                        validation.validateEmail(value);
                        setState(() {});
                    },),
                    const SizedBox(
                      height: 24,
                    ),
                     CustomTextField(
                      label: "Password",
                      hint: "Enter Your Password",
                      controller: _password,
                      isPass: true,
                      errorText: validation.password.error,
                      onChanged: (value){
                      validation.validatePassword(value);
                      setState(() {});
                     },),
                    const SizedBox(height: 24),
                     CustomTextField(
                      label: "Re-Password",
                      hint: "Enter Your Re-Password",
                      isPass: true,
                      errorText: validation.rePassword.error,
                      onChanged: (value){
                      validation.validateRePassword(value);
                      setState(() {});
                     },),
                  const SizedBox(height: 24),
                  CustomButton(
                  label: "REGISTER",
                  onPressed:validation.isValidRegister ? (){
                    validation.register(context);
                  }:null,),
                  const SizedBox(height: 24),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                      'Already have an account?',
                      style: TextStyle(fontSize: 16, color:kTextColor),
                    ),
                    TextButton(onPressed: (){
                      Navigator.pushNamed(context, Login.id);
                    }, child: const Text(
                      'LOGIN',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: kPrimaryContainerColor),
                    ),)
                    ],
                  ),
                  ],
                )
              ),
            ),
          ),
          
        ),
        // debugShowCheckedModeBanner: false,
    );
     
  }
}