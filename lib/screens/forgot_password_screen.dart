import 'package:expense_tracker/screens/login_screen.dart';
import 'package:expense_tracker/utils/app_color.dart';
import 'package:expense_tracker/widgets/auth_background.dart';
import 'package:expense_tracker/widgets/auth_header.dart';
import 'package:expense_tracker/widgets/auth_title.dart';
import 'package:expense_tracker/widgets/custom_button.dart';
import 'package:expense_tracker/widgets/custom_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/forgot_password_card.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailAddressController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
          child:SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                 mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/logo_l.png', height: 80, width: 80, fit: BoxFit.contain,),
                    const SizedBox(height: 30),
                    Center(
                      child: AuthTitle(
                          title: 'Forgot Password',
                          subTitle: 'Enter your email to reset your password.'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: ForgotPasswordCard(
                          emailAddressController: _emailAddressController),
                    ),
                    Center(
                      child: RichText(text: TextSpan(
                          text: 'Don\'t receive the email?  ',
                          style: Theme.of(context).textTheme.bodyMedium,
                          children: [
                            TextSpan(
                                text: 'Resend Link',
                                style: TextStyle(
                                    color: AppColors.primary
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(), ),
                                            (predicate) => false);
                                  }
                            )
                          ]
                      )),
                    )
                  ],
                ),
              ),
            ),
          ) ),
    );
  }
}


