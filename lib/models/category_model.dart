import 'package:flutter/material.dart';

class CategoryModel{
  final String id;
  final String name;
  final IconData icon;
  final Color color;
  final bool isIncome;

  CategoryModel ({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.isIncome
});
}

List<CategoryModel> dummyCategoryList = [
  CategoryModel(
    id: '1',
    name: 'Food',
    icon: Icons.fastfood,
    color: Colors.orange,
    isIncome: false,

  ),
  CategoryModel(
    id: '2',
    name: 'Shopping',
    icon: Icons.shopping_bag,
    color: Colors.blue,
    isIncome: false,
  ),
  CategoryModel(
    id: '3',
    name: 'Salary',
    icon: Icons.money,
    color: Colors.green,
    isIncome: true,
  ),
  CategoryModel(
    id: '4',
    name: 'Grocery',
    icon: Icons.local_grocery_store,
    color: Colors.purple,
    isIncome: false,
  ),
  CategoryModel(
    id: '5',
    name: 'Restaurant',
    icon: Icons.restaurant_menu,
    color: Colors.red,
    isIncome: false,
  ),
];