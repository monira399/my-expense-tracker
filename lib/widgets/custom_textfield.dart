import 'package:expense_tracker/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final double height;
  final double width;
  const CustomTextField({super.key, required this.controller, required this.hintText, required this.prefixIcon, this.suffixIcon, required this.height, required this.width});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
        width: double.infinity,
      child: TextFormField(
        autocorrect: false,
        enableSuggestions: false,
        spellCheckConfiguration: const SpellCheckConfiguration.disabled(),
        controller: controller,
        decoration:InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            fontSize: 12,
            color: Colors.grey.shade500
          ),

          prefixIcon: Icon(prefixIcon),
          suffixIcon: suffixIcon != null ? Icon(suffixIcon,size: 18,) : null,

          filled: true,
          fillColor: Colors.white,

          // contentPadding: EdgeInsets.symmetric(
          //     horizontal: 16,
          //     vertical: 16),

            border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16)
        ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: AppColors.primary,
              width: 1.2
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: AppColors.primary,
              width: 1.2
            )
          )
        ),

      ),
    );
  }
}

