import 'package:flutter/material.dart';

import 'comHelper.dart';

class getTextFormField extends StatelessWidget {
  TextEditingController? controller;
  String? hintName;
  String? name;
  IconData? icon;
  bool isObscureText;
  TextInputType inputType;
  bool isEnable;


  getTextFormField({
    this.controller,
    this.hintName,
    this.name,
    this.icon,
    this.isObscureText = false,
    this.inputType = TextInputType.text,
    this.isEnable = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("${name}"),
          SizedBox(height: 10.0),
          TextFormField(
            controller: controller,
            obscureText: isObscureText,
            enabled: isEnable,
            keyboardType: inputType,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'required $hintName';
              }
              if (hintName == "Email" && !validateEmail(value)) {
                return 'required  Valid Email';
              }
              if (hintName == "Address") {
                print(value.length);
                  return (value.length<=25) ?"Enter minimun 25 latters":null;
              }
              if (hintName == "Percentage") {
                double percentage = double.tryParse(value) ?? -1;
                if (percentage >= 35 && percentage <= 100) {
                  return null;
                } else {
                  return "Enter a valid percentage between 35 and 100"; // Percentage is outside the valid range
                }
              }
              if (hintName == "LandlineNo" || hintName == "MobileNo") {
                String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                RegExp regExp = new RegExp(patttern);
                return !regExp.hasMatch(value) ?"Enter Valid number":null;
              }
              return null;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0), // Set border radius
              ),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(icon),
            ),
          ),
        ],
      ),
    );
  }
}
class HeaderText extends StatelessWidget {
  String? hintName;
  HeaderText({
    this.hintName,
    });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0, // Set the desired height
      width: double.infinity, // Expand to full available width
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${hintName}"),
        ],
      ),
    );
  }
}