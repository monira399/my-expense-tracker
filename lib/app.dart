import 'package:expense_tracker/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpenseTracker extends StatelessWidget {
  const ExpenseTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          headlineLarge: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),

          titleLarge: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600
          ),

          bodyMedium: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          )
        )
      ),
      home: SplashScreen(),
    );
  }
}
