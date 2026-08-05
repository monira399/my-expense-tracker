import 'package:expense_tracker/models/category_model.dart';
import 'package:expense_tracker/utils/app_color.dart';
import 'package:expense_tracker/widgets/custom_button.dart';
import 'package:expense_tracker/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/data/category_icons.dart';

class CategoryScreen extends StatefulWidget {
  final bool isIncome;

  const CategoryScreen({super.key, required this.isIncome});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController controller = TextEditingController();
  IconData? selectedIcon;
  Color selectedColor = AppColors.primary;

  @override
  Widget build(BuildContext context) {
    final icons = widget.isIncome ? incomeIcons : expenseIcons;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Add Category',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Category Name',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 10),
            CustomTextField(
              controller: controller,
              hintText: 'Enter category name',
              prefixIcon: Icons.category,
              height: 55,
              width: double.infinity,
            ),
            SizedBox(height: 20),

            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: icons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final icon = icons[index];

                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIcon = icon;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedIcon == icon
                            ? AppColors.primary.withOpacity(0.1)
                            : AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selectedIcon == icon
                              ? AppColors.primary
                              : Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        icon,
                        size: 30,
                        color: selectedIcon == icon
                            ? AppColors.primary
                            : Colors.grey,
                      ),
                    ),
                  );
                },
              ),
            ),

            CustomButton(text: 'Save', onPressed: (){
              if(controller.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please enter category name'),
                  ),
                );
                return;
              }
              if(selectedIcon == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please select an Icon'))
                );
                return;
              }

              final category = CategoryModel(
                  name: controller.text.trim(),
                  icon: selectedIcon!,
                  color: selectedColor ,
                  isIncome: widget.isIncome
              );

              Navigator.pop(context, category);
            })
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

}
