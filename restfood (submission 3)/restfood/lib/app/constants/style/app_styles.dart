part of '../constants.dart';

class AppStyles {
  static final colors = _Colors();
  static final textStyles = _TextStyles();
  static final font = _Font();
  //
  static final widget = _Widgets();

  //
  static final theme = _Theme();
  static final shadows = _Shadows();
}

class _Colors {
  final transparent = Colors.transparent;
  final bgDark = const Color.fromRGBO(44, 43, 63, 1); //2C2B3F
  final black = HexColor("#232232");

  //
  final turqoise = HexColor("#00b9bc");

  final cyan = Colors.cyan; //0,188,227 //0xFF26C6DA  //HexColor("#")

  final white = Colors.white.withOpacity(0.975);
  final grey = const Color(0xff475e69);
  final darkGrey = const Color(0xFF9E9E9E);
  final red = const Color(0xFFEF5350);
}

class _TextStyles {
  final poppinsMedium = const TextStyle(
      fontFamily: _Font.poppinsMedium,
      wordSpacing: 1,
      letterSpacing: 1,
      fontWeight: FontWeight.bold);
  final poppinsSemiBold = const TextStyle(
      fontFamily: _Font.poppinsSemiBold,
      wordSpacing: 1,
      letterSpacing: 1,
      fontWeight: FontWeight.bold);
  final poppinsBold = const TextStyle(
      fontFamily: _Font.poppinsBold, fontWeight: FontWeight.bold);
}

class _Font {
  static const poppinsBold = 'poppins_bold';
  static const poppinsMedium = 'poppins_medium';
  static const poppinsSemiBold = 'poppins_semi_bold';
}

class _Widgets {
  final textFieldStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: const BorderSide(color: Colors.transparent),
  );
}

class _Shadows {
  final softShadow = [
    BoxShadow(
      color: AppStyles.colors.grey,
      blurRadius: 1,
      offset: const Offset(0, 2),
    )
  ];

  final hardShadow = [
    const BoxShadow(
      blurRadius: 2,
      offset: Offset(0, 2),
    ),
    const BoxShadow(
      blurRadius: 4,
      offset: Offset(0, 4),
    ),
  ];
}

class _Theme {
  final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppStyles.colors.white,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppStyles.colors.cyan,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black45),
      centerTitle: true,
      titleTextStyle: AppStyles.textStyles.poppinsSemiBold,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          AppStyles.colors.cyan,
        ),
      ),
    ),
    hintColor: Colors.black45,
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(borderSide: BorderSide.none),
      enabledBorder: AppStyles.widget.textFieldStyle,
      focusedBorder: AppStyles.widget.textFieldStyle,
      filled: true,
      contentPadding: const EdgeInsets.all(20),
      fillColor: Colors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: AppStyles.colors.cyan,
    ),
    textTheme: TextTheme(
      displayLarge: AppStyles.textStyles.poppinsMedium
          .copyWith(color: AppStyles.colors.bgDark),
      displayMedium: AppStyles.textStyles.poppinsMedium
          .copyWith(color: AppStyles.colors.bgDark),
      displaySmall: AppStyles.textStyles.poppinsMedium
          .copyWith(color: AppStyles.colors.bgDark),
      headlineMedium: AppStyles.textStyles.poppinsMedium
          .copyWith(color: AppStyles.colors.bgDark),
      headlineSmall: AppStyles.textStyles.poppinsMedium
          .copyWith(color: AppStyles.colors.bgDark),
      bodyLarge: AppStyles.textStyles.poppinsMedium
          .copyWith(color: AppStyles.colors.bgDark),
      titleMedium: AppStyles.textStyles.poppinsMedium
          .copyWith(color: AppStyles.colors.bgDark),
    ),
    iconTheme: const IconThemeData(color: Colors.black45),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
  );

  final ThemeData darkTheme = ThemeData(
    canvasColor: AppStyles.colors.bgDark,
    scaffoldBackgroundColor: AppStyles.colors.bgDark,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppStyles.colors.cyan,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarTextStyle: TextStyle(color: Colors.white),
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          AppStyles.colors.cyan,
        ),
      ),
    ),
    hintColor: Colors.white60,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: AppStyles.widget.textFieldStyle,
      focusedBorder: AppStyles.widget.textFieldStyle,
      filled: true,
      contentPadding: const EdgeInsets.all(20),
      fillColor: AppStyles.colors.bgDark,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppStyles.colors.bgDark,
      selectedItemColor: AppStyles.colors.bgDark,
      unselectedItemColor: Colors.white70,
    ),
    textTheme: TextTheme(
      displayLarge:
          AppStyles.textStyles.poppinsMedium.copyWith(color: Colors.white),
      displayMedium:
          AppStyles.textStyles.poppinsMedium.copyWith(color: Colors.white),
      displaySmall:
          AppStyles.textStyles.poppinsMedium.copyWith(color: Colors.white),
      headlineMedium:
          AppStyles.textStyles.poppinsMedium.copyWith(color: Colors.white),
      headlineSmall:
          AppStyles.textStyles.poppinsMedium.copyWith(color: Colors.white),
      bodyLarge:
          AppStyles.textStyles.poppinsMedium.copyWith(color: Colors.white),
      titleMedium:
          AppStyles.textStyles.poppinsMedium.copyWith(color: Colors.white60),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    bottomAppBarTheme: BottomAppBarTheme(
      color: AppStyles.colors.bgDark,
    ),
  );
}
