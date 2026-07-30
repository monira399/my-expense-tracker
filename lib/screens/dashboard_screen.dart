import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          IconButton(onPressed: (){},
              icon: Icon(Icons.notifications_outlined))
        ],
      ),
      body: Column(
        children: [
          Text('Good Morning'),
          Text('Monira'),
          Text('Today. 30 july, 2026'),
        ],
      ),
    );
  }
}
