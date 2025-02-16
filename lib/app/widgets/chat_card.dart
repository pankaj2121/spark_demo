import 'package:demo_app/app/widgets/custom_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class ChatCard extends StatelessWidget {
  final String sender;
  final String message;
  const ChatCard({required this.sender, required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return sender == "student" ?Stack(
      clipBehavior: Clip.none,
      children: [
        Stack(
          children: [
            BubbleSpecialThree(
              text: this.message,
              tail: true,
              color: Colors.black12,
              isSender: true,
              textStyle: TextStyle(fontSize: 14.35.sp),
            ),
            BubbleSpecialThree(
              text: this.message,
              tail: true,
              color: Colors.white,
              isSender: true,
              textStyle: TextStyle(fontSize: 14.sp),
            ),
          ],
        ),
      ],
    ): Stack(
      clipBehavior: Clip.none,
      children: [
        Stack(
          children: [
            BubbleSpecialThree(
              text: message,
              tail: true,
              color: Colors.black12,
              isSender: false,
              textStyle: TextStyle(fontSize: 14.sp),
            ),
            BubbleSpecialThree(
              text: message,
              tail: true,
              color: Colors.amber.shade200,
              isSender: false,
              textStyle: TextStyle(fontSize: 14.sp),
            ),
          ],
        ),
      ],
    );
  }
}
