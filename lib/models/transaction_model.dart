import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionModel {
  final IconData prefixIcon;
  final String title;
  final DateTime date;
  final double amount;
  final bool isIncome;

  TransactionModel({
    required this.prefixIcon,
    required this.title,
    required this.date,
    required this.amount,
    required this.isIncome,
  });
}

List<TransactionModel> dummyTransactionList =[
  TransactionModel(
      prefixIcon: Icons.restaurant_menu_sharp,
      title: 'Restaurant',
      date: DateTime.now(),
      amount: 500,
      isIncome: true,
      ),
  TransactionModel(
      prefixIcon: Icons.shopping_bag_sharp,
      title: 'Shopping',
      date: DateTime.now(),
      amount: 1500,
      isIncome: false,
      ),
  TransactionModel(
      prefixIcon: Icons.money,
      title: 'Salary',
      date: DateTime.now(),
      amount: 10000,
      isIncome: true,
    ),
  TransactionModel(
      prefixIcon: Icons.local_grocery_store,
      title: 'Grocery',
      date: DateTime.now(),
      amount: 100,
      isIncome: false,
      ),
  TransactionModel(
      prefixIcon: Icons.fastfood,
      title: 'Food',
      date: DateTime.now(),
      amount: 500,
      isIncome: false,
      ),
];