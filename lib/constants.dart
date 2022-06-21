import 'package:flutter/material.dart';
import 'package:responsivethemes/screens/profile_screen.dart';
import 'package:responsivethemes/screens/theme_screen.dart';

enum Screen { profile, theme }

const double kTabletBreakpoint = 768.0;
const double kDesktopBreakPoint = 1440.0;

const Map<Screen, Widget> kDetailsScreens = {
  Screen.profile: ProfileScreen(),
  Screen.theme: ThemeScreen(),
};
