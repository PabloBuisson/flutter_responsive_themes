import 'package:flutter/material.dart';

class CustomTheme {
  /// all the properties shared between the dark and the light theme
  static ThemeData sharedTheme({required Brightness brightness}) {
    return ThemeData(
        brightness: brightness,
        fontFamily: 'Lato',
        // color for inactive checkboxes, switches, radios, ect.
        unselectedWidgetColor: Colors.grey,
        // color for active checkboxes, switches, radios, ect.
        toggleableActiveColor: brightness == Brightness.light
            ? Colors.purpleAccent
            : Colors.purpleAccent.shade400,
        chipTheme: ChipThemeData(
          selectedColor: brightness == Brightness.light
              ? Colors.purpleAccent
              : Colors.purpleAccent.shade700,
          backgroundColor: brightness == Brightness.light
              ? Colors.grey.shade500
              : Colors.deepPurple.shade600, // unselected backround color
          checkmarkColor: Colors.white,
          labelStyle: const TextStyle(color: Colors.white),
        ),
        appBarTheme: AppBarTheme(
            elevation: 0.0,
            centerTitle: true,
            color: brightness == Brightness.light
                ? Colors.purple.shade100
                : Colors.deepPurple.shade400,
            iconTheme: IconThemeData(
                color: brightness == Brightness.light
                    ? Colors.deepPurple.shade400
                    : Colors.white),
            actionsIconTheme: IconThemeData(
                color: brightness == Brightness.light
                    ? Colors.deepPurple.shade400
                    : Colors.white),
            foregroundColor: brightness == Brightness.light
                ? Colors.deepPurple
                : Colors.purple.shade100),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                onPrimary: brightness == Brightness.light
                    ? Colors.white
                    : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                textStyle: const TextStyle(fontSize: 18.0),
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 26.0))),
        toggleButtonsTheme:
            const ToggleButtonsThemeData(textStyle: TextStyle(fontSize: 15.0)),
        sliderTheme: SliderThemeData(
            thumbColor: Colors.purpleAccent,
            activeTrackColor: Colors.purpleAccent.shade100,
            // tooltip showing the value
            valueIndicatorColor: Colors.deepPurple.shade400,
            // remove padding
            overlayShape: SliderComponentShape.noOverlay,
            showValueIndicator: ShowValueIndicator.always),
        progressIndicatorTheme: ProgressIndicatorThemeData(
            color: brightness == Brightness.light
                ? Colors.purpleAccent
                : Colors.purpleAccent.shade400),
        iconTheme: IconThemeData(
            color: brightness == Brightness.light
                ? Colors.purpleAccent
                : Colors.purpleAccent.shade100),
        listTileTheme: ListTileThemeData(
          iconColor: brightness == Brightness.light
              ? Colors.purpleAccent
              : Colors.purpleAccent.shade100,
        ),
        drawerTheme: DrawerThemeData(
          backgroundColor: brightness == Brightness.light
              ? Colors.purple.shade50
              : Colors.deepPurple.shade400,
        ));
  }

  static ThemeData lightTheme(BuildContext context) {
    return sharedTheme(brightness: Brightness.light).copyWith(
      // brightness: Brightness.light, // = ThemeData.light()
      // how the text of the app is rendered
      textTheme: Theme.of(context)
          .textTheme
          // apply same properties to aforementioned text styles
          // for more control = const TextTheme().copyWith(
          //  bodyText2: const TextStyle(), // text by default
          //  subtitle1: const TextStyle(), // text of textfield
          //  headline4: const TextStyle(),
          //  )
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
      // every property declared here MUST be declared in the dark theme
      // elevatedButtonTheme: sharedTheme().elevatedButtonTheme,
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
      /*buttonTheme: ButtonThemeData(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: Colors.purpleAccent,
      ),*/
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return sharedTheme(brightness: Brightness.dark).copyWith(
      // brightness: Brightness.dark, // = ThemeData.dark()
      colorScheme: ColorScheme.dark(
        primary: Colors
            .purple, // the color displayed most frequently across your app’s screens and components
        onPrimary: Colors.white,
        secondary: Colors
            .purpleAccent, // An accent color used for less prominent components in the UI, such as filter chips
        background: Colors
            .white, // A color that typically appears behind scrollable content
        surface: Colors.purpleAccent
            .shade200, // The background color for widgets like Card
      ),
      scaffoldBackgroundColor: Colors.deepPurple,
      // how the text of the app is rendered
      textTheme: Theme.of(context).textTheme.apply(
          displayColor: Colors
              .white, // displayLarge, displayMedium, displaySmall, headlineLarge, headlineMedium, and bodySmall,
          bodyColor: Colors.white // the remaining
          ),
    );
  }
}
