import 'package:flutter/material.dart';

class CustomTheme {
  //TODO change font family, add custom colors and widget themes
  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
        colorScheme: ColorScheme.light(
          primary: Colors
              .purple, // the color displayed most frequently across your app’s screens and components
          secondary: Colors
              .purpleAccent, // An accent color used for less prominent components in the UI, such as filter chips
          background: Colors
              .white, // A color that typically appears behind scrollable content
          surface: Colors.purpleAccent
              .shade200, // The background color for widgets like Card
        ),
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: Colors.purpleAccent,
        ));
  }

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      colorScheme: ColorScheme.dark(
        primary: Colors
            .purple, // the color displayed most frequently across your app’s screens and components
        secondary: Colors
            .purpleAccent, // An accent color used for less prominent components in the UI, such as filter chips
        background: Colors
            .white, // A color that typically appears behind scrollable content
        surface: Colors.purpleAccent
            .shade200, // The background color for widgets like Card
      ),
    );
  }
}
