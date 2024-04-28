import 'package:flutter/material.dart';

import '../types/friend_item.dart';

/// Displays detailed information about a SampleItem.
class FriendsDetailsView extends StatelessWidget {
  const FriendsDetailsView({
    super.key,
    this.friends = const [
      FriendItem('Jason Suttles', ''),
      FriendItem('John Rivera', ''),
      FriendItem('Doyle Navarro', ''),
      FriendItem('Jane Doe', ''),
      FriendItem('John Smith', ''),
      FriendItem('Mary Johnson', ''),
      FriendItem('Michael Jones', ''),
      FriendItem('Sarah Miller', ''),
    ],
  });

  static const routeName = '/friends';

  final List<FriendItem> friends;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: const TextField(
              decoration: const InputDecoration(
                labelText: 'Search',
                suffixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: friends.length,
              restorationId: 'friendsListView',
              itemBuilder: (BuildContext context, int index) {
                final item = friends[index];
                return ListTile(
                  title: Text(item.name),
                  leading: const Icon(Icons.person),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
