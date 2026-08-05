import 'package:expense_tracker/models/category_model.dart';
import 'package:flutter/material.dart';

class TransactionModel {
  final String title;
  final DateTime date;
  final double amount;
  final bool isIncome;
  final CategoryModel category;
  final String note;

  TransactionModel({
    required this.title,
    required this.date,
    required this.amount,
    required this.isIncome,
    required this.category,
    required this.note,
  });
}

List<TransactionModel> transactionList = [
  TransactionModel(
    title: 'Shopping',
    date: DateTime.now(),
    amount: 1200,
    isIncome: true,
    category: dummyCategoryList[0],
    note: 'Buy shoes',
  ),
  TransactionModel(
    title: 'Shopping',
    date:DateTime.now().subtract(Duration(days: 8)),
    amount: 1200,
    isIncome: false,
    category: dummyCategoryList[0],
    note: 'Buy shoes',
  ),
  TransactionModel(
    title: 'Shopping',
    date: DateTime.now().subtract(Duration(days: 1)),
    amount: 1200,
    isIncome: true,
    category: dummyCategoryList[0],
    note: 'Buy shoes',
  ),
  TransactionModel(
    title: 'Shopping',
    date: DateTime.now(),
    amount: 1200,
    isIncome: false,
    category: dummyCategoryList[0],
    note: 'Buy shoes',
  ),
  TransactionModel(
    title: 'Shopping',
    date: DateTime.now().subtract(Duration(days: 1)),
    amount: 1200,
    isIncome: true,
    category: dummyCategoryList[0],
    note: 'Buy shoes',
  ),
  TransactionModel(
    title: 'Shopping',
    date: DateTime.now().subtract(Duration(days: 1)),
    amount: 1200,
    isIncome: false,
    category: dummyCategoryList[0],
    note: 'Buy shoes',
  ),
  TransactionModel(
    title: 'Shopping',
    date: DateTime.now().subtract(Duration(days: 10)),
    amount: 1200,
    isIncome: true,
    category: dummyCategoryList[0],
    note: 'Buy shoes',
  ),
  TransactionModel(
    title: 'Shopping',
    date: DateTime.now().subtract(Duration(days: 1)),
    amount: 1200,
    isIncome: false,
    category: dummyCategoryList[0],
    note: 'Buy shoes',
  ),
  TransactionModel(
    title: 'Shopping',
    date: DateTime.now().subtract(Duration(days: 4)),
    amount: 1200,
    isIncome: true,
    category: dummyCategoryList[0],
    note: 'Buy shoes',
  ),
  TransactionModel(
    title: 'Shopping',
    date: DateTime.now(),
    amount: 1200,
    isIncome: false,
    category: dummyCategoryList[0],
    note: 'Buy shoes',
  ),
  TransactionModel(
    title: 'Shopping',
    date: DateTime.now().subtract(Duration(days: 1)),
    amount: 1200,
    isIncome: true,
    category: dummyCategoryList[0],
    note: 'Buy shoes',
  ),
  TransactionModel(
    title: 'Shopping',
    date: DateTime.now().subtract(Duration(days: 5)),
    amount: 1200,
    isIncome: false,
    category: dummyCategoryList[0],
    note: 'Buy shoes',
  ),
  TransactionModel(
    title: 'Shopping',
    date: DateTime.now(),
    amount: 1200,
    isIncome: true,
    category: dummyCategoryList[0],
    note: 'Buy shoes',
  ),

  
];

final todayTransactions = transactionList.where((transaction) {
  final now = DateTime.now();
  
  return transaction.date.year == now.year
      && transaction.date.month == now.month
      && transaction.date.day == now.day;
}).toList();

final yesterdayTransactions = transactionList.where((transaction) {
  final now = DateTime.now().subtract(Duration(days: 1));

  return transaction.date.year == now.year
      && transaction.date.month == now.month
      && transaction.date.day == now.day;
}).toList();

final olderTransactions = transactionList.where((transaction) {
  final now = DateTime.now();
  final yesterday = now.subtract(Duration(days: 1));

  final isToday = transaction.date.year == now.year
      && transaction.date.month == now.month
      && transaction.date.day == now.day;

  final isYesterday = transaction.date.year == yesterday.year
      && transaction.date.month == yesterday.month
      && transaction.date.day == yesterday.day;

  return !isToday && !isYesterday;

}).toList();
