import 'package:flutter/material.dart';

import 'screens/profile_screen.dart';
import 'screens/theme_screen.dart';

enum Screen { profile, theme }

const double kTabletBreakpoint = 768.0;
const double kDesktopBreakPoint = 992.0;

const Map<Screen, Widget> kDetailsScreens = {
  Screen.profile: ProfileScreen(),
  Screen.theme: ThemeScreen(),
};
