import 'package:flutter/material.dart';

class NavigationItem {
  final Widget disableIcon;
  final Widget enableIcon;
  String label;
  bool isSelected;

  NavigationItem(
    this.disableIcon,
    this.enableIcon,
    this.label, {
    this.isSelected = false,
  });
}
