import 'package:expense_tracker/screens/Main_Navigation_Screen.dart';
import 'package:expense_tracker/screens/forgot_password_screen.dart';
import 'package:expense_tracker/screens/sign_up-screen.dart';
import 'package:expense_tracker/utils/app_color.dart';
import 'package:expense_tracker/widgets/auth_background.dart';
import 'package:expense_tracker/widgets/auth_header.dart';
import 'package:expense_tracker/widgets/auth_title.dart';
import 'package:expense_tracker/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../widgets/alternative_login_method.dart';
import '../widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                  SizedBox(height: 12),
                  AuthTitle(
                      title: 'Welcome Back',
                      subTitle: 'Login to continue'),
          
                  SizedBox(height: 25),
          
                  CustomTextField(
                    controller: _emailController,
                    hintText: 'Enter your email',
                    prefixIcon: Icons.email_outlined,
                    height: 55,
                    width: double.infinity,
                  ),
          
                  SizedBox(height: 20),
          
                  CustomTextField(
                    controller: _passwordController,
                    hintText: 'Enter your password',
                    prefixIcon: Icons.lock_outline,
                    suffixIcon: Icons.visibility,
                    height: 55,
                    width: double.infinity,
                  ),
          
                  SizedBox(height: 5,),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
                    }, child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),),
                  ),
          
                SizedBox(height: 10),
          
                CustomButton(text: 'Login', onPressed: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainNavigationScreen()), (predicate) => false);
                },
                ),
          
                  SizedBox(height: 15),
          
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(height: 2, width: 80, color: Colors.grey.shade500),
          
                        SizedBox(width: 10),
          
                        Text(
                          'or continue with',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade500
                          ),
                        ),
          
                        SizedBox(width: 10),
          
                        Container(height: 2, width: 80, color: Colors.grey.shade500),
                      ],
                    ),
          
          
                  SizedBox(height: 16),
          
                  AlterNativeLoginMethod(),
          
                  SizedBox(height: 20),
          
                  Center(
                    child: RichText(text: TextSpan(
                        text: 'Don\'t have an account?  ',
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                  color: AppColors.primary
                              ),
                            recognizer: TapGestureRecognizer()..onTap = () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
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


