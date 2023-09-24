part of 'utils.dart';

class SharedMethod {
  //Coloring System Bar
  static void systemBarColor(Color statusColor, Color navColor) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: statusColor, //top bar color
      statusBarIconBrightness: (statusColor != AppStyles.colors.white)
          ? Brightness.light
          : Brightness.dark, //top bar icons
      systemNavigationBarColor: navColor, //bottom bar color
      systemNavigationBarIconBrightness: (navColor != AppStyles.colors.white)
          ? Brightness.light
          : Brightness.dark, //bottom bar icons
    ));
  }

  static void customDialog(
      {String? title,
      String? imagePath,
      String? description,
      String? buttonText,
      Function()? function,
      Color? colorStatusBar,
      Color? colorNavigationBar}) {
    Get.dialog(
        CustomDialog(
          title: title ?? "Keluar",
          imagePath: imagePath ?? AssetsPath.lotties.splash,
          description:
              description ?? "Apakah Anda ingin meninggalkan aplikasi ini?",
          buttonText: buttonText ?? "Ya, tentu",
          function: function ??
              () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
          colorStatusBar: colorStatusBar,
          colorNavigationBar: colorNavigationBar,
        ),
        barrierColor: AppStyles.colors.bgDark.withOpacity(0.33));
  }

  static void showSnackBar(
      {required String title, required String description}) {
    Get.snackbar(
      "", "",
      titleText: Padding(
        padding: EdgeInsets.only(left: 3.0.wp),
        child: Text(
          title,
          style: AppStyles.textStyles.poppinsMedium.copyWith(
            color: AppStyles.colors.white,
            fontSize: 3.2.wp,
            wordSpacing: 0.3,
            letterSpacing: 0.3,
          ),
        ),
      ),

      messageText: Padding(
        padding: EdgeInsets.only(
          left: 3.0.wp,
        ),
        child: Text(
          description,
          style: AppStyles.textStyles.poppinsMedium.copyWith(
            fontSize: 2.9.wp,
            color: AppStyles.colors.white,
            wordSpacing: 0.6,
            letterSpacing: 0.6,
          ),
        ),
      ),

      // borderRadius: 0,
      shouldIconPulse: false,
      icon: Container(
        padding: EdgeInsets.only(left: 4.0.wp),
        child: Icon(
          Icons.info_outline_rounded,
          color: AppStyles.colors.white,
          size: 7.0.wp,
        ),
      ),
      isDismissible: false,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 3000),
      animationDuration: const Duration(milliseconds: 750),
      margin: EdgeInsets.all(6.25.wp),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blueGrey,
      colorText: AppStyles.colors.white,
    );
  }
}
