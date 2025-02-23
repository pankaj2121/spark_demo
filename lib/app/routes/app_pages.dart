import 'package:get/get.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/live/bindings/live_binding.dart';
import '../modules/live/views/live_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/subjectDetails/bindings/subject_details_binding.dart';
import '../modules/subjectDetails/views/subject_details_view.dart';
import '../modules/subjects/bindings/subjects_binding.dart';
import '../modules/subjects/views/subjects_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static var INITIAL = Routes.ONBOARDING;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.LIVE,
      page: () =>
          LiveView(videoPath: '', title: '', description: '', topic: ''),
      binding: LiveBinding(),
    ),
    GetPage(
      name: _Paths.SUBJECTS,
      page: () => SubjectsView(title: '',
        image: '',),
      binding: SubjectsBinding(),
    ),
    GetPage(
      name: _Paths.SUBJECT_DETAILS,
      page: () => SubjectDetailsView(chapter: '',),
      binding: SubjectDetailsBinding(),
    ),
  ];
}
