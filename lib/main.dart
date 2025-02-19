import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'app/modules/onboarding/controllers/onboarding_controller.dart';
import 'app/routes/app_pages.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Transparent status bar
      statusBarIconBrightness:
          Brightness.dark, // Dark icons for light background
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>with WidgetsBindingObserver {
  final OnboardingController _onBoardController =
      Get.put(OnboardingController());

  //todo
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addObserver(this); // Observe app lifecycle changes
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     _onBoardController.requestCameraPermission();
  //   });
  // }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      // App is back in the foreground, check permission again
      PermissionStatus status = await Permission.camera.status;
      if (status.isGranted && !_onBoardController.isPermissionGranted.value) {
        _onBoardController.isPermissionGranted.value = true;
        await _onBoardController.initializeCamera();
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
          375, 812), // Set base design size (adjust as per your UI design)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Application",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            // scaffoldBackgroundColor: Colors.yellow.shade50,
            fontFamily: "Poppins",
            appBarTheme: AppBarTheme(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              titleTextStyle: TextStyle(
                fontSize: 18.sp,
                  fontWeight: FontWeight.w600, color: Colors.black)
            )
          ),
        );
      },
    );
  }
}
