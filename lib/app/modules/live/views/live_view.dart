import 'package:demo_app/app/strings/app_colors.dart';
import 'package:demo_app/app/strings/image_path.dart';
import 'package:demo_app/app/widgets/custom_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/live_controller.dart';

class LiveView extends GetView<LiveController> {
  final LiveController _liveController = Get.put(LiveController());
  final TextEditingController _controller = TextEditingController();

  final String videoPath;
  final String title;
  final String description;
  final String topic;
  LiveView(
      {required this.videoPath,
      required this.title,
      required this.description,
      required this.topic,
      super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                  width: double.infinity,
                  height: 180.h,
                  child:
                      // Obx(() => _liveController.isPlaying.value == false
                      //     ? CustomVideoPlayer(
                      //         videoPath: videoPath,
                      //         isCircular: false,
                      //         isPlaying: false,
                      //       )
                      //     :
                      CustomVideoPlayer(
                    videoPath: videoPath,
                    isCircular: false,
                    isPlaying: true,
                    // )
                  )),
              Positioned(
                top: 0,
                right: 5.w,
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.group,
                        color: Colors.black54,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text("250")
                    ],
                  ),
                ),
              ),
              // Center(
              //     child: IconButton(
              //   onPressed: () {
              //     _liveController.togglePlayButton();
              //     print(_liveController.isPlaying.value);
              //   },
              //   icon: Icon(
              //     Icons.play_circle,
              //     size: 40.sp,
              //   ),
              // ))
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(8.w,8.h, 8.w,8.h),
              child: Column(
                children: [
                  Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      dense: true,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(title),
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.bookmark_border))
                        ],
                      ),
                      leading: CircleAvatar(
                        radius: 18.r,
                        backgroundColor: Colors.amber,
                        child: CircleAvatar(
                          radius: 16.r,
                          backgroundImage: AssetImage(ImagePath.preReadSelected),
                        ),
                      ),
                      children: [
                        Text(description),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(5.r), // Rounded corners
                          ),
                          elevation: 2, // Shadow effect
                        ),
                        onPressed: () {
                          _liveController.toggleComments();
                        },
                        label: Obx(
                          () => Icon(
                            _liveController.isShowing.value
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                            color: Colors.black54,
                          ),
                        ),
                        icon: Text(
                          "Comments",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.filter_list))
                    ],
                  ),
                  Obx(() => _liveController.isShowing.value == true
                      ? Expanded(
                          child: ListView.builder(
                              itemCount: _liveController.comments.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  dense: true,
                                  leading: CircleAvatar(
                                    radius: 8.r,
                                    backgroundImage:
                                        AssetImage(ImagePath.emoji),
                                  ),
                                  title: RichText(
                                    text: TextSpan(
                                      text:
                                          "@${_liveController.comments[index]["commentedBy"]}",
                                      style: TextStyle(
                                          fontSize: 10.sp, color: Colors.black54),
                                      children: [
                                        TextSpan(
                                          text: '. ',
                                        ),
                                        TextSpan(
                                          text: '2h ago',
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              color: Colors.black54),
                                        ),
                                      ],
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _liveController.comments[index]
                                            ["comment"],
                                        style: TextStyle(fontSize: 11.sp),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.thumb_up_alt_outlined,
                                                size: 12.sp,
                                              )),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.thumb_down_alt_outlined,
                                                size: 12.sp,
                                              )),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.insert_comment_outlined,
                                                size: 12.sp,
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.more_vert,
                                        size: 12.sp,
                                      )),
                                );
                              }),
                        )
                      : Container()),
                ],
              ),
            ),
          ),
          // Add Comment TextField at the Bottom
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8.w),
              child: Row(
                children: [
                 CircleAvatar(
                   radius: 16.r,
                   backgroundImage: AssetImage(ImagePath.emoji),),
                  SizedBox(width:10.w),
                  Expanded(
                    child: TextFormField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Add a comment...",
                        hintStyle: TextStyle(fontSize: 12.sp),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: AppColors.black12,
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: AppColors.themeColor),
                    onPressed: () {
                      // Handle send comment action
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
