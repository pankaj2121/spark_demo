import 'package:demo_app/app/modules/subjectDetails/views/subject_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../strings/app_colors.dart';
import '../controllers/subjects_controller.dart';

class SubjectsView extends GetView<SubjectsController> {
  final String title;
  final String image;
  const SubjectsView({required this.title, required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.all(12.w),
              child: Row(
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
            ),
            Padding(
              padding:  EdgeInsets.all(12.w),
              child: ListView.separated(
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
                    String allIndices = List.generate(index +2, (i) => i.toString()).join(", ");
                    return ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
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
                      subtitle: Text("Topics: ${allIndices }",style: TextStyle(color: AppColors.black54),),
                      onTap: (){
                        Get.to(SubjectDetailsView(chapter:"Chapter ${index + 1}" ));
                      },
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}