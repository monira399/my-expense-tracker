import 'package:expense_tracker/utils/app_color.dart';
import 'package:expense_tracker/widgets/custom_confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/profile_model.dart';
import '../provider/auth_provider.dart';
import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title:Text('Profile', style: Theme.of(context).textTheme.titleLarge)),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(.15),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.1),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundColor:
                          AppColors.secondary.withOpacity(.7),
                          child: const Icon(
                            Icons.person_outline,
                            size: 45,
                          ),
                        ),

                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    Text(
                      'Monira Parven',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                    const SizedBox(height: 5),

                    Text(
                      'monir@gmail.com',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),

                    const SizedBox(height: 18),

                    Container(
                      height: 45,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Colors.green
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Icon(Icons.edit, color: Colors.green, ),
                            SizedBox(width: 10,),
                            Text('Edit Profile', style: TextStyle(
                              color: Colors.green
                            ),)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.08),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: profileMenuList.length,
                  separatorBuilder: (_, __) => Divider(
                    height: 1,
                    indent: 72,
                    endIndent: 20,
                    color: AppColors.secondary.withOpacity(.15),
                  ),
                  itemBuilder: (context, index) {
                    final profileMenu = profileMenuList[index];

                    return ListTile(

                      leading: CircleAvatar(
                        radius: 22,
                        backgroundColor: profileMenu.iconColor != null
                       ? profileMenu.iconColor!.withOpacity(0.1)
                        : AppColors.secondary.withOpacity(.1),
                        child: Icon(
                          profileMenu.icon,
                          color:profileMenu.iconColor ?? AppColors.primary,
                          size: 22,
                        ),
                      ),
                      title:
                      Text(
                        profileMenu.title,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: profileMenu.iconColor ?? Colors.black
                        ),
                      ),
                      subtitle:profileMenu.subTitle == null
                      ? null :
                      Text(profileMenu.subTitle!,style: GoogleFonts.poppins(
                        fontSize: 12
                      ),),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                      onTap: () {
                        _onTapProfileMenu(profileMenu);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapProfileMenu(ProfileUserModel profileMenu) {
    if(profileMenu.isLogOut) {
      _showLogoutDialog();
      return;
    }
  }
  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return CustomConfirmationDialog(
            title: 'LogOut',
            message: 'Do you want to logout?',
            confirmText: 'Logout',
            onConfirm: () async {
              await context.read<AuthProvider>().logOut();

              if(!mounted) return;

              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginScreen()), (predicate) => false);
            });
      },
    );
  }
}
