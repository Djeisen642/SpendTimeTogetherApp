import 'package:flutter/material.dart';

import '../models/activity.dart';

class ActivitiesView extends StatefulWidget {
  const ActivitiesView({
    super.key,
  });

  static const routeName = '/activities';

  @override
  State<ActivitiesView> createState() => _PeopleDetailsViewState();
}

class _PeopleDetailsViewState extends State<ActivitiesView> {
  final addActivityTextController = TextEditingController();
  final addActivityTextFocus = FocusNode();

  Set<Activity> activities = <Activity>{
    Activity('Running'),
    Activity('Cycling'),
    Activity('Hiking'),
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Activities'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: addActivityTextController,
                focusNode: addActivityTextFocus,
                decoration: const InputDecoration(
                  labelText: 'Add an activity',
                  suffixIcon: Icon(Icons.add),
                ),
                onSubmitted: (String value) {
                  setState(() {
                    activities.add(Activity(value));
                  });
                  addActivityTextController.clear();
                  addActivityTextFocus.requestFocus();
                },
              ),
            ),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: activities
                  .map((activity) => InputChip(
                        label: Text(activity.name),
                        backgroundColor: activity.color,
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        onDeleted: () {
                          setState(() {
                            activities.remove(activity);
                          });
                        },
                      ))
                  .toList(),
            ),
          ],
        ));
  }
}
