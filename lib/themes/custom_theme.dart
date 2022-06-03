import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  //TODO change font family, add custom colors and widget themes
  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      appBarTheme: AppBarTheme(
          elevation: 0.0,
          centerTitle: true,
          color: Colors.purple.shade100,
          iconTheme: const IconThemeData(color: Colors.orange),
          actionsIconTheme: const IconThemeData(color: Colors.orange),
          foregroundColor: Colors.deepPurple),
      // how the text of the app is rendered
      textTheme: const TextTheme()
          .copyWith(
            bodyText2: const TextStyle(),
            subtitle1: const TextStyle(),
            headline4: const TextStyle(),
          )
          // apply same properties to aforementioned text styles
          .apply(
              displayColor: Colors
                  .deepPurple, // displayLarge, displayMedium, displaySmall, headlineLarge, headlineMedium, and bodySmall,
              bodyColor: Colors.deepPurple // the remaining
              ),
      // main colors of the application
      colorScheme: ColorScheme.light(
        primary: Colors
            .deepPurple, // the color displayed most frequently across your app’s screens and components
        onPrimary: Colors
            .white, // A color that's clearly legible when drawn on primary (example : a text on primary surface)
        secondary: Colors
            .purpleAccent, // An accent color used for less prominent components in the UI, such as filter chips
        primaryContainer: Colors.purpleAccent,
        onPrimaryContainer: Colors
            .deepPurple, // An accent color used for less prominent components in the UI, such as filter chips and FAB
        background: Colors
            .white, // A color that typically appears behind scrollable content
        surface: Colors.purpleAccent
            .shade200, // The background color for widgets like Card, Tooltip
      ),
      // color for active checkboxes, switches, radios, ect.
      toggleableActiveColor: Colors.purpleAccent,
      elevatedButtonTheme: ElevatedButtonThemeData(
          // to replace by ButtonStyle() if you want to color how the button
          // is rendered at each state : hover, selected, disabled, ect.
          // for ButtonStyle, the color of the text is the foreground property
          style: ElevatedButton.styleFrom(
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              textStyle: const TextStyle(fontSize: 18.0),
              padding: const EdgeInsets.symmetric(
                  vertical: 20.0, horizontal: 26.0))),
      /*style : ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors
                  .white), // The color for the button's Text and Icon widget descendants
              textStyle: MaterialStateProperty.all<TextStyle>(
                  const TextStyle(fontSize: 18.0)),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.all(20.0)))*/
      /*checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          // If the checkbox is selected return the selected color
          if (states.contains(MaterialState.selected)) {
            return Colors.purpleAccent.shade700;
          }
        }),
      ),*/
      /*switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith((states) {
          // If the switch is selected return the selected color
          if (states.contains(MaterialState.selected)) {
            return Colors.purpleAccent.shade700;
          }
        }),
        trackColor: MaterialStateProperty.resolveWith((states) {
          // If the switch is selected return the selected color
          if (states.contains(MaterialState.selected)) {
            return Colors.purpleAccent.shade100;
          }
        }),
      ),*/
      chipTheme: ChipThemeData(
        selectedColor: Colors.purpleAccent,
        backgroundColor: Colors.grey.shade500, // unselected backround color
        checkmarkColor: Colors.white,
        labelStyle: const TextStyle(color: Colors.white),
      ),
      /*buttonTheme: ButtonThemeData(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: Colors.purpleAccent,
      ),*/
    );
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