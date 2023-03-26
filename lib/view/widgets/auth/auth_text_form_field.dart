import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final bool obscureText;
  final Function validation;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;
  final TextInputType keyboardType;
  const AuthTextFormField({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.validation,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.hintText,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.black,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: (value) => validation(value),
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        filled: true,
        prefixIcon:prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle:const TextStyle(
          color: Colors.black45,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder:OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
