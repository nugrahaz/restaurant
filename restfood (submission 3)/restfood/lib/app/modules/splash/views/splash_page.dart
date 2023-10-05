import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/constants.dart';
import '../../../utils/utils.dart';
import '../controllers/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  SplashController splashController = SplashController.to;

  @override
  void initState() {
    super.initState();
    SharedMethod.systemBarColor(
        AppStyles.colors.transparent, AppStyles.colors.bgDark);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.colors.bgDark,
      body: Stack(
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.0.wp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15.0.wp,
                  ),
                  Container(
                    height: 50.0.wp,
                    padding: EdgeInsets.only(bottom: 4.0.wp),
                    child: Lottie.asset(
                      AssetsPath.lotties.splash,
                      reverse: false,
                      repeat: true,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    "Restfood",
                    style: AppStyles.textStyles.poppinsBold.copyWith(
                        color: AppStyles.colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        wordSpacing: 0.2,
                        fontSize: 5.5.wp),
                  ),
                  SizedBox(
                    height: 15.0.wp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
