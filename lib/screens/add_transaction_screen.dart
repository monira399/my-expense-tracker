import 'package:expense_tracker/models/transaction_model.dart';
import 'package:expense_tracker/screens/add_category_screen.dart';
import 'package:expense_tracker/widgets/custom_button.dart';
import 'package:expense_tracker/widgets/custom_data/custom_selector_tile.dart';
import 'package:expense_tracker/widgets/custom_textfield.dart';
import 'package:expense_tracker/widgets/expense_income_toggle_bar.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../models/category_model.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  TextEditingController _amountController = TextEditingController();
  TextEditingController _noteController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isIncome = true;
  CategoryModel? selectedCategory;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.85,
      child:Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Text('Add Transaction', style: Theme.of(context).textTheme.titleLarge)),

                SizedBox(height: 20,),

                ExpenseIncomeToggleBar(
                  onChanged: (value) {
                    setState(() {
                      isIncome = value;
                    });
                  },
                ),

                SizedBox(height: 20,),

                Text('Amount'),
                SizedBox(height: 10,),
                CustomTextField(
                    keyboardType: TextInputType.number,
                    controller: _amountController,
                    hintText: 'Enter Amount',
                    prefixIcon: Icons.money,
                    height: 55,
                    width: double.infinity,
                    validator:(value) {
                      if(value == null || value.trim().isEmpty){
                        return 'Please enter amount';
                      }
                      return null;
                    },),

                SizedBox(height: 20,),

                Text('Title'),
                SizedBox(height: 10,),
                CustomTextField(
                    controller: _titleController,
                    hintText: 'Enter Title',
                    prefixIcon: Icons.title_outlined,
                    height: 55,
                    width: double.infinity,
                  validator:(value) {
                    if(value == null || value.trim().isEmpty){
                      return 'Please enter amount';
                    }
                    return null;
                  },),

                SizedBox(height: 10,),

                Text('Category'),
                SizedBox(height: 10,),
                CustomSelectorTile(
                    title: selectedCategory?.name ?? 'Category',
                    leadingIcon: selectedCategory?.icon ?? Icons.category_outlined,
                    trailingIcon: Icons.arrow_forward_ios_outlined,
                    onTap: () async{
                      final result = await Navigator.push<CategoryModel>(context, MaterialPageRoute(builder: (context) => CategoryScreen(isIncome: isIncome)));

                      if(result != null) {
                        setState(() {
                          selectedCategory = result;
                        });
                      }
                    }
                ),

                SizedBox(height: 20,),

                Text('Date'),
                SizedBox(height: 10,),
                CustomSelectorTile(
                    title: selectedDate == null
                    ? 'Select Date'
                    :DateFormat('dd MMM, yyyy'). format(selectedDate!),

                    leadingIcon: Icons.calendar_today_outlined,
                    trailingIcon: Icons.arrow_forward_ios_outlined,
                    onTap: () async {
                      final pickedDate = await showDatePicker(
                          context: context,
                          initialDate:selectedDate ??  DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2035));

                      if(pickedDate != null) {
                        setState(() {
                          selectedDate = pickedDate;
                        });
                      }
                    }
                ),

                SizedBox(height: 20,),

                Text('Note (Optional)'),
                SizedBox(height: 10,),
               CustomTextField(
                   controller: _noteController,
                   maxLines: 4,
                   hintText: 'Write a note...',
                   height: 150,
                   width: double.infinity),

                SizedBox(height: 20,),

                CustomButton(text: 'Save', onPressed: (){
                  if(!_formKey.currentState!.validate()){
                    return;
                  }

                  if(selectedCategory == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select a category')),
                    );
                    return;
                  }

                  if(selectedDate == null){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select a date')),
                    );
                    return;
                  }

                  final transaction = TransactionModel(
                      title: _titleController.text.trim(),
                      date: selectedDate!,
                      amount: double.parse(_amountController.text.trim()),
                      isIncome: isIncome,
                      category: selectedCategory!,
                      note: _noteController.text.trim()

                  );

                 Navigator.pop(context, transaction);


                  _titleController.clear();
                  _amountController.clear();
                  _noteController.clear();

                  setState(() {
                    selectedCategory = null;
                    selectedDate = null;
                  });
                }),

              ],
            ),
          ),
        ),
      ),

    );
  }
  @override
  void dispose() {
    _amountController.dispose();
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }
}


