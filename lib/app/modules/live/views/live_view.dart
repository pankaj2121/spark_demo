import 'package:demo_app/app/widgets/custom_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/live_controller.dart';

class LiveView extends GetView<LiveController> {
  LiveController _liveController = Get.put(LiveController());

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
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                  width: double.infinity,
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
          SizedBox(
            height: 5.h,
          ),
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              dense: true,
              title: Text(title),
              leading: CircleAvatar(
                radius: 20.r,
                backgroundColor: Colors.amber,
                child: CircleAvatar(
                  radius: 18.r,
                  backgroundImage: AssetImage("assets/pre_read_selected.png"),
                ),
              ),
              children: [
                Text(description),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:8.w),
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(8.w),
                child: TextButton.icon(
                  onPressed: () {
                    _liveController.toggleComments();
                  },
                  label:Obx(()=> Icon(
                    _liveController.isShowing.value ? Icons.arrow_drop_up: Icons.arrow_drop_down,
                    color: Colors.black54,
                  ),),
                  icon: Text(
                    "Comments",
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ),
              IconButton(onPressed: () {

              }, icon: Icon(Icons.sort))
            ],
          ),
          Obx(()=>_liveController.isShowing.value == true?Expanded(
            child: ListView.builder(
                itemCount: _liveController.comments.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(_liveController.comments[index]["comment"]),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.favorite_border,
                                    size: 15.sp,
                                  ))
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(width: 10.w),
                              CircleAvatar(
                                radius: 10.r,
                                backgroundImage: AssetImage("assets/emoji.png"),
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                _liveController.comments[index]["commentedBy"],
                                style: TextStyle(fontSize: 10.sp),
                              ),
                            ],
                          ),
                        ],
                      ));
                }),
          ): Container())

        ],
      ),
    );
  }
}
