import 'package:flutter/material.dart';

import '../widgets/menu_drawer.dart';
import 'constants.dart';
import 'notifiers.dart';
import 'responsive_layout.dart';
import 'themes/custom_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: modeNotifier,
        builder: (_, selectedMode, __) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: CustomTheme.lightTheme(context),
            darkTheme: CustomTheme.darkTheme(context),
            themeMode:
                selectedMode, // listen our notifier and display the selected theme
            home: const MyHomePage(),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void dispose() {
    modeNotifier.dispose();
    screenNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Responsive Flutter"),
        actions: [
          ValueListenableBuilder<ThemeMode>(
              valueListenable: modeNotifier,
              builder: (_, selectedMode, __) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: IconButton(
                      onPressed: () => modeNotifier.value =
                          selectedMode == ThemeMode.light
                              ? ThemeMode.dark
                              : ThemeMode.light,
                      icon: selectedMode == ThemeMode.light
                          ? const Icon(Icons.mode_night)
                          : const Icon(Icons.sunny)),
                );
              }),
        ],
      ),
      body: ResponsiveLayout(
        mobileBody: SingleChildScrollView(
          child: ValueListenableBuilder<Screen>(
              valueListenable: screenNotifier,
              builder: (_, selectedScreen, __) {
                return kDetailsScreens[selectedScreen]!;
              }),
        ),
        desktopBody: const DesktopBody(),
        tabletBody: const DesktopBody(),
      ),
      drawer: ResponsiveLayout.isMobile(context) ? const MenuDrawer() : null,
    );
  }
}

class DesktopBody extends StatelessWidget {
  const DesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: ListView(controller: ScrollController(), children: <Widget>[
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text("Profile"),
              onTap: () {
                screenNotifier.value = Screen.profile;
              },
            ),
            ListTile(
                leading: const Icon(Icons.palette),
                title: const Text("Themes"),
                onTap: () {
                  screenNotifier.value = Screen.theme;
                }),
          ]),
        ),
        Expanded(
          flex: 3,
          child: ListView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            controller: ScrollController(),
            children: <Widget>[
              Center(
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth: (screenWidth * 0.4) > 300.0
                          ? (screenWidth * 0.4)
                          : 300.0),
                  child: ValueListenableBuilder<Screen>(
                      valueListenable: screenNotifier,
                      builder: (_, selectedScreen, __) {
                        return kDetailsScreens[selectedScreen]!;
                      }),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
