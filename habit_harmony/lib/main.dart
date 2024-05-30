import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Harmony',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Habit Harmony'),
        ),
        body: HabitScreen(),
      ),
    );
  }
}

class HabitScreen extends StatefulWidget {
  @override
  _HabitScreenState createState() => _HabitScreenState();
}

class _HabitScreenState extends State<HabitScreen> {
  final _formKey = GlobalKey<FormState>();
  final _habitNameController = TextEditingController();
  final _habitFrequencyController = TextEditingController();
  List<Habit> _habits = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Habit creation form
        Container(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _habitNameController,
                  decoration: InputDecoration(
                    labelText: 'Habit Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a habit name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _habitFrequencyController,
                  decoration: InputDecoration(
                    labelText: 'Habit Frequency',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a habit frequency';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _habits.add(Habit(
                          name: _habitNameController.text,
                          frequency: _habitFrequencyController.text,
                          isCompleted: false,
                        ));
                        _habitNameController.clear();
                        _habitFrequencyController.clear();
                      });
                    }
                  },
                  child: Text('Add Habit'),
                ),
              ],
            ),
          ),
        ),
        // Habit list
        Expanded(
          child: ListView.builder(
            itemCount: _habits.length,
            itemBuilder: (context, index) {
              return HabitItem(habit: _habits[index]);
            },
          ),
        ),
      ],
    );
  }
}

class Habit {
  String name;
  String frequency;
  bool isCompleted;

  Habit({required this.name, required this.frequency, required this.isCompleted});
}

class HabitItem extends StatelessWidget {
  final Habit habit;

  HabitItem({required this.habit});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: habit.isCompleted,
        onChanged: (value) {
          // Handle checkbox state
        },
      ),
      title: Text(habit.name),
      subtitle: Text(habit.frequency),
    );
  }
}