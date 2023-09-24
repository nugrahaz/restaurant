import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restfood/app/constants/constants.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: false,
      //
      color: AppStyles.colors.bgDark,
      theme: AppStyles.theme.lightTheme,
      defaultTransition: Transition.fadeIn,
      //
      getPages: AppRoutes.getPages,
      initialRoute: AppRoutes.splashPage,
      // initialBinding: SplashBinding(),
      //
    );
  }
}
