import 'package:flutter/material.dart';

import '../notifiers.dart';
import '../widgets/custom_radio_button.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: modeNotifier,
        builder: (_, selectedMode, __) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Wrap(
                  spacing: 16.0,
                  runSpacing: 16.0,
                  children: [
                    CustomRadioButton<ThemeMode>(
                      label: "Light Theme",
                      value: ThemeMode.light,
                      valueNotifier: modeNotifier,
                      backgroundColor: Colors.white,
                    ),
                    CustomRadioButton<ThemeMode>(
                      radioTheme: Theme.of(context).copyWith(
                        unselectedWidgetColor: Colors.grey.shade400,
                      ),
                      label: "Dark Theme",
                      labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                      value: ThemeMode.dark,
                      valueNotifier: modeNotifier,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: ElevatedButton(
                    onPressed: () => modeNotifier.value =
                        selectedMode == ThemeMode.light
                            ? ThemeMode.dark
                            : ThemeMode.light,
                    child: const Text('Toggle Theme'),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
