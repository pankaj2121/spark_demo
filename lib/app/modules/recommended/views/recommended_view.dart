import 'package:demo_app/app/strings/app_colors.dart';
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
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: EdgeInsets.all(12.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                      style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600),
                    ),
                  ),
                  Hero(
                    tag: image, // Unique Hero tag
                    child: Image.asset(image, height: 120.h, width: 120.w),
                  ),
                ],
              ),
              ListView.separated(
                  shrinkWrap: true,
                  itemCount: 10,
                  physics: ScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return Divider(
                      indent: 65.w,
                      height: 10.h,
                      color: AppColors.black12,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ListTile(
                      dense: true,
                      leading: CircleAvatar(
                        radius: 22.r,
                        backgroundColor: AppColors.themeColor,
                        child: CircleAvatar(
                          radius: 20.r,
                          backgroundColor: AppColors.white,
                          backgroundImage: AssetImage(image),
                        ),
                      ),
                      trailing: Icon(Icons.arrow_right),
                      title: Text("Chapter ${index + 1}", style: TextStyle(fontWeight: FontWeight.w600),),
                      subtitle: Text("Topics ${index + 1}",style: TextStyle(color: AppColors.black54),),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
