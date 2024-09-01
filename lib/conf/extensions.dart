import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';

class ThemeX extends Cubit<ThemeMode> {
  ThemeX() : super(ThemeMode.system);

  static const floatingButtonColor = Color.fromARGB(212, 46, 161, 0);

  void toggleTheme() =>
      emit(state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);

  void getTheme(bool isDark) {
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  static const _scaffoldColor = Color.fromARGB(255, 12, 18, 32);

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.grey,
    ),
    scaffoldBackgroundColor: _scaffoldColor,
    cardTheme: const CardTheme(
      color: Colors.grey,
      elevation: 8,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: _scaffoldColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 8,
        backgroundColor: Colors.grey.shade900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        foregroundColor: Colors.white,
        shadowColor: Colors.grey.shade900,
        minimumSize: const Size(double.infinity, 55),
        disabledBackgroundColor: Colors.grey.shade400,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
      ),
    ),
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    listTileTheme: const ListTileThemeData(
        textColor: Colors.white, iconColor: Colors.white),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(color: Colors.white),
      labelStyle: const TextStyle(color: Colors.white),
      fillColor: Colors.grey.shade500,
      filled: true,
      iconColor: Colors.white,
      prefixIconColor: Colors.white,
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
    textTheme: GoogleFonts.robotoTextTheme(
      const TextTheme(
        headlineMedium:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        headlineSmall:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.white),
        titleLarge: TextStyle(color: Colors.white),
        titleMedium: TextStyle(color: Colors.white),
        titleSmall: TextStyle(color: Colors.white),
        displayLarge: TextStyle(color: Colors.white),
        displayMedium: TextStyle(color: Colors.white),
        displaySmall: TextStyle(color: Colors.white),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.white,
      secondary: Colors.white,
      brightness: Brightness.dark,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,
    secondaryHeaderColor: Colors.grey.shade200,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 8,
        backgroundColor: Colors.grey.shade200,
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        foregroundColor: Colors.black,
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: Colors.grey.shade400,
      selectedColor: Colors.black54,
      labelStyle: const TextStyle(color: Colors.black),
      secondaryLabelStyle: const TextStyle(color: Colors.black),
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.black,
    ),
    cardTheme: const CardTheme(elevation: 8),
    iconTheme: const IconThemeData(color: Colors.black),
    textTheme: GoogleFonts.robotoTextTheme(
      const TextTheme(
        headlineMedium: TextStyle(fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.black,
      brightness: Brightness.light,
      primary: Colors.black,
      // surface: Colors.black,
      // scrim: Colors.red,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.black,
    ),
  );
}
