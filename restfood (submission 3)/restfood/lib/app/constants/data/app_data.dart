import 'package:flutter/material.dart';

import '../../models/navigation_item.dart';

class AppData {
  static List<NavigationItem> bottomNavigationItems = [
    NavigationItem(
      const Icon(Icons.home_outlined),
      const Icon(Icons.home),
      'Home',
      isSelected: true,
    ),
    NavigationItem(
      const Icon(Icons.favorite_border),
      const Icon(Icons.favorite),
      'Favorite',
    ),
    NavigationItem(
      const Icon(
        Icons.settings,
      ),
      const Icon(
        Icons.settings,
        color: Colors.cyan,
      ),
      'Settings',
    )
  ];
}
