import 'package:flutter/material.dart';
import 'package:responsivethemes/themes/custom_theme.dart';

void main() {
  runApp(const MyApp());
}

// create a global notifier for our app
final ValueNotifier<ThemeMode> modeNotifier = ValueNotifier(ThemeMode.light);

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
  int _counter = 0;
  bool checkboxValue = false;
  double sliderValue = 0;

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: IconButton(
                onPressed: () => modeNotifier.value =
                    currentMode == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light,
                icon: currentMode == ThemeMode.light
                    ? const Icon(Icons.mode_night, color: Colors.white)
                    : const Icon(
                        Icons.sunny,
                        color: Colors.white,
                      )),
          )
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: ListView(children: const <Widget>[
              ListTile(
                title: Text("Profile"),
              ),
              ListTile(
                title: Text("Themes"),
              ),
            ]),
          ),
          Expanded(
            flex: 3,
            child: ListView(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              children: <Widget>[
                Center(
                  child: Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.3),
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          color: Colors.red,
                          child: AspectRatio(
                            aspectRatio: 2.0,
                            child: Container(
                              width: 20,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://avatars.githubusercontent.com/u/41048008?v=4'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'My profile',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ElevatedButton(
                          onPressed: () => modeNotifier.value =
                              currentMode == ThemeMode.light
                                  ? ThemeMode.dark
                                  : ThemeMode.light,
                          child: const Text('Toggle Theme'),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Checkbox(
                            value: checkboxValue,
                            onChanged: (bool? value) {
                              setState(() {
                                checkboxValue = value!;
                              });
                            }),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Switch(
                            value: checkboxValue,
                            onChanged: (bool? value) {
                              setState(() {
                                checkboxValue = value!;
                              });
                            }),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Slider(
                          value: sliderValue,
                          max: 100,
                          divisions: 5,
                          label: sliderValue.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              sliderValue = value;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        InputChip(
                          label: const Text('Example chip'),
                          selected: checkboxValue,
                          onSelected: (bool selected) {
                            setState(() {
                              checkboxValue = selected;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const TextField(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Theme(
                          data: Theme.of(context)
                              .copyWith(backgroundColor: Colors.purpleAccent),
                          child: const CircularProgressIndicator(
                            value: null,
                            semanticsLabel: 'Linear progress indicator',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
