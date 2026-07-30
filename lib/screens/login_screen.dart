import 'package:expense_tracker/utils/app_color.dart';
import 'package:expense_tracker/widgets/auth_background.dart';
import 'package:expense_tracker/widgets/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

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
        child: AuthHeader(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25),
                Text(
                  'Welcome Back',
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                SizedBox(height: 5),

                Text(
                  'Login to continue',
                ),

                SizedBox(height: 20),

                CustomTextField(
                  controller: _emailController,
                  hintText: 'Enter your email',
                  prefixIcon: Icons.email_outlined,
                ),

                SizedBox(height: 15),
                CustomTextField(
                  controller: _passwordController,
                  hintText: 'Enter your password',
                  prefixIcon: Icons.lock_outline,
                  suffixIcon: Icons.visibility,
                ),

                Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                FilledButton(onPressed: () {}, child: Text('Login')),

                Center(
                  child: Row(
                    children: [
                      Container(height: 2, width: 50, color: Colors.grey),

                      SizedBox(width: 5),

                      Text(
                        'or continue with',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(width: 5),

                      Container(height: 2, width: 50, color: Colors.grey),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(12),
                        ),
                      ),
                      label: Text('Google'),
                      icon: Image.asset(
                        'assets/icons/google.png',
                        height: 30,
                        width: 50,
                      ),
                    ),

                    SizedBox(width: 12),

                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(12),
                        ),
                      ),
                      label: Text('Facebook', style: Theme.of(context).textTheme.bodyMedium,),
                      icon: Image.asset(
                        'assets/icons/facebook.png',
                        height: 30,
                        width: 50,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
