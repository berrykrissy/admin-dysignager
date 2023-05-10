import 'package:get/get.dart';
import 'package:signage/bindings/dashboard_binding.dart';
import 'package:signage/bindings/splash_binding.dart';
import 'package:signage/views/contents_page.dart';
import 'package:signage/views/dashboard_page%20copy.dart';
import 'package:signage/views/dashboard_page.dart';
import 'package:signage/views/find_screen_page.dart';
import 'package:signage/views/screens_page.dart';
import 'package:signage/views/splash_page.dart';
part 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 3000),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: Routes.FIND_SCREEN,
      page: () => const FindScreenPage(),
      binding: DashboardBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: Routes.SCREENS,
      page: () => const ScreensPage(),
      binding: DashboardBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: Routes.CONTENTS,
      page: () => const ContentsPage(),
      binding: DashboardBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => const SettingsPage(),
      binding: DashboardBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
  ];
}