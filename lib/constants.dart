import 'package:flutter/material.dart';

const kPrimaryContainerColor = Color(0xff304FFE);
const kSecondaryColor = Color(0xff474747); 
const kBackgroundColor = Color(0xffF9F9FA); 

const kTextFieldDecoration = InputDecoration(
  hintStyle: TextStyle(fontSize: 22,color: kSecondaryColor),
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kSecondaryColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kSecondaryColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
);