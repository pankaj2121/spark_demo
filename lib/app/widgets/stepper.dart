import 'package:demo_app/app/strings/app_colors.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularStepper extends StatelessWidget {
  final double progress; // Progress value (0.0 to 1.0)

  const CircularStepper({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: 10.w),
      child: SizedBox(
        width: 45.w, // Adjust size as needed
        height: 45.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: Size(45.w, 45.h),
              painter: StepperPainter(progress),
            ),
             Icon(Icons.arrow_back, size: 22.sp, color: AppColors.black), // Center icon
          ],
        ),
      ),
    );
  }
}

class StepperPainter extends CustomPainter {
  final double progress;

  StepperPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 5;
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    Paint backgroundPaint = Paint()
      ..color = AppColors.black12 // Light background color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.square;

    Paint progressPaint = Paint()
      ..color = AppColors.themeColor // Progress color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.square;

    double startAngle = -pi / 2; // Start from top
    double sweepAngle = 2 * pi / 3; // Each step is 120° (π/1.5 radians)

    // Draw background segmented circle (3 segments)
    for (int i = 0; i < 3; i++) {
      canvas.drawArc(rect, startAngle + (i * sweepAngle), sweepAngle - 0.25, false, backgroundPaint);
    }
    // Draw progress segmented arc (fill completed steps)
    for (int i = 0; i < (progress * 3).floor(); i++) {
      canvas.drawArc(rect, startAngle + (i * sweepAngle), sweepAngle - 0.25, false, progressPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
