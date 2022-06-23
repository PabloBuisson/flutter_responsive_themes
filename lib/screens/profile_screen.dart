import 'package:flutter/material.dart';

enum Interest { sport, music, games, books, fashion, food }

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading = false;
  bool checkboxValue = true;
  bool switchValue = true;
  double sliderValue = 40;
  Map<Interest, bool> interests = {
    Interest.sport: true,
    Interest.games: true,
    Interest.music: true,
    Interest.books: true,
    Interest.fashion: false,
    Interest.food: false,
  };

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 16.0,
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
            height: 16.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 16.0,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Profile completion :",
                      style: Theme.of(context).toggleButtonsTheme.textStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Slider(
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
                    ),
                  ],
                ),
              ),
              CheckboxListTile(
                  title: const Text('Make profile private'),
                  enableFeedback: true,
                  value: checkboxValue,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue = value!;
                    });
                  }),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
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
              ),
              const SizedBox(
                height: 16.0,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'About me',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  for (var interest in interests.entries)
                    InputChip(
                      label: Text(interest.key.name),
                      selected: interest.value,
                      onSelected: (bool selected) {
                        setState(() {
                          interests.update(interest.key, (value) => selected);
                        });
                      },
                    ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                initialValue: "My short bio...",
                onChanged: (value) {
                  setState(() {
                    isLoading = true;
                  });

                  Future.delayed(const Duration(seconds: 2))
                      .then((value) => setState(() {
                            isLoading = false;
                          }));
                },
              ),
              if (isLoading)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Theme(
                    data: Theme.of(context)
                        .copyWith(primaryColor: Colors.purpleAccent),
                    child: const Center(
                      child: CircularProgressIndicator(
                        value: null,
                        semanticsLabel: 'Linear progress indicator',
                      ),
                    ),
                  ),
                )
              else
                const SizedBox(
                  height: 100.0,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
