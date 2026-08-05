import 'package:expense_tracker/models/transaction_model.dart';
import 'package:expense_tracker/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionCard extends StatelessWidget {
 final TransactionModel transaction;

 const TransactionCard({
   super.key, required this.transaction,
});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: transaction.category.color.withOpacity(0.15),
        child: Icon(
          transaction.category.icon,
          color: transaction.category.color,
          size: 16,
        ),
      ),
      title: Text(transaction.title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text('${transaction.date.day}/${transaction.date.month}/${transaction.date.year}'),
      trailing: Row(
        mainAxisSize:MainAxisSize.min,
        children: [
          Text('${transaction.isIncome ? '+' : '-'} ৳ ${transaction.amount}', style:GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: transaction.isIncome ? Colors.green : Colors.red
          ) ),
          SizedBox(width:15 ),
          Icon(Icons.delete, color: AppColors.error,),
        ],
      ),
    );
  }
}
