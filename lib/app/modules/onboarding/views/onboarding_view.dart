import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:demo_app/app/modules/home/views/home_view.dart';
import 'package:demo_app/app/strings/image_path.dart';
import 'package:demo_app/app/widgets/chat_card.dart';
import 'package:demo_app/app/widgets/custom_buttom.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../widgets/custom_video_player.dart';
import '../../../widgets/stepper.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  OnboardingView({super.key});

  final OnboardingController _onBoardController =
      Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => Positioned(
              top: _onBoardController.count == 1
                  ? 100.h
                  : _onBoardController.count == 2
                      ? 250.h
                      : 250.h,
              right: -100.w,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -180.h,
                    right: 180.w,
                    child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,color: Colors.amber.shade100.withOpacity(0.75),
                    ),
                    height :200.h, width:200.w,),),
                  Lottie.asset(
                    'assets/sparkl_shape_shift_lottie.json',
                    height: 300.h,
                    width: 300.w,
                    fit: BoxFit.cover,
                  ),
                  BackdropFilter(
                    // blendMode: BlendMode.overlay,
                    filter: ImageFilter.blur(
                      sigmaX: 500,
                      sigmaY: 500,
                    ),
                    child: Container(
                      color: Colors
                          .transparent, // Maintains visibility of blurred animation
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h),
            child: Column(
              children: [
                Expanded(flex: 1, child: header()),
                Expanded(flex: 2, child: title()),
                Expanded(
                  flex: 7,
                  child: content(context: context),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.sp),
                  child: footer(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget header() {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOutBack,
              left: _onBoardController.count == 1 ? 120.w : 15.w,
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                width: _onBoardController.count == 1 ? 120.w : 100.w,
                height: _onBoardController.count == 1 ? 120.h : 100.h,
                child: Image.asset(ImagePath.sparkLogo),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget title() {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(seconds: 1),
              curve: Curves.easeOutBack,
              left: _onBoardController.count == 1 ? 80.w : 15.w,
              right: _onBoardController.count == 1 ? 15.w : 15.w,
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _onBoardController.count == 1
                          ? _onBoardController.dataInfo[0]['title']
                          : _onBoardController.count == 2
                              ? _onBoardController.dataInfo[1]['title']
                              : _onBoardController.dataInfo[2]['title'],
                      textAlign: _onBoardController.count == 1
                          ? TextAlign.center
                          : TextAlign.left,
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      _onBoardController.count == 1
                          ? _onBoardController.dataInfo[0]['subtitle']
                          : _onBoardController.count == 2
                              ? _onBoardController.dataInfo[1]['subtitle']
                              : _onBoardController.dataInfo[2]['subtitle'],
                      textAlign: _onBoardController.count == 1
                          ? TextAlign.center
                          : TextAlign.left,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black.withOpacity(0.75),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget content({required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.all(15.h),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            // for stack_card -------------------------------------------------
            Obx(() => AnimatedPositioned(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeOutBack,
                  right: _onBoardController.count == 2 ? -2.w : -500,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    width: _onBoardController.count == 2
                        ? 350.w
                        : 0, // Shrink size when moved
                    height: _onBoardController.count == 2 ? 250.h : 0,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                            top: -27.h,
                            child: Image.asset(
                              ImagePath.stackCard,
                              height: 320.h,
                              width: 300.w,
                            )),
                        Positioned(
                            top: -4.h,
                            child: Image.asset(
                              ImagePath.stackCard,
                              height: 320.h,
                              width: 320.w,
                            )),
                        Positioned(
                            top: 22.h,
                            child: Image.asset(
                              ImagePath.stackCard,
                              height: 320.h,
                              width: 350.w,
                            )),
                        Positioned(
                            top: 50.h,
                            child: Image.asset(
                              ImagePath.stackCard,
                              height: 320.h,
                              width: 380.w,
                            ))
                      ],
                    ),
                  ),
                )),
            // for teacherChat1 section -----------------------------------------------
            Obx(() => AnimatedPositioned(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  left: _onBoardController.count == 3 ? 10.w : -500.w,
                  top: _onBoardController.count == 3 ? 40.h : 30.h,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    width: _onBoardController.count == 3
                        ? 250.w
                        : 0, // Shrink size when moved
                    // height: _onBoardController.count == 3 ? 80.h : 0.h,
                    child: ChatCard(
                      sender: "teacher",
                      message:
                          "Do You want to go over how to apply the quadratic formula?",
                    ),
                  ),
                )),
            // for teacher video -----------------------------------------------
            Obx(() => AnimatedPositioned(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  top: _onBoardController.count == 2
                      ? 5.h
                      : _onBoardController.count == 3
                          ? 5.h
                          : -1000.h,
                  left: _onBoardController.count == 2
                      ? 90.w
                      : _onBoardController.count == 3
                          ? 5.0.w
                          : 0,
                  right: _onBoardController.count == 2
                      ? 90.w
                      : _onBoardController.count == 3
                          ? 290.w
                          : 0,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.ease,
                    height: _onBoardController.count == 2
                        ? 90.h
                        : _onBoardController.count == 3
                            ? 50.h
                            : 0,
                    width: _onBoardController.count == 2
                        ? 160.w
                        : _onBoardController.count == 3
                            ? 50.w
                            : 0, // Shrink size when moved
                    child: CustomVideoPlayer(
                      videoPath: ImagePath.teacherVideo,
                      isCircular: _onBoardController.count == 3 ? true : false,
                    ),
                  ),
                )),

            // for studentChat section -----------------------------------------------
            Obx(() => AnimatedPositioned(
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeInOut,
                  right: _onBoardController.count == 3 ? 10.w : -500.w,
                  bottom: _onBoardController.count == 3 ? 180.h : 220.h,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    width: _onBoardController.count == 3
                        ? 250.w
                        : 0, // Shrink size when moved
                    // height: _onBoardController.count == 3 ? 80.h : 0.h,
                    child: Column(
                      children: [
                        ChatCard(
                          sender: "student",
                          message: "Yes, I'm confused about when to use it.",
                        ),
                      ],
                    ),
                  ),
                )),
            // for teacherChat2 section -----------------------------------------------
            Obx(() => AnimatedPositioned(
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeInOut,
                  left: _onBoardController.count == 3 ? 10.w : -500.w,
                  bottom: _onBoardController.count == 3 ? 20.h : 40.h,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeInOut,
                    width: _onBoardController.count == 3
                        ? 250.w
                        : 0, // Shrink size when moved
                    // height: _onBoardController.count == 3 ? 80.h : 0.h,
                    child: ChatCard(
                      sender: "teacher",
                      message:
                          "You use it when the equation is in the form ax2 + bx + c= 0. Let me show you a quick example to clarify",
                    ),
                  ),
                )),
            // for teacher video -----------------------------------------------
            Obx(() => AnimatedPositioned(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  bottom: _onBoardController.count == 3 ? 100.h : 100.h,
                  left: _onBoardController.count == 3 ? 5.w : -100.w,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.ease,
                    height: _onBoardController.count == 3 ? 50.h : 0.h,
                    width: _onBoardController.count == 3
                        ? 50.w
                        : 0, // Shrink size when moved
                    child: CustomVideoPlayer(
                      videoPath:  ImagePath.teacherVideo,
                      isCircular: true,
                    ),
                  ),
                )),

            // for student video -----------------------------------------------
            Obx(() => Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    //for student animation
                    _onBoardController.count == 1
                        ? Lottie.asset('assets/sparkl_shape_shift_lottie.json',
                            height: 360.h, width: 360.w, fit: BoxFit.cover)
                        : Container(),
                    AnimatedPositioned(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                      right: _onBoardController.count == 1
                          ? 58.h
                          : _onBoardController.count == 2
                              ? 130.w
                              : _onBoardController.count == 3
                                  ? 5.0.w
                                  : 0,
                      bottom: _onBoardController.count == 1
                          ? 90.h
                          : _onBoardController.count == 2
                              ? -10.h
                              : _onBoardController.count == 3
                                  ? 220.h
                                  : 0.h,
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut,
                        width: _onBoardController.count == 1
                            ? 230.w
                            : _onBoardController.count == 2
                                ? 80.w
                                : _onBoardController.count == 3
                                    ? 50.w
                                    : 0, // Shrink size when moved
                        height: _onBoardController.count == 1
                            ? 230.h
                            : _onBoardController.count == 2
                                ? 80.h
                                : _onBoardController.count == 3
                                    ? 50.h
                                    : 0,
                        child: _onBoardController.isPermissionGranted == true
                            ? ClipOval(
                                child: _onBoardController.cameraController !=
                                            null &&
                                        _onBoardController.cameraController!
                                            .value.isInitialized
                                    ? CameraPreview(
                                        _onBoardController.cameraController!)
                                    : Center(
                                        child:
                                            CircularProgressIndicator()), // Loading indicator until camera initializes
                              )
                            : CustomVideoPlayer(
                                videoPath:  ImagePath.studentVideo,
                                isCircular: true,
                              ),
                      ),
                    ),
                    _onBoardController.count == 1
                        ? Container(
                            margin: EdgeInsets.all(40.sp),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.amber)),
                          )
                        : Container(),
                    AnimatedPositioned(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut,
                        top: _onBoardController.count == 1 ? 60.h : 70.h,
                        left: _onBoardController.count == 1 ? 60.w : -200.w,
                        child: AnimatedContainer(
                          curve: Curves.ease,
                          duration: Duration(seconds: 1),
                          child: roundedImgBox(
                              imagePath:  ImagePath.blueBook,
                              height: 50.h,
                              width: 50.w),
                        )),
                    AnimatedPositioned(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut,
                        top: _onBoardController.count == 1 ? 200.h : 210.h,
                        left: _onBoardController.count == 1 ? 25.w : -200.w,
                        child: AnimatedContainer(
                          curve: Curves.ease,
                          duration: Duration(seconds: 1),
                          child: roundedImgBox(
                              imagePath:  ImagePath.preReadSelected,
                              height: 30.h,
                              width: 30.w),
                        )),
                    AnimatedPositioned(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut,
                        bottom: _onBoardController.count == 1 ? 80.h : 90.h,
                        left: _onBoardController.count == 1 ? 10.w : -200.w,
                        child: AnimatedContainer(
                          curve: Curves.ease,
                          duration: Duration(seconds: 1),
                          child: roundedBox(
                            text: "Doubt Clarification",
                          ),
                        )),
                    AnimatedPositioned(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut,
                        top: _onBoardController.count == 1 ? 110.h : 110.h,
                        right: _onBoardController.count == 1 ? 5.w : -200.w,
                        child: AnimatedContainer(
                          curve: Curves.ease,
                          duration: Duration(seconds: 1),
                          child: roundedBox(
                            text: "Holistic Well-Being",
                          ),
                        )),
                    AnimatedPositioned(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut,
                        bottom: _onBoardController.count == 1 ? 130.h : 130.h,
                        right: _onBoardController.count == 1 ? 5.w : -200.w,
                        child: AnimatedContainer(
                          curve: Curves.ease,
                          duration: Duration(seconds: 1),
                          child: roundedBox(
                            text: "Personalised",
                          ),
                        )),
                    AnimatedPositioned(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut,
                        bottom: _onBoardController.count == 1 ? 0.h : 5.h,
                        right: _onBoardController.count == 1 ? 60.w : -200.w,
                        child: AnimatedContainer(
                          curve: Curves.ease,
                          duration: Duration(seconds: 1),
                          child: roundedImgBox(
                              imagePath:  ImagePath.emoji,
                              height: 40.h,
                              width: 40.w),
                        )),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget footer(context) {
    return Obx(() => Row(
          children: [
            InkWell(
              child: _onBoardController.count > 1
                  ? CircularStepper(progress: _onBoardController.progress.value)
                  : Container(),
              onTap: () {
                _onBoardController.decrement();
                _onBoardController.decrementProgress();
              },
            ),
            Expanded(
              child: CustomButton(
                onPressed: () {
                  if (_onBoardController.count < 3) {
                    _onBoardController.increment();
                    _onBoardController.incrementProgress();
                  }else{
                    Get.offAll(HomeView());
                  }
                },
                title: _onBoardController.count < 3 ? "Next" : "Get Started",
              ),
            ),
          ],
        ));
  }
}

Widget roundedBox({required String text}) {
  return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(30),
      color: Colors.amber,
      dashPattern: [5, 3],
      strokeWidth: 2,
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(50.r)),
          child: Padding(
            padding: EdgeInsets.all(10.sp),
            child: Text(
              text,
              style: TextStyle(
                  fontFamily: "kalam",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold),
            ),
          )));
}

Widget roundedImgBox(
    {required String imagePath,
    required double? height,
    required double? width}) {
  return DottedBorder(
    borderType: BorderType.Circle,
    color: Colors.amber,
    dashPattern: [5, 3],
    strokeWidth: 2,
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(50.r)),
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Image.asset(
          imagePath,
          height: height,
          width: width,
        ),
      ),
    ),
  );
}
