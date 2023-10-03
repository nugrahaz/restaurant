import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restfood/app/modules/home/controllers/home_controller.dart';

import '../../../constants/constants.dart';
import '../../../constants/data/app_data.dart';
import '../../../utils/utils.dart';
import '../../favorite/views/favorite_page.dart';
import '../../restfood_list/views/component/restaurant_list_search.dart';
import '../../restfood_list/views/food_list_page.dart';
import '../../settings/views/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = HomeController.to;

  final List<Widget> listPage = [
    const FoodListPage(),
    const FavoritePage(),
    const SettingsPage(),
  ];

  @override
  void initState() {
    super.initState();
    SharedMethod.systemBarColor(
        AppStyles.colors.transparent, AppStyles.colors.bgDark);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 4.0.wp),
            child: IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: RestaurantListSearch(),
                );
              },
              icon: const Icon(Icons.search),
            ),
          )
        ],
        centerTitle: false,
        title: Text(
          'Foodrest',
          style: AppStyles.textStyles.poppinsBold
              .copyWith(color: AppStyles.colors.bgDark, fontSize: 5.0.wp),
        ),
      ),
      body: Obx(
        () => listPage[controller.currentBottomNavItemIndex.value],
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.currentBottomNavItemIndex.value,
          onTap: controller.switchBetweenBottomNavigationItems,
          selectedFontSize: 0,
          items: AppData.bottomNavigationItems.map(
            (element) {
              return BottomNavigationBarItem(
                icon: element.disableIcon,
                label: element.label,
                activeIcon: element.enableIcon,
              );
            },
          ).toList(),
        );
      }),
    );
  }
}
