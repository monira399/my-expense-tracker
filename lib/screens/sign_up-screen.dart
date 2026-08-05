import 'package:expense_tracker/utils/app_color.dart';
import 'package:expense_tracker/widgets/auth_background.dart';
import 'package:expense_tracker/widgets/auth_header.dart';
import 'package:expense_tracker/widgets/auth_title.dart';
import 'package:expense_tracker/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: AuthHeader(
            subText: 'Track your income, manage expenses and save more',
            child: Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  AuthTitle(
                      title: 'Welcome Back',
                      subTitle: 'Login to continue'),
              
                  SizedBox(height: 25),
              
                  CustomTextField(
                    controller: _fullNameController,
                    hintText: 'Full Name',
                    prefixIcon: Icons.person,
                    height: 55,
                    width: double.infinity,
                  ),
              
                  SizedBox(height: 20),
              
                  CustomTextField(
                    controller: _emailController,
                    hintText: 'Email',
                    prefixIcon: Icons.email,
                    height: 55,
                    width: double.infinity,
                  ),
              
                  SizedBox(height: 20),
              
                  CustomTextField(
                    controller: _passwordController,
                    hintText: 'Password',
                    prefixIcon: Icons.lock_outline,
                    suffixIcon: Icons.visibility,
                    height: 55,
                    width: double.infinity,
                  ),
              
                  SizedBox(height: 20),
              
                  CustomTextField(
                    controller: _confirmPasswordController,
                    hintText: 'Confirm Password',
                    prefixIcon: Icons.lock_outline,
                    suffixIcon: Icons.visibility,
                    height: 55,
                    width: double.infinity,
                  ),

                  SizedBox(height: 20),
              
                  CustomButton(text: 'SignUp', onPressed: (){},
                  ),
              
                  SizedBox(height: 25),

                  Center(
                    child: RichText(text: TextSpan(
                        text: 'Already have an account?  ',
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                  color: AppColors.primary
                              ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pop(context);
                              }
                          )
                        ]
                    )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


