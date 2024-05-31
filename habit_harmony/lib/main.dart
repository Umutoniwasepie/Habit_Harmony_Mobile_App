import 'package:flutter/material.dart';
import 'app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Harmony',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HabitsScreen(),
    );
  }
}

class HabitsScreen extends StatefulWidget {
  const HabitsScreen({super.key});

  @override
  _HabitsScreenState createState() => _HabitsScreenState();
}

class _HabitsScreenState extends State<HabitsScreen> {
  final _habitNameController = TextEditingController();
  final _habitFrequencyController = TextEditingController();
  final List<Habit> _habits = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habit Harmony'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _habitNameController,
                        decoration: const InputDecoration(
                          labelText: 'Habit Name',
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        controller: _habitFrequencyController,
                        decoration: const InputDecoration(
                          labelText: 'Frequency',
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _habits.add(Habit(
                        name: _habitNameController.text,
                        frequency: _habitFrequencyController.text,
                        isCompleted: false,
                      ));
                      _habitNameController.clear();
                      _habitFrequencyController.clear();
                    });
                  },
                  child: const Text('Add Habit'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _habits.length,
              itemBuilder: (context, index) {
                return HabitItem(habit: _habits[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Habit {
  Habit(
      {required this.name, required this.frequency, required this.isCompleted});

  String name;
  String frequency;
  bool isCompleted;
}

class HabitItem extends StatefulWidget {
  final Habit habit;

  const HabitItem({super.key, required this.habit});

  @override
  _HabitItemState createState() => _HabitItemState();
}

class _HabitItemState extends State<HabitItem> {
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    _isCompleted = widget.habit.isCompleted;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: _isCompleted,
        onChanged: (value) {
          setState(() {
            _isCompleted = value!;
          });
        },
      ),
      title: Text(widget.habit.name),
      subtitle: Text(widget.habit.frequency),
    );
  }
}
