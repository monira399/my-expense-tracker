import 'package:expense_tracker/models/transaction_model.dart';
import 'package:expense_tracker/widgets/transaction_section.dart';
import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  int isSelected =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction', style: Theme.of(context).textTheme.titleLarge,),
      ),

      body:Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchBar(
                hintText: 'Search',
                leading: Icon(Icons.search),
          
              ),
              SizedBox(height: 20,),
          
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
          
                  InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: (){
                      setState(() {
                        isSelected = 0;
                      });
          
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: isSelected == 0 ? AppColors.primary : AppColors.white,
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: Text('All', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: isSelected == 0 ? AppColors.white : Colors.black,),),
                    ),
                  ),
          
                  SizedBox(width: 2,),
          
                  InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      setState(() {
                        isSelected =1;
                      });
          
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected == 1 ? AppColors.primary : AppColors.white,
                        borderRadius: BorderRadius.circular(16),
          
                      ),
                      child: Text('Income', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: isSelected == 1 ? AppColors.white : Colors.black,) ),
          
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(16) ,
                    onTap: (){
                      setState(() {
                        isSelected =2;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: isSelected == 2 ? AppColors.primary : AppColors.white,
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: Text('Expense',style: Theme.of(context).textTheme.titleMedium?.copyWith(color: isSelected == 2 ? AppColors.white : Colors.black,) ),
          
                    ),
                  ),
          
          
          
                ],
              ),
          
              TransactionSection(
                  title: 'Today',
                transactions: todayTransactions,
          
              ),
          
              SizedBox(height: 20,),
          
              TransactionSection(
                  title: 'Yesterday',
                  transactions: yesterdayTransactions),

              TransactionSection(
                  title: 'Older',
                  transactions: olderTransactions)
          
            ],
          ),
        ),
      ),
    );
  }
}
