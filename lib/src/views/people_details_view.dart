import 'package:flutter/material.dart';

import '../models/person_item.dart';

class PeopleDetailsView extends StatefulWidget {
  const PeopleDetailsView({
    super.key,
  });

  static const routeName = '/people';

  @override
  State<PeopleDetailsView> createState() => _PeopleDetailsViewState();
}

class _PeopleDetailsViewState extends State<PeopleDetailsView> {
  final List<PersonItem> people = const [
    PersonItem('Jason Suttles', PersonType.family),
    PersonItem('John Rivera', PersonType.family),
    PersonItem('Doyle Navarro', PersonType.friend),
    PersonItem('Jane Doe', PersonType.friend),
    PersonItem('John Smith', PersonType.friend),
    PersonItem('Mary Johnson', PersonType.acquaintance),
    PersonItem('Michael Jones', PersonType.acquaintance),
    PersonItem('Sarah Miller', PersonType.other),
  ];
  List<PersonItem> filteredPeople = [];

  @override
  void initState() {
    filteredPeople = people;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('People'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (String value) {
                setState(() {
                  filteredPeople = people.where((PersonItem person) {
                    return person.name
                        .toLowerCase()
                        .contains(value.toLowerCase());
                  }).toList();
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredPeople.length,
              restorationId: 'peopleListView',
              itemBuilder: (BuildContext context, int index) {
                final item = filteredPeople[index];
                return ListTile(
                  title: Text(item.name),
                  leading: const Icon(Icons.person),
                  subtitle: Text(item.displayType()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
