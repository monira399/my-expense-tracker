import 'package:flutter/material.dart';

class CategoryModel{
  final String name;
  final IconData icon;
  final Color color;
  final bool isIncome;

  CategoryModel ({
    required this.name,
    required this.icon,
    required this.color,
    required this.isIncome
});
}

List<CategoryModel> dummyCategoryList = [
  CategoryModel(
    name: 'Food',
    icon: Icons.fastfood,
    color: Colors.orange,
    isIncome: false,
  ),
  CategoryModel(
    name: 'Shopping',
    icon: Icons.shopping_bag,
    color: Colors.blue,
    isIncome: false,
  ),
  CategoryModel(
    name: 'Salary',
    icon: Icons.money,
    color: Colors.green,
    isIncome: true,
  ),
  CategoryModel(
    name: 'Grocery',
    icon: Icons.local_grocery_store,
    color: Colors.purple,
    isIncome: false,
  ),
  CategoryModel(
    name: 'Restaurant',
    icon: Icons.restaurant_menu,
    color: Colors.red,
    isIncome: false,
  ),
];