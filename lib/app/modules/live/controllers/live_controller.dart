import 'package:demo_app/app/strings/image_path.dart';
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
      "comment": "Thank you sir.",
      "commentedBy": "Saurav verma",
      "userImage": ImagePath.blueBook,
    },
    {
      "comment": "very good",
      "commentedBy": "Himenat chaurashiya",
      "userImage": ImagePath.emoji,
    },
    {
      "comment": "Well taught sir, i really liked it.",
      "commentedBy": "Ashutosh verma",
      "userImage": ImagePath.book3,
    },
    {
      "comment": "excellent",
      "commentedBy": "Alice parker",
      "userImage": ImagePath.book2,
    },
    {
      "comment": "Concept cleared now.",
      "commentedBy": "Saurav verma",
      "userImage": ImagePath.book1,
    },
    {
      "comment": "Now understood the concept.",
      "commentedBy": "Saurav verma",
      "userImage": ImagePath.preReadSelected,
    },
  ];
}
