import 'package:flutter/material.dart';

import '../notifiers.dart';

class ThemeScreen extends StatelessWidget {
  ThemeScreen({Key? key}) : super(key: key);
  ThemeMode currentMode = modeNotifier.value;
  //TODO listen to mode change with ValueListenableBuilder

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => modeNotifier.value =
          currentMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
      child: const Text('Toggle Theme'),
    );
  }
}
