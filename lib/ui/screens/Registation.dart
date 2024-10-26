import 'package:car_servicing/constants.dart';
import 'package:car_servicing/ui/screens/Login.dart';
import 'package:car_servicing/ui/screens/UserAuthentication_viewmodel.dart';
import 'package:car_servicing/widget/button_widget.dart';
import 'package:car_servicing/widget/textfield_widget.dart';

import 'package:flutter/material.dart';

class Registation extends StatefulWidget {
  const Registation({super.key});
  static const String id = 'registration_screen';

  @override
  State<Registation> createState() => _RegistationState();
}

class _RegistationState extends State<Registation> {
  final validation = UserAuthenticationViewmodel();
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
                     const Center(child: Text("REGISTER",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color:kSecondaryColor),)),
                     const SizedBox(height: 40),
                     CustomTextField(
                      label: "Email",
                      errorText: validation.email.error,
                      onChanged: (value){
                        validation.validateEmail(value);
                        setState(() {});
                    },),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextField(
                      label: "UserName",
                      // errorText: validation.username.error,
                      onChanged: (value){
                        // validation.validateEmail(value);
                        setState(() {});
                    },),
                    const SizedBox(
                      height: 24,
                    ),
                     CustomTextField(
                      label: "Password",
                      isPass: true,
                      errorText: validation.password.error,
                      onChanged: (value){
                      validation.validatePassword(value);
                      setState(() {});
                     },),
                    const SizedBox(height: 24),
                     CustomTextField(
                      label: "Re-Password",
                      isPass: true,
                      errorText: validation.password.error,
                      onChanged: (value){
                      validation.validatePassword(value);
                      setState(() {});
                     },),
                  const SizedBox(height: 24),
                  CustomButton(
                  label: "REGISTER",
                  onPressed:validation.isValid ? (){
                    validation.Register();
                  }:null,),
                  const SizedBox(height: 24),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                      'Already have an account?',
                      style: TextStyle(fontSize: 16, color:kSecondaryColor),
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