import 'package:expense_tracker/models/category_model.dart';
import 'package:expense_tracker/provider/category_provider.dart';
import 'package:expense_tracker/screens/add_category_screen.dart';
import 'package:expense_tracker/utils/app_color.dart';
import 'package:expense_tracker/widgets/custom_confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../utils/app_snackbar.dart';

class CategoriesListScreen extends StatefulWidget {
  final bool isIncome;
  const CategoriesListScreen({super.key, required this.isIncome});

  @override
  State<CategoriesListScreen> createState() => _CategoriesListScreenState();
}

class _CategoriesListScreenState extends State<CategoriesListScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask((){
      context.read<CategoryProvider>().getCategories();
    });
  }
  @override
  Widget build(BuildContext context) {
    final categoryList = context
        .watch<CategoryProvider>()
        .categories
        .where((category) => category.isIncome == widget.isIncome)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        actions: [
          IconButton(
            onPressed: () async {
              final result = await Navigator.push<CategoryModel>(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AddCategoryScreen(isIncome: widget.isIncome),
                ),
              );

              if (result != null) {
                await context.read<CategoryProvider>().addCategory(result);
              }
            },
            icon: Icon(Icons.add, size: 25, color: AppColors.primary),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
            SearchBar(
            hintText: 'Search categories...',
            hintStyle: WidgetStatePropertyAll(
              GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),

            leading: const Icon(
              Icons.search_rounded,
              size: 22,
            ),

            trailing: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.tune_rounded,
                ),
              ),
            ],

            elevation: const WidgetStatePropertyAll(0),

            backgroundColor: WidgetStatePropertyAll(
              AppColors.white,
            ),

            surfaceTintColor: const WidgetStatePropertyAll(
              Colors.transparent,
            ),

            shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
              if (states.contains(WidgetState.focused)) {
                return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: BorderSide(
                    color: AppColors.primary,
                    width: 1.5,
                  ),
                );
              }

              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
              );
            }),

            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 16),
            ),

            textStyle: WidgetStatePropertyAll(
              GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

              SizedBox(height: 20),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  final category = categoryList[index];

                  return ListTile(
                    onTap: (){
                      Navigator.pop(context, category);
                    },
                    leading: Icon(category.icon, color: category.color,),
                    title: Text(category.name),
                    subtitle: Text(category.isIncome ? 'Income' : 'Expense'),
                    trailing:PopupMenuButton<String>(
                        icon: const Icon(Icons.more_vert),

                        onSelected: (value) async {

                          //============== Edit =============//
                          if(value == 'edit'){
                            final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => AddCategoryScreen(isIncome: widget.isIncome,
                              category: category, )));

                            if(result == true && context.mounted) {
                              showAppSnackBar(context: context, message: 'Category updated successfully');
                            }
                          }

                          //============== Delete =============//
                          if(value == 'delete') {
                            showDialog(
                                context: context,
                                builder: (context){
                              return  CustomConfirmationDialog(
                                  title: 'Delete',
                                  message: 'Do you want to delete ${category.name}',
                                  confirmText: 'Delete',
                                  confirmTextBackgroundColor: Colors.red.withOpacity(0.15),
                                  confirmTextColor: Colors.red,
                                  onConfirm: () async {
                                    await context.read<CategoryProvider>().deleteCategory(category.id);
                                  });
                            });

                          }
                        },
                        itemBuilder: (context) => const [
                          PopupMenuItem(
                              value: 'edit',
                              child: Text('Edit'),
                          ),

                          PopupMenuItem(
                              value: 'delete',
                              child: Text('Delete'))
                        ]),
                  );
                },

                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 1,
                    height: 10,
                    indent: 70,
                    endIndent: 16,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
