import 'package:demo_app/app/strings/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String userImagePath;
  const CustomDrawer(
      {required this.userName,
      required this.userEmail,
      required this.userImagePath,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: AppColors.white,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                userName,
                style: TextStyle(
                    color: AppColors.black, fontWeight: FontWeight.w600),
              ),
              accountEmail: Text(
                userEmail,
                style: TextStyle(
                    color: AppColors.black),
              ),
              currentAccountPicture: CircleAvatar(
                radius: 32.r,
                backgroundColor: AppColors.white,
                child: CircleAvatar(
                  radius: 30.r,
                  backgroundImage: AssetImage(userImagePath),
                ),
              ),
              decoration: BoxDecoration(
                color: AppColors.appBarColor, // Change the color here
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.widgets_outlined,
                      color: AppColors.themeDarkColor,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 12.sp,
                    ),
                    title: const Text('App Usage'),
                    onTap: () {
                      Get.back();
                    },
                  ),
                  Divider(thickness: 0.5,),
                  ListTile(
                    leading: const Icon(
                      Icons.contact_support_outlined,
                      color: AppColors.themeDarkColor,
                    ),
                    trailing: Icon(
                      Icons.open_in_new,
                      size: 14.sp,
                    ),
                    title: const Text('Support'),
                    onTap: () {
                      Get.back();
                    },
                  ),
                  Divider(thickness: 0.5,),
                  ListTile(
                    leading: Icon(Icons.edit_note_sharp,
                        color: AppColors.themeDarkColor),
                    trailing: Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 12.sp,
                    ),
                    title: const Text('Terms & Conditions'),
                    onTap: () {
                      Get.back();
                    },
                  ),
                  Divider(thickness: 0.5,),
                  ListTile(
                    leading: const Icon(Icons.star_border,
                        color: AppColors.themeDarkColor),
                    trailing: Icon(
                      Icons.open_in_new,
                      size: 14.sp,
                    ),
                    title: const Text('Rate Us'),
                    onTap: () {
                      Get.back();
                    },
                  ),
                  Divider(thickness: 0.5,),
                  ListTile(
                    leading: const Icon(Icons.info_outline,
                        color: AppColors.themeDarkColor),
                    trailing: Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 12.sp,
                    ),
                    title: const Text('About'),
                    onTap: () {
                      Get.back();
                      // Get.off(IntroScreen());
                    },
                  ),
                  Spacer(),
                  Divider(thickness: 0.5,),
                  ListTile(
                    leading: const Icon(Icons.logout_outlined,
                        color: AppColors.themeDarkColor),
                    title: const Text('Sign Out'),
                    onTap: () {
                      Get.back();
                      // Get.dialog(
                      //   CustomDialog(
                      //     onPressed: () {
                      //       _loginController.signOut();
                      //       Get.offAll(LoginView());
                      //       Fluttertoast.showToast(msg: "User Logged out Successfuly!");
                      //     },
                      //     title: 'Sign Out',
                      //     content: "Are you sure want to sign out?",
                      //   ),
                      // );
                    },
                  ),
                  SizedBox(height: 25.h,)
                ],
              ),
            )
          ],
        ));
  }
}
