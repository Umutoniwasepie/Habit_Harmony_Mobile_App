import 'package:flutter/material.dart';
import 'add_habit_screen.dart'; // Import the AddHabitScreen

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
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Habit> _habits = [];

  void _addHabit(String name, String frequency) {
    setState(() {
      _habits.add(Habit(name: name, frequency: frequency, isCompleted: false));
    });
  }

  void _toggleHabitCompletion(int index) {
    setState(() {
      _habits[index].isCompleted = !_habits[index].isCompleted;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = [
      HabitsScreen(
        habits: _habits,
        onToggleCompletion: _toggleHabitCompletion,
      ),
      AddHabitScreen(onAddHabit: _addHabit),
    ];

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Habits',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Habit',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HabitsScreen extends StatelessWidget {
  final List<Habit> habits;
  final Function(int) onToggleCompletion;

  const HabitsScreen({
    required this.habits,
    required this.onToggleCompletion,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habit Harmony'),
      ),
      body: habits.isEmpty
          ? const Center(child: Text('No habits added yet.'))
          : ListView.builder(
              itemCount: habits.length,
              itemBuilder: (context, index) {
                return HabitItem(
                  habit: habits[index],
                  onToggleCompletion: () => onToggleCompletion(index),
                );
              },
            ),
    );
  }
}

class Habit {
  Habit(
      {required this.name, required this.frequency, this.isCompleted = false});

  String name;
  String frequency;
  bool isCompleted;
}

class HabitItem extends StatelessWidget {
  final Habit habit;
  final VoidCallback onToggleCompletion;

  const HabitItem(
      {required this.habit, required this.onToggleCompletion, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: habit.isCompleted,
        onChanged: (value) {
          onToggleCompletion();
        },
      ),
      title: Text(habit.name),
      subtitle: Text(habit.frequency),
    );
  }
}
