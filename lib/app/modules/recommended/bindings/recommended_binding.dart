import 'package:get/get.dart';

import '../controllers/recommended_controller.dart';

class RecommendedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecommendedController>(
      () => RecommendedController(),
    );
  }
}
