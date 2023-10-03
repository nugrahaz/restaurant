part of '../constants.dart';

class AssetsPath {
  static final fontFamily = _FontFamily();
  static final lotties = _Lotties();
  static final images = _Images();
}

//Font Familly
class _FontFamily {
  final poppinsBold = 'poppins_bold';
  final poppinsMedium = 'poppins_medium';
  final poppinsSemiBold = 'poppins_semi_bold';
}

class _Lotties {
  static const path = 'assets/lotties';
  //
  final loading = "$path/loading.json";
  final search = "$path/search.json";
  final splash = "$path/splash.json";
  final noConnection = "$path/no_connection.json";
}

class _Images {
  static const path = 'assets/images';
  final shop = '$path/shop.png';
  final food = '$path/food.png';
  final dislike = '$path/dislike.png';
}
