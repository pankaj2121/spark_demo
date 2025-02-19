import 'package:get/get.dart';

class LiveController extends GetxController {

  RxBool isPlaying = false.obs; // Reactive boolean variable
  RxBool isShowing = true.obs; // Reactive boolean variable

  togglePlayButton() {
    isPlaying.value = !isPlaying.value;
  }
  toggleComments() {
    isShowing.value = !isShowing.value;
  }

  List<Map<String, dynamic>> comments = [
    {
      "comment": "Thank yoy sir.",
      "commentedBy" : "Saurav verma "
    },
    {
      "comment": "very good",
      "commentedBy" : "Himenat chaurashiya "
    },  {
      "comment": "Well taught sir, i really liked it.",
      "commentedBy" : "Ashutosh verma "
    },  {
      "comment": "excellent",
      "commentedBy" : "Alice parker"
    },  {
      "comment": "Concept cleared now.",
      "commentedBy" : "Saurav verma "
    },  {
      "comment": "Now understood the concept.",
      "commentedBy" : "Saurav verma "
    },
  ];

}
