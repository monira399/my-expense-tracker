import 'package:expense_tracker/screens/splashscreen.dart';
import 'package:expense_tracker/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpenseTracker extends StatelessWidget {
  const ExpenseTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.background,
          textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          titleMedium: const TextStyle(
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
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.background,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          scrolledUnderElevation: 0 ,
        )
      ),
      home: SplashScreen(),
    );
  }
}
