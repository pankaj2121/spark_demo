import 'package:get/get.dart';

class LiveController extends GetxController {

  RxBool isPlaying = false.obs; // Reactive boolean variable
  RxBool isShowing = false.obs; // Reactive boolean variable

  togglePlayButton() {
    isPlaying.value = !isPlaying.value;
  }
  toggleComments() {
    isShowing.value = !isShowing.value;
  }

  List<Map<String, dynamic>> comments = [
    {
      "comment": "Good.",
      "commentedBy" : "Saurav verma "
    },
    {
      "comment": "very good",
      "commentedBy" : "Himenat chaurashiya "
    },  {
      "comment": "understood",
      "commentedBy" : "Ashutosh verma "
    },  {
      "comment": "excellent",
      "commentedBy" : "Alice parker"
    },  {
      "comment": "Concept cleared now.",
      "commentedBy" : "Saurav verma "
    },  {
      "comment": "Nice.",
      "commentedBy" : "Saurav verma "
    },
  ];

}
