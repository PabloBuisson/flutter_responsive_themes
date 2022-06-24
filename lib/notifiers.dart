import 'package:flutter/material.dart';

import 'constants.dart';

// create a global notifier for our app
final ValueNotifier<ThemeMode> modeNotifier = ValueNotifier(ThemeMode.light);

// create a global notifier for our app
final ValueNotifier<Screen> screenNotifier = ValueNotifier(Screen.profile);
