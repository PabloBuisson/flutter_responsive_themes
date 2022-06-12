import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool checkboxValue = false;
  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          data:
              Theme.of(context).copyWith(backgroundColor: Colors.purpleAccent),
          child: const CircularProgressIndicator(
            value: null,
            semanticsLabel: 'Linear progress indicator',
          ),
        ),
      ],
    );
  }
}
