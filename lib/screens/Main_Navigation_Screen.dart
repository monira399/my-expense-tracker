import 'package:expense_tracker/screens/profile_screen.dart';
import 'package:expense_tracker/screens/report_screen.dart';
import 'package:expense_tracker/screens/transaction_screen.dart';
import 'package:expense_tracker/utils/app_color.dart';
import 'package:expense_tracker/widgets/add_transaction_bottom_sheet.dart';
import 'package:expense_tracker/widgets/main_navigation_app_bar.dart';
import 'package:flutter/material.dart';

import 'dashboard_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    DashboardScreen(),
    TransactionScreen(),
    ReportScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: AppColors.background,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            builder: (context) => AddTransactionBottomSheet(),
          );
        },
        child: Icon(Icons.add, color: AppColors.white),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: MainNavigationAppBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
