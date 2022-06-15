import 'package:flutter/material.dart';

import '../notifiers.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: modeNotifier,
        builder: (_, selectedMode, __) {
          return Container(
            color: Colors.red.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Wrap(
                    spacing: 16.0,
                    runSpacing: 16.0,
                    children: [
                      CustomRadioButton(
                        label: "Light Theme",
                        value: ThemeMode.light,
                        backgroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                      ),
                      CustomRadioButton(
                        label: "Dark Theme",
                        value: ThemeMode.dark,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  ElevatedButton(
                    onPressed: () => modeNotifier.value =
                        selectedMode == ThemeMode.light
                            ? ThemeMode.dark
                            : ThemeMode.light,
                    child: const Text('Toggle Theme'),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class CustomRadioButton extends StatelessWidget {
  final String label;
  final ThemeMode value;
  final Color? backgroundColor;
  const CustomRadioButton(
      {Key? key,
      required this.label,
      required this.value,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: modeNotifier,
      builder: (_, selectedMode, __) {
        return ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 200.0),
          child: AspectRatio(
            aspectRatio: 1, // make a square
            child: OutlinedButton(
              onPressed: () {
                modeNotifier.value = value;
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: backgroundColor ?? Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(label),
                  Radio(
                    value: value,
                    groupValue: selectedMode,
                    onChanged: (value) {
                      modeNotifier.value = value as ThemeMode;
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
