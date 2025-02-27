import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/subject_details_controller.dart';
import 'package:easy_stepper/easy_stepper.dart';

class SubjectDetailsView extends GetView<SubjectDetailsController> {
  final String chapter;
  SubjectDetailsView({required this.chapter, super.key});

  int activeStep = 0;
  int activeStep2 = 0;
  int reachedStep = 0;
  int upperBound = 5;
  double progress = 0.2;
  double lineLength = 10;
  Set<int> reachedSteps = <int>{0, 2, 4, 5};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chapter),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("data"),
      ),
      // body: EasyStepper(
      //   activeStep: activeStep,
      //   lineStyle: const LineStyle(
      //     lineLength: 50,
      //     lineType: LineType.normal,
      //     lineThickness: 3,
      //     lineSpace: 1,
      //     lineWidth: 10,
      //     unreachedLineType: LineType.dashed,
      //   ),
      //   stepShape: StepShape.rRectangle,
      //   stepBorderRadius: 15,
      //   borderThickness: 2,
      //   internalPadding: 10,
      //   padding: const EdgeInsetsDirectional.symmetric(
      //     horizontal: 30,
      //     vertical: 20,
      //   ),
      //   stepRadius: 28,
      //   finishedStepBorderColor: Colors.deepOrange,
      //   finishedStepTextColor: Colors.deepOrange,
      //   finishedStepBackgroundColor: Colors.deepOrange,
      //   activeStepIconColor: Colors.deepOrange,
      //   showLoadingAnimation: false,
      //   direction: Axis.vertical,
      //   steps: [
      //     EasyStep(
      //       customStep: ClipRRect(
      //         borderRadius: BorderRadius.circular(15),
      //         child: Opacity(
      //           opacity: activeStep >= 0 ? 1 : 0.3,
      //           child: Image.asset('assets/1.png'),
      //         ),
      //       ),
      //       customTitle: const Text(
      //         'Dash 1',
      //         textAlign: TextAlign.center,
      //       ),
      //     ),
      //     EasyStep(
      //       customStep: ClipRRect(
      //         borderRadius: BorderRadius.circular(15),
      //         child: Opacity(
      //           opacity: activeStep >= 1 ? 1 : 0.3,
      //           child: Image.asset('assets/2.png'),
      //         ),
      //       ),
      //       customTitle: const Text(
      //         'Dash 2',
      //         textAlign: TextAlign.center,
      //       ),
      //     ),
      //     EasyStep(
      //       customStep: ClipRRect(
      //         borderRadius: BorderRadius.circular(15),
      //         child: Opacity(
      //           opacity: activeStep >= 2 ? 1 : 0.3,
      //           child: Image.asset('assets/3.png'),
      //         ),
      //       ),
      //       customTitle: const Text(
      //         'Dash 3',
      //         textAlign: TextAlign.center,
      //       ),
      //     ),
      //     EasyStep(
      //       customStep: ClipRRect(
      //         borderRadius: BorderRadius.circular(15),
      //         child: Opacity(
      //           opacity: activeStep >= 3 ? 1 : 0.3,
      //           child: Image.asset('assets/4.png'),
      //         ),
      //       ),
      //       customTitle: const Text(
      //         'Dash 4',
      //         textAlign: TextAlign.center,
      //       ),
      //     ),
      //     EasyStep(
      //       customStep: ClipRRect(
      //         borderRadius: BorderRadius.circular(15),
      //         child: Opacity(
      //           opacity: activeStep >= 4 ? 1 : 0.3,
      //           child: Image.asset('assets/5.png'),
      //         ),
      //       ),
      //       customTitle: const Text(
      //         'Dash 5',
      //         textAlign: TextAlign.center,
      //       ),
      //     ),
      //   ],
      //   // onStepReached: (index) => setState(() => activeStep = index),
      // ),
    );
  }
}
