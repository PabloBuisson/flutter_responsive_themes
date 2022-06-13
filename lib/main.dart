import 'package:flutter/material.dart';

import 'notifiers.dart';
import 'screens/profile_screen.dart';
import 'screens/theme_screen.dart';
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
  static Map<String, Widget> rightScreens = {
    "profile": const ProfileScreen(),
    "theme": ThemeScreen(),
  };

  Widget? rightScreen = rightScreens["profile"];

  @override
  void dispose() {
    modeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeMode currentMode = modeNotifier.value;

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
                          ? const Icon(Icons.mode_night, color: Colors.white)
                          : const Icon(
                              Icons.sunny,
                              color: Colors.white,
                            )),
                );
              }),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: ListView(controller: ScrollController(), children: <Widget>[
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text("Profile"),
                onTap: () {
                  setState(() {
                    rightScreen = rightScreens["profile"];
                  });
                },
              ),
              ListTile(
                  leading: const Icon(Icons.palette),
                  title: const Text("Themes"),
                  onTap: () {
                    setState(() {
                      rightScreen = rightScreens["theme"];
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
                        maxWidth: MediaQuery.of(context).size.width * 0.3),
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: rightScreen,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
