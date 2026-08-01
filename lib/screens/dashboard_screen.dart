import 'package:expense_tracker/models/transaction_model.dart';
import 'package:expense_tracker/utils/app_color.dart';
import 'package:flutter/material.dart';

import '../widgets/current_income_card.dart';
import '../widgets/summary_card.dart';
import '../widgets/transaction_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
                children: [
                  const Text('👋', style: TextStyle(fontSize: 24)),
                  const SizedBox(width: 8),
                  Text(
                    'Good Morning',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              Text('Monira', style: Theme.of(context).textTheme.titleLarge),
              Text('Today. 30 july, 2026'),
        
              SizedBox(height: 20),
        
              CurrentIncomeCard(
                  height: 150,
                  width: double.infinity,
                  title: 'Current Balance',
                  amount: 4500,
                  date: '26 july, 2026',
                  fontSize: 30,
                  fontColor: Colors.white,
                  icon: Icons.account_balance_wallet_outlined,
                  iconColor: AppColors.secondary,
                  iconSize: 60,
                  color: AppColors.primary),
        
              SizedBox(height:25,),
        
              Row(
                children: [
                  Expanded(
                    child: SummaryCard(
                      title: 'Total Income',
                      amount: 42850,
                      percentage: '12.5%',
                      subTitle: 'from last month',
                      icon: Icons.arrow_upward,
                      iconColor: Colors.green,
                      iconBackgroundColor: const Color(0xffE8F8EC),
                    )
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
                    )
                  ),
                ],
              ),
        
              SizedBox(height: 25),
        
              Text('Recent Transactions', style: Theme.of(context).textTheme.titleLarge,),

              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: dummyTransactionList.length,
                  itemBuilder: (context, index){
                    final transaction = dummyTransactionList[index];
                    return TransactionCard(transaction: transaction);
                  },

                  separatorBuilder: (context, index) {
                  return Divider(
                    height: 20,
                    thickness: 1,
                  );
                  }, )
        
        
        
            ],
          ),
        ),
      ),
    );
  }
}
