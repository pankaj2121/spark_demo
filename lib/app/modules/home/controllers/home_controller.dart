import 'package:demo_app/app/strings/image_path.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  RxBool isPlaying = false.obs; // Reactive boolean variable

  togglePlayButton() {
    isPlaying.value = !isPlaying.value;
  }
  List<Map<String, dynamic>> booksInfo = [
    {
      "title": "Blue Moon",
      "image": ImagePath.blueBook
    },
    {
      "title": "Pre-Exam",
      "image": ImagePath.preReadSelected
    },
    {
      "title": "Texture",
      "image": ImagePath.book1
    },
    {
      "title": "Novel",
      "image": ImagePath.book2
    },{
      "title": "Comics",
      "image": ImagePath.book3
    }
  ];
}
