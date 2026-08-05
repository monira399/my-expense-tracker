import 'package:expense_tracker/utils/app_color.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../widgets/report_summary_card.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {

  final List<Map<String, dynamic>> topCategories = [
    {
      'category': 'Shopping',
      'amount': 1500.0,
      'icon': Icons.shopping_bag,
    },
    {
      'category': 'Food',
      'amount': 800.0,
      'icon': Icons.fastfood,
    },
    {
      'category': 'Bills',
      'amount': 600.0,
      'icon': Icons.receipt_long,
    },
    {
      'category': 'Transport',
      'amount': 300.0,
      'icon': Icons.directions_bus,
    },
  ];

  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Report Screen',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(DateFormat.yMMM().format(DateTime.now()), style: Theme.of(context).textTheme.titleMedium,),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: ReportSummaryCard(
                      title: 'Total Balance',
                      amount: 4000,
                      icon: Icons.money,
                      iconColor: Colors.green,
                      iconBackgroundColor: AppColors.secondary.withOpacity(0.2),
                      backgroundColor:  AppColors.secondary.withOpacity(0.1),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child: ReportSummaryCard(
                      title: 'Total Income',
                      amount: 40,
                      icon: Icons.arrow_upward,
                      iconColor: Colors.green,
                      iconBackgroundColor: AppColors.secondary.withOpacity(0.2),
                      backgroundColor:  AppColors.secondary.withOpacity(0.4),
                    ),
                  ),

                  SizedBox(width: 5,),
                  Expanded(
                    child: ReportSummaryCard(
                      title: 'Total Expense',
                      amount: 400,
                      icon: Icons.arrow_downward,
                      iconColor: Colors.red,
                      iconBackgroundColor: AppColors.error.withOpacity(0.2), 
                      backgroundColor: AppColors.error.withOpacity(0.4),
                    ),
                  ),
                ],

              ),
              SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Expense Analysis',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              
              const SizedBox(height: 20),
              
              Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.bar_chart, size: 30,),
                    SizedBox(height: 10,),
                    Text('Chart Coming Soon')
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Top Spending Categories',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),

              const SizedBox(height: 20),

              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: topCategories.length,
                  itemBuilder: (context, index) {
                    final category = topCategories[index];
                    return ListTile(
                      leading: CircleAvatar(
                        child: Icon(category['icon']),
                      ),
                      title: Text(category['category']),
                      trailing: Text('৳ ${category['amount']}'),
                    );
                  })


            ],
          ),
        ),
      ),
    );
  }
}
