import 'package:demo_app/app/modules/live/views/live_view.dart';
import 'package:demo_app/app/modules/recommended/views/recommended_view.dart';
import 'package:demo_app/app/strings/image_path.dart';
import 'package:demo_app/app/widgets/custom_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController _homeController = Get.put(HomeController());

  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.person_2_rounded,
            color: Colors.black54,
          ),
        ),
        title:
            Image.asset("assets/sparkl_logo.png", width: 100.w, height: 25.h),
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
                    itemCount: 10,
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
                                  Border.all(color: Colors.amber, width: 2)),
                          child: Padding(
                            padding: EdgeInsets.all(5.w),
                            child: CircleAvatar(
                              radius: 30.r,
                              backgroundImage: AssetImage(
                                index % 2 == 0
                                    ? "assets/pre_read_selected.png"
                                    : index % 3 == 0
                                        ? "assets/blue_book.png"
                                        : "assets/emoji.png",
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
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: InkWell(
                              onTap: () {
                                _homeController.togglePlayButton();
                                print(_homeController.isPlaying);
                                Get.to(LiveView(
                                  videoPath: "assets/teachervideo.mp4",
                                  title: 'Algebraic Expression',
                                  description: 'video description here...',
                                  topic: '',
                                ));
                              },
                              child: CustomVideoPlayer(
                                videoPath: "assets/teachervideo.mp4",
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
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(5.r)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 4.h),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        size: 10.sp,
                                        color: Colors.green,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        "Live",
                                        style: TextStyle(color: Colors.white),
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
                                AssetImage("assets/pre_read_selected.png"),
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
                            color: Colors.white,
                            elevation: 5,
                            shadowColor: Colors.amber,
                            child: Padding(
                              padding: EdgeInsets.all(10.w),
                              child: Column(
                                children: [
                                  Image.asset(
                                    _homeController.booksInfo[index]["image"],
                                    height: 80.h,
                                    width: 80.w,
                                  ),
                                  ConstrainedBox(
                                    // width: 120.w,
                                    constraints:
                                        BoxConstraints(minWidth: 110.w),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colors.orange, // Button color
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              5.r), // Rounded corners
                                        ),
                                        elevation: 2, // Shadow effect
                                      ),
                                      onPressed: () {
                                        Get.to(RecommendedView(
                                          title: _homeController.booksInfo[index]["title"],
                                          image: _homeController.booksInfo[index]["image"],
                                        ));
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(5.w),
                                        child: Text(
                                          _homeController.booksInfo[index]
                                              ["title"],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.sp),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  )
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
                    "assets/stack_card.png",
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
                      height: 10.h,
                    ),
                    // Text("email: spark@gmail.com"),
                    // Text("youtube: spark@youtube.com"),

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
