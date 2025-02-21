import 'package:demo_app/app/strings/app_colors.dart';
import 'package:demo_app/app/widgets/stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../modules/onboarding/controllers/onboarding_controller.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final String? title;
  const CustomButton({required this.onPressed, required this.title, super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  final OnboardingController _onBoardController =
      Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.btnThemeColor,
        minimumSize: Size(double.infinity, 45.sp),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      onPressed: widget.onPressed,
      child: Text(
        widget.title ?? "",
        style:
            TextStyle(color: AppColors.black, fontWeight: FontWeight.w500),
      ),
    );
  }
}
