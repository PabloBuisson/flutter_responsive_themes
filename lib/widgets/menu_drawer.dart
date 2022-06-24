import 'package:flutter/material.dart';

import '../constants.dart';
import '../notifiers.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: const BoxDecoration(
                    color: Colors.grey, // placeholder color
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://avatars.githubusercontent.com/u/41048008?v=4'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Pablo Buisson',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
                Text(
                  'Your personal account',
                  style: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.7)),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text("Profile"),
            onTap: () {
              screenNotifier.value = Screen.profile;
              Navigator.pop(context);
            },
          ),
          ListTile(
              leading: const Icon(Icons.palette),
              title: const Text("Themes"),
              onTap: () {
                screenNotifier.value = Screen.theme;
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
