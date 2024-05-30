import 'package:flutter/material.dart';

void main() {
  runApp(const HabitTrackerApp());
}

class HabitTrackerApp extends StatelessWidget {
  const HabitTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HabitTrackerHomePage(),
    );
  }
}

class HabitTrackerHomePage extends StatefulWidget {
  const HabitTrackerHomePage({super.key});

  @override
  _HabitTrackerHomePageState createState() => _HabitTrackerHomePageState();
}

class _HabitTrackerHomePageState extends State<HabitTrackerHomePage> {
  final List<Habit> _habits = [];
  final TextEditingController _habitNameController = TextEditingController();
  final TextEditingController _habitFrequencyController = TextEditingController();

  void _addHabit() {
    final String name = _habitNameController.text;
    final String frequency = _habitFrequencyController.text;

    if (name.isNotEmpty && frequency.isNotEmpty) {
      setState(() {
        _habits.add(Habit(name: name, frequency: frequency));
      });

      _habitNameController.clear();
      _habitFrequencyController.clear();
    }
  }

  void _toggleHabitCompletion(int index) {
    setState(() {
      _habits[index].isCompleted = !_habits[index].isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habit Tracker'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _habitNameController,
                  decoration: const InputDecoration(
                    labelText: 'Habit Name',
                  ),
                ),
                TextField(
                  controller: _habitFrequencyController,
                  decoration: const InputDecoration(
                    labelText: 'Frequency',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _addHabit,
                  child: const Text('Add Habit'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _habits.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Checkbox(
                    value: _habits[index].isCompleted,
                    onChanged: (value) {
                      _toggleHabitCompletion(index);
                    },
                  ),
                  title: Text(_habits[index].name),
                  subtitle: Text('Frequency: ${_habits[index].frequency} times/day'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Habit {
  final String name;
  final String frequency;
  bool isCompleted;

  Habit({
    required this.name,
    required this.frequency,
    this.isCompleted = false,
  });
}
