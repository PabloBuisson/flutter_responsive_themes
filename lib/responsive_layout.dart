import 'package:flutter/material.dart';

import 'constants.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    Key? key,
    required this.mobileBody,
    this.tabletBody,
    this.desktopBody,
  }) : super(key: key);

  final Widget mobileBody;
  final Widget? tabletBody;
  final Widget? desktopBody;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < kTabletBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < kDesktopBreakPoint &&
      MediaQuery.of(context).size.width >= kTabletBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= kDesktopBreakPoint;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimension) {
        if (dimension.maxWidth < kTabletBreakpoint) {
          return mobileBody;
        } else if (dimension.maxWidth >= kTabletBreakpoint &&
            dimension.maxWidth < kDesktopBreakPoint) {
          return tabletBody ?? mobileBody;
        } else {
          return desktopBody ?? mobileBody;
        }
      },
    );
  }
}
