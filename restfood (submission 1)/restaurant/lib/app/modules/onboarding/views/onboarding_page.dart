import 'package:carousel_slider/carousel_slider.dart';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constants.dart';
import '../../../utils/utils.dart';
import '../../../widgets/widgets.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  OnboardingPageState createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage> {
  final OnboardingController onboardingController = OnboardingController.to;

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
      body: SafeArea(
        child: DoubleBack(
          onFirstBackPress: (context) {
            // localStorageController.readData();
            SharedMethod.showSnackBar(
                title: "pressMore".tr, description: "toLeave".tr);
          },
          waitForSecondBackPress: 3,
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //Carousel
                CarouselSlider.builder(
                  options: CarouselOptions(
                      height: 82.0.wp,
                      initialPage: 0,
                      enlargeCenterPage: true,
                      autoPlay: false,
                      reverse: false,
                      enableInfiniteScroll: false,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        // onboardingController.updateCurrentPage(index);
                        onboardingController.current.value = index;
                      }),
                  carouselController: onboardingController.pageController,
                  itemCount: onboardingController.dataOnboardingPages.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int idAnimation) =>
                          Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 15.0.wp,
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(onboardingController
                              .dataOnboardingPages[itemIndex]["imageAsset"]),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.0.wp,
                ),
                //Caption
                SizedBox(
                  width: 78.0.wp,
                  child: Column(
                    children: <Widget>[
                      Text(
                        onboardingController.dataOnboardingPages[
                            onboardingController.current.value]["title"],
                        style: AppStyles.textStyles.poppinsBold.copyWith(
                          color: AppStyles.colors.white,
                          fontSize: 4.5.wp,
                        ),
                      ),
                      SizedBox(
                        height: 2.0.wp,
                      ),
                      Text(
                        onboardingController.dataOnboardingPages[
                                    onboardingController.current.value]
                                ["description"] ??
                            "",
                        textAlign: TextAlign.center,
                        style: AppStyles.textStyles.poppinsMedium.copyWith(
                            color: AppStyles.colors.white,
                            fontSize: 3.2.wp,
                            wordSpacing: 0.6,
                            letterSpacing: 0.7,
                            fontWeight: FontWeight.w600,
                            height: 1.3),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.0.wp,
                ),
                //Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    onboardingController.dataOnboardingPages.length,
                    (index) => AnimatedContainer(
                      duration: 250.milliseconds,
                      margin: EdgeInsets.symmetric(horizontal: 1.2.wp),
                      width:
                          (onboardingController.current.value.roundToDouble() ==
                                  index)
                              ? 5.0.wp
                              : 2.0.wp,
                      height: 2.0.wp,
                      decoration: BoxDecoration(
                          color: onboardingController.current.value
                                      .roundToDouble() ==
                                  index
                              ? AppStyles.colors.white
                              : AppStyles.colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0.wp,
                ),
                //Button
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0.wp,
                  ),
                  child: Row(
                    children: [
                      AnimatedContainer(
                        height: 15.0.wp,
                        width: (onboardingController.current.value != 0)
                            ? 16.0.wp
                            : 0,
                        duration: 250.milliseconds,
                        child: Container(
                          height: 7.5.wp,
                          margin: EdgeInsets.only(
                            right: 3.5.wp,
                          ),
                          decoration: BoxDecoration(
                            color: AppStyles.colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: CustomButton(
                            width: (onboardingController.current.value != 0)
                                ? 8.0.wp
                                : 0,
                            onlyIcon: true,
                            function: () {
                              onboardingController.prevPage();
                            },
                            color: AppStyles.colors.white,
                            icons: (onboardingController.current.value != 0)
                                ? Icons.arrow_back_ios_new
                                : null,
                            borderRadius: 12,
                          ),
                        ),
                      ),
                      Expanded(
                        child: CustomButton(
                          onlyIcon: false,
                          function: onboardingController.forwardAction,
                          color: AppStyles.colors.white,
                          titleColor: AppStyles.colors.bgDark,
                          title: onboardingController.isLastPage
                              ? "Akhiri"
                              : "Selanjutnya",
                          fontSize: 4.5.wp,
                          height: 15.0.wp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 9.0.wp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
