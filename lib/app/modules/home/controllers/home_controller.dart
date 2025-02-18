import 'package:get/get.dart';

class HomeController extends GetxController {

  RxBool isPlaying = false.obs; // Reactive boolean variable

  togglePlayButton() {
    isPlaying.value = !isPlaying.value;
  }
}
