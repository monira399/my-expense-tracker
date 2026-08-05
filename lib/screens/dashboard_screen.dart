import 'package:expense_tracker/models/transaction_model.dart';
import 'package:expense_tracker/utils/app_color.dart';
import 'package:flutter/material.dart';
import '../widgets/current_balanced_card.dart';
import '../widgets/summary_card.dart';

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
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('👋', style: TextStyle(fontSize: 24)),
                  const SizedBox(width: 8),
                  Text(
                    'Good Morning',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                ],
              ),
              Text('Munira', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 2),
              Text('Today. 30 july, 2026', style: Theme.of(context).textTheme.bodySmall,),

              SizedBox(height: 15),

              CurrentBalancedCard(
                height: 120,
                width: double.infinity,
                title: 'Current Balance',
                amount: 4500,
                date: '26 july, 2026',
                fontSize: 20,
                fontColor: Colors.white,
                icon: Icons.account_balance_wallet_outlined,
                iconColor: AppColors.secondary,
                iconSize: 60,
                color: AppColors.primary,
              ),

              SizedBox(height: 25),

              Row(
                children: [
                  Expanded(
                    child: SummaryCard(
                      title: 'Total Income',
                      amount: 18290,
                      percentage: '8.3%',
                      subTitle: 'from last month',
                      icon: Icons.arrow_upward,
                      iconColor: Colors.green,
                      iconBackgroundColor: AppColors.secondary.withOpacity(0.2),
                    ),
                  ),
                  const SizedBox(width: 16),

                  Expanded(
                    child: SummaryCard(
                      title: 'Total Expense',
                      amount: 18290,
                      percentage: '8.3%',
                      subTitle: 'from last month',
                      icon: Icons.arrow_downward,
                      iconColor: Colors.red,
                      iconBackgroundColor: const Color(0xffFDEBEC),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Transactions',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Row(
                    children: [
                      Text(
                        'View All',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(width: 4,),
                      Icon(Icons.arrow_forward, size: 20, color: Colors.grey,),

                    ],
                  ),
                ],
              ),

              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: transactionList.length,
                itemBuilder: (context, index) {
                  final transaction = transactionList[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: transaction.category.color.withOpacity(
                        0.2,
                      ),
                      child: Icon(
                        transaction.category.icon,
                        color: transaction.category.color,
                      ),
                    ),
                    title: Text(transaction.title),
                    subtitle: Text(transaction.category.name),

                    trailing: Text(
                      transaction.isIncome
                          ? "+ ${transaction.amount}"
                          : "- ${transaction.amount}",
                      style: TextStyle(
                        color: transaction.isIncome ? Colors.green : Colors.red,
                      ),
                    ),
                  );
                },

                separatorBuilder: (context, index) {
                  return Divider(
                      indent: 68,
                      endIndent: 16,
                      height: 16,
                      thickness: 1,
                  color: Colors.green.withOpacity(0.15),);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
