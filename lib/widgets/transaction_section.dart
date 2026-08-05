import 'package:expense_tracker/models/transaction_model.dart';
import 'package:expense_tracker/widgets/transaction_card.dart';
import 'package:flutter/material.dart';

class TransactionSection extends StatelessWidget {
  final String title;
  final List<TransactionModel> transactions;

  const TransactionSection({
    super.key,
    required this.title,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),

        SizedBox(height: 10),

        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];

            return TransactionCard(transaction: transaction);
          },
        ),
      ],
    );
  }
}
