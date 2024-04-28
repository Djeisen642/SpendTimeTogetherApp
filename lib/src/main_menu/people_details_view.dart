import 'package:flutter/material.dart';

import '../utils/person_item.dart';

/// Displays detailed information about a SampleItem.
class FriendsDetailsView extends StatelessWidget {
  const FriendsDetailsView({
    super.key,
    this.people = const [
      PersonItem('Jason Suttles', PersonType.family),
      PersonItem('John Rivera', PersonType.family),
      PersonItem('Doyle Navarro', PersonType.friend),
      PersonItem('Jane Doe', PersonType.friend),
      PersonItem('John Smith', PersonType.friend),
      PersonItem('Mary Johnson', PersonType.acquaintance),
      PersonItem('Michael Jones', PersonType.acquaintance),
      PersonItem('Sarah Miller', PersonType.other),
    ],
  });

  static const routeName = '/people';

  final List<PersonItem> people;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('People'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: people.length,
              restorationId: 'peopleListView',
              itemBuilder: (BuildContext context, int index) {
                final item = people[index];
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
