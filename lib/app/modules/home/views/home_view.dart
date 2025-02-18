import 'package:demo_app/app/modules/live/views/live_view.dart';
import 'package:demo_app/app/widgets/custom_video_player.dart';
import 'package:flutter/material.dart';
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
        title: const Text(
          'DashBoard',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.search))],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Image.asset("assets/stack_card.png"),
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
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 8.w, bottom: 5.h),
                        child: Card(
                          color: Colors.white,
                          elevation: 5,
                          shadowColor: Colors.amber,
                          child: Padding(
                            padding: EdgeInsets.all(10.w),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/blue_book.png",
                                  height: 80.h,
                                  width: 80.w,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Card(
                                  color: Colors.red[500],
                                  child: Padding(
                                    padding: EdgeInsets.all(5.w),
                                    child: Text(
                                      " Explore ",
                                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                                    ),
                                  ),
                                )
                              ],
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
                                Get.to(LiveView(videoPath: "assets/teachervideo.mp4", title: 'Algebraic Expression', description: 'video description here...', topic: '',));
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
                              Card(
                                color: Colors.black.withOpacity(0.5),
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
                        Expanded(child: Text("Algebraic Expression"))
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),

              SizedBox(
                height: 10.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text("Contact Us",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal:100.w),
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text("email: spark@gmail.com"),
                    Text("youtube: spark@youtube.com"),

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
