part of '../constants.dart';

class AppRoutes {
  static const splashPage = '/splashPage';
  static const onboardingPage = '/onboardingPage';
  static const homePage = '/homePage';
  static const detailPage = '/detailPage';

  static final getPages = [
    GetPage(
      name: AppRoutes.splashPage,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.onboardingPage,
      page: () => const OnboardingPage(),
      binding: OnboardingBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.homePage,
      page: () => const HomePage(),
      bindings: [HomeBinding(), FoodListBinding()],
    ),
    GetPage(
      name: AppRoutes.detailPage,
      page: () => const RestaurantDetailPage(),
      bindings: [FoodDetailBinding()],
      transition: Transition.fadeIn,
    ),
  ];
}
