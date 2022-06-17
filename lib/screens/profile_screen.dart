import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool checkboxValue = true;
  bool switchValue = true;
  double sliderValue = 20;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20.0,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight:
                  (screenWidth * 0.15) > 50.0 ? (screenWidth * 0.15) : 50.0,
              minHeight: 50.0),
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.grey, // placeholder color
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                    'https://avatars.githubusercontent.com/u/41048008?v=4'),
              ),
            ),
          ),
        ),
        // Using BoxFit.scaleDown and fixing the FontSize you can adjust the maximum size of the font.
        // If the content is small, it occupies the minimum width with the specified font size.
        // At the same time, if the content is large, it resizes to the smallest font size.
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'My profile',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth:
                  (screenWidth * 0.3) > 100.0 ? (screenWidth * 0.3) : 100.0,
              minWidth: 100.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CheckboxListTile(
                  title: const Text('Make profile private'),
                  enableFeedback: true,
                  value: checkboxValue,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue = value!;
                    });
                  }),
              const SizedBox(
                height: 20.0,
              ),
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    "Activate analytics",
                    style: Theme.of(context).toggleButtonsTheme.textStyle,
                  ),
                  Switch(
                      value: switchValue,
                      onChanged: (bool? value) {
                        setState(() {
                          switchValue = value!;
                        });
                      }),
                ],
              ),
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
      ],
    );
  }
}
