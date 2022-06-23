import 'package:flutter/material.dart';

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
  Widget detailScreen = kDetailsScreens[Screen.profile]!;

  @override
  void dispose() {
    modeNotifier.dispose();
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
        mobileBody: SingleChildScrollView(child: detailScreen),
        desktopBody: const DesktopBody(),
        tabletBody: const DesktopBody(),
      ),
      drawer: ResponsiveLayout.isMobile(context)
          ? Drawer(
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Center(
                        child: Text(
                      'Drawer Header',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    )),
                  ),
                  ListTile(
                    leading: const Icon(Icons.account_circle),
                    title: const Text("Profile"),
                    onTap: () {
                      setState(() {
                        detailScreen = kDetailsScreens[Screen.profile]!;
                      });
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                      leading: const Icon(Icons.palette),
                      title: const Text("Themes"),
                      onTap: () {
                        setState(() {
                          detailScreen = kDetailsScreens[Screen.theme]!;
                        });
                        Navigator.pop(context);
                      }),
                ],
              ),
            )
          : null,
    );
  }
}

class DesktopBody extends StatefulWidget {
  const DesktopBody({Key? key}) : super(key: key);

  @override
  _DesktopBodyState createState() => _DesktopBodyState();
}

class _DesktopBodyState extends State<DesktopBody> {
  Widget detailScreen = kDetailsScreens[Screen.profile]!;

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
                setState(() {
                  detailScreen = kDetailsScreens[Screen.profile]!;
                });
              },
            ),
            ListTile(
                leading: const Icon(Icons.palette),
                title: const Text("Themes"),
                onTap: () {
                  setState(() {
                    detailScreen = kDetailsScreens[Screen.theme]!;
                  });
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
                  child: detailScreen,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
