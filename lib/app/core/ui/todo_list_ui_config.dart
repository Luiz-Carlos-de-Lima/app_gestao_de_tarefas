import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoListUiConfig {
  TodoListUiConfig._();

  static ThemeData get theme => ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
        brightness: Brightness.dark,
        primaryColor: Color(0xff4C4C7C),
        appBarTheme: const AppBarTheme(
          scrolledUnderElevation: 0.0,
          elevation: 0.0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff4C4C7C),
          ),
        ),
      );
}
