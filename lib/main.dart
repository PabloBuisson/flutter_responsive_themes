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
            theme: CustomTheme.lightTheme,
            darkTheme: CustomTheme.darkTheme,
            themeMode:
                selectedMode, // listen our notifier and display the selected theme
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool checkboxValue = false;
  double sliderValue = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeMode currentMode = modeNotifier.value;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
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
                    activeColor: Theme.of(context).colorScheme.primary,
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
                    activeColor: Theme.of(context).colorScheme.primary,
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
                  selectedColor: Theme.of(context).colorScheme.secondary,
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
                const CircularProgressIndicator(
                  value: null,
                  semanticsLabel: 'Linear progress indicator',
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
