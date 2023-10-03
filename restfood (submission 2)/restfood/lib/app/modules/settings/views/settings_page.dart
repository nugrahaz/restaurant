import 'package:flutter/material.dart';
import 'package:restfood/app/modules/home/controllers/home_controller.dart';

import '../../../constants/constants.dart';
import '../../../utils/utils.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final HomeController controller = HomeController.to;

  @override
  void initState() {
    super.initState();
    SharedMethod.systemBarColor(
        AppStyles.colors.transparent, AppStyles.colors.bgDark);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Settings"),
      ),
    );
  }
}
