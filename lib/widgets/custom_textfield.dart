import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  const CustomTextField({super.key, required this.controller, required this.hintText, required this.prefixIcon, this.suffixIcon});


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration:InputDecoration(
        hintText: hintText,

        prefixIcon: Icon(prefixIcon),
        suffix: suffixIcon != null ? Icon(suffixIcon) : null,

        filled: true,
        fillColor: Colors.white,

        contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18),

          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15)
      ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),

        ),

      ),

    );
  }
}

