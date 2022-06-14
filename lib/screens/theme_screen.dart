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
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                            maxWidth: 200.0), // add the desired size
                        child: AspectRatio(
                          aspectRatio: 1, // make a square
                          child: Card(
                            elevation: 8.0,
                            color: Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                            child: Wrap(
                              children: [
                                const Text("Light theme"),
                                Radio(
                                  value: ThemeMode.light,
                                  groupValue: selectedMode,
                                  onChanged: (value) {
                                    modeNotifier.value = value as ThemeMode;
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 200.0),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Card(
                            elevation: 8.0,
                            color: Colors.black,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                            child: Wrap(
                              children: [
                                const Text("Dark theme"),
                                Radio(
                                  value: ThemeMode.dark,
                                  groupValue: selectedMode,
                                  onChanged: (value) {
                                    modeNotifier.value = value as ThemeMode;
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
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
