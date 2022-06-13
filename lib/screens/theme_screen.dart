import 'package:flutter/material.dart';

import '../notifiers.dart';

class ThemeScreen extends StatelessWidget {
  ThemeScreen({Key? key}) : super(key: key);
  ThemeMode currentMode = modeNotifier.value;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: modeNotifier,
        builder: (_, selectedMode, __) {
          return ElevatedButton(
            onPressed: () => modeNotifier.value =
                selectedMode == ThemeMode.light
                    ? ThemeMode.dark
                    : ThemeMode.light,
            child: const Text('Toggle Theme'),
          );
        });
  }
}
