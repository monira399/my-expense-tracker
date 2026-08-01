import 'package:flutter/cupertino.dart';

class AddTransactionBottomSheet extends StatelessWidget {
  const AddTransactionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.85,
      child:Column(
        children: [
          Text('Add Transaction')
        ],
      ),

    );
  }
}

