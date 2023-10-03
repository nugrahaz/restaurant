import 'package:flutter/material.dart';
import 'package:restfood/app/modules/home/controllers/home_controller.dart';

import '../../../constants/constants.dart';
import '../../../utils/utils.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final HomeController controller = HomeController.to;

  @override
  void initState() {
    super.initState();
    SharedMethod.systemBarColor(
        AppStyles.colors.transparent, AppStyles.colors.bgDark);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
        child: const Center(
          child: Text("Favorite"),
        ),
      ),
    );
  }
}
