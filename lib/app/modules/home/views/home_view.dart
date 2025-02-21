import 'package:demo_app/app/modules/live/views/live_view.dart';
import 'package:demo_app/app/modules/recommended/views/recommended_view.dart';
import 'package:demo_app/app/strings/app_colors.dart';
import 'package:demo_app/app/strings/image_path.dart';
import 'package:demo_app/app/widgets/custom_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_drawer.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController _homeController = Get.put(HomeController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(userName: 'John',userEmail: "john@gmail.com",userImagePath: ImagePath.blueBook,),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: CircleAvatar(
            radius: 20.r,backgroundColor: AppColors.white,
            child: CircleAvatar(
              radius: 16.r,
              backgroundImage: AssetImage(ImagePath.blueBook),
            ),
          ),
        ),
        title:
            Image.asset(ImagePath.sparklLogo, width: 100.w, height: 25.h),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100.h,
                child: ListView.builder(
                    itemCount: _homeController.booksInfo.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.only(top: 12.h, left: 8.w, bottom: 5.h),
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: AppColors.themeColor, width: 2)),
                          child: Padding(
                            padding: EdgeInsets.all(5.w),
                            child: CircleAvatar(
                              radius: 25.r,
                              backgroundImage: AssetImage(
                                  _homeController.booksInfo[index]['image']
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Icon(Icons.share_location_sharp),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                              child: Text(
                            "Streaming",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )),
                        ],
                      ),
                    ),
                    Icon(Icons.more_vert)
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 180.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColors.black87,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: InkWell(
                              onTap: () {
                                _homeController.togglePlayButton();
                                // print(_homeController.isPlaying);
                                Get.to(LiveView(
                                  videoPath: ImagePath.teacherVideo,
                                  title: 'Algebraic Expression',
                                  description: 'video description here...',
                                  topic: '',
                                ));
                              },
                              child: CustomVideoPlayer(
                                videoPath: ImagePath.teacherVideo,
                                isCircular: false,
                                isPlaying: true,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.w),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Algebraic Expression",
                                  style: TextStyle(color: AppColors.white),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: AppColors.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(5.r)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 4.h),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        size: 10.sp,
                                        color: AppColors.green,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        "Live",
                                        style: TextStyle(color: AppColors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage(ImagePath.preReadSelected),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(child: Text("Algebraic Expression")),
                        SizedBox(
                          width: 10.w,
                        ),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.more_vert))
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Icon(Icons.edit_note_outlined),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                              child: Text(
                            "Recommended",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )),
                        ],
                      ),
                    ),
                    Icon(Icons.navigate_next)
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 160.h,
                child: ListView.builder(
                    itemCount: _homeController.booksInfo.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 8.w, bottom: 5.h),
                        child: GestureDetector(
                          onTap: (){
                            Get.to(RecommendedView(
                              title: _homeController.booksInfo[index]["title"],
                              image: _homeController.booksInfo[index]["image"],
                            ));
                          },
                          child: Card(
                            color:AppColors.white,
                            elevation: 5,
                            shadowColor: AppColors.themeColor,
                            child: Padding(
                              padding: EdgeInsets.all(10.w),
                              child: Column(
                                children: [
                                  Hero(
                                    tag: _homeController.booksInfo[index]["image"],
                                    child: Image.asset(
                                      _homeController.booksInfo[index]["image"],
                                      height: 80.h,
                                      width: 80.w,
                                    ),
                                  ),
                                   SizedBox(height: 10.h,),
                                   Container(
                                     width: 100.w,
                                     decoration: BoxDecoration(
                                       color: AppColors.themeColor,
                                       borderRadius: BorderRadius.circular(5.r)
                                     ),
                                     child: Padding(
                                          padding: EdgeInsets.all(5.w),
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            _homeController.booksInfo[index]
                                                ["title"],
                                            style: TextStyle(
                                                // color: AppColors.white,
                                                fontSize: 12.sp),
                                          ),
                                        ),
                                   ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  children: [
                    Icon(Icons.share_location_sharp),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                        child: Text(
                      "Daily Updates",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 300.h,
                width: double.infinity,
                child: CardSwiper(
                  cardsCount: 5,
                  allowedSwipeDirection: AllowedSwipeDirection.all(),
                  cardBuilder:
                      (context, index, percentThresholdX, percentThresholdY) =>
                          Image.asset(
                              ImagePath.stackCard,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      "Contact Us",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 150.w),
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    // Text("email: spark@gmail.com"),

                    OverflowBar(
                      spacing: 30.w,
                      alignment: MainAxisAlignment
                          .center, // Align buttons in the center
                      children: [
                        InkWell(
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 20.r,
                                backgroundImage: AssetImage(ImagePath.whatsapp),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                "whatsApp",
                                style: TextStyle(fontSize: 12.sp),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 18.r,
                                backgroundImage: AssetImage(ImagePath.youtube),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                "Youtube",
                                style: TextStyle(fontSize: 12.sp),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 18.r,
                                backgroundImage:
                                    AssetImage(ImagePath.instagram),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                "Instagram",
                                style: TextStyle(fontSize: 12.sp),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
