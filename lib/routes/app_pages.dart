import 'package:flutter_classroom/modules/home/controller/home_binding.dart';
import 'package:flutter_classroom/modules/home/view/screen_home.dart';
import 'package:flutter_classroom/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.HOME;
  static final List<GetPage> pages = [
    GetPage(
        name: Routes.HOME,
        page: () => const ScreenHome(),
        binding: HomeBinding(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.fadeIn),
  ];
}
