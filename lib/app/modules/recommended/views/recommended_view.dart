import 'package:demo_app/app/strings/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/recommended_controller.dart';

class RecommendedView extends GetView<RecommendedController> {
  final String title;
  final String image;
  const RecommendedView({required this.title, required this.image, super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet."),
                ),
                Container(
                  alignment: Alignment.topRight,
                  height: 100.h,
                  width: 150.w,
                  child: Image.asset(image),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
