import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restfood/app/constants/constants.dart';

import '../../../services/local/storage_service.dart';

class OnboardingController extends GetxController {
  static OnboardingController to = Get.find();

  List<Map<String, dynamic>> dataOnboardingPages = [
    {
      "imageAsset": AssetsPath.images.food,
      "title": "Beraneka Makanan",
      "description":
          "Temukan lebih banyak rasa lezat yang belum pernah Anda rasakan sebelumnya",
    },
    {
      "imageAsset": AssetsPath.images.shop,
      "title": "Cari Resto Terbaik",
      "description":
          "Kunjungi banyak restoran terbaik yang kami pilih untuk Anda",
    },
    {
      "imageAsset": AssetsPath.images.dislike,
      "title": "Temukan Resto Populer",
      "description":
          "Lihat restoran populer dengan review terbaik dari banyak orang"
    }
  ];

  var current = 0.obs;

  bool get isLastPage => current.value == dataOnboardingPages.length - 1;

  bool get isFirstPage => current.value.toInt() == 0;

  CarouselController pageController = CarouselController();

  void prevPage() {
    if (!isFirstPage) {
      pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.linear);
    }
  }

  void forwardAction() {
    if (isLastPage) {
      StorageServices()
          .pageHasSeen(AppRoutes.onboardingPage)
          .then((value) => Get.offAllNamed(AppRoutes.homePage));
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.linear);
    }
  }
}
