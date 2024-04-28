import 'package:flutter/material.dart';
import 'package:spend_time_together_app/src/main_menu/friends_details_view.dart';

import '../settings/settings_view.dart';
import 'main_menu_item.dart';
import 'sample_item_details_view.dart';

/// Displays a list of SampleItems.
class MainMenuItemListView extends StatelessWidget {
  const MainMenuItemListView({
    super.key,
    this.items = const [
      MainMenuItem(
          'New event',
          Icon(
            Icons.add,
            color: Colors.pink,
            size: 24.0,
          )),
      MainMenuItem(
          'Setup schedule',
          Icon(
            Icons.calendar_month,
            color: Colors.pink,
            size: 24.0,
          )),
      MainMenuItem(
          'Friends',
          Icon(
            Icons.people,
            color: Colors.pink,
            size: 24.0,
          )),
      MainMenuItem(
          'Activities',
          Icon(
            Icons.favorite,
            color: Colors.pink,
            size: 24.0,
          ))
    ],
  });

  static const routeName = '/';

  final List<MainMenuItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spend Time Together!'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'mainMenuItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ListTile(
              title: Text(item.text),
              leading: item.icon,
              onTap: () {
                switch (item.text) {
                  case 'Friends':
                    Navigator.restorablePushNamed(
                        context, FriendsDetailsView.routeName);
                    break;
                  case 'New event':
                  case 'Setup schedule':
                  case 'Activities':
                  default:
                    Navigator.restorablePushNamed(
                      context,
                      SampleItemDetailsView.routeName,
                    );
                }
              });
        },
      ),
    );
  }
}