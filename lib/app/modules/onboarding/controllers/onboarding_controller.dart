import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:camera/camera.dart';

class OnboardingController extends GetxController {

  final count = 1.obs;
  final progress = (1/3).obs;
  RxBool isPermissionGranted = false.obs;
  CameraController? cameraController;
  late List<CameraDescription> cameras;

  void increment() => count.value++;
  void decrement() => count.value--;

  void incrementProgress() => progress + (1/3);
  void decrementProgress() => progress - (1/3);

  //camera permission-----------------------------------------
  Future<void> requestCameraPermission() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      await initializeCamera(); // Wait for camera to initialize
      isPermissionGranted.value = true; // Update after camera is ready
    } else if (status.isDenied) {
      isPermissionGranted.value = false;
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      cameraController = CameraController(cameras[1], ResolutionPreset.medium);
      await cameraController!.initialize();
    }
  }


  final List<Map<String, dynamic>> dataInfo = [
    {
      "title": "Learning Made \nPersonal",
      "subtitle": "A Program designed just for YOU!"
    },
    {
      "title": "1-on-1 Live Classes",
      "subtitle": "Learning customized for every student"
    },
    {"title": "Doubt Resolution \nwith Teachers", "subtitle": ""}
  ];

}
