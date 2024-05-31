@𝐌𝐲 𝐍𝐮𝐦𝐛𝐞𝐫 Next replace the add_habit_screen with these codes: import 'package:flutter/material.dart';

class AddHabitScreen extends StatefulWidget {
  final Function(String, String, DateTime?) onAddHabit;

  const AddHabitScreen({required this.onAddHabit, super.key});

  @override
  _AddHabitScreenState createState() => _AddHabitScreenState();
}

class _AddHabitScreenState extends State<AddHabitScreen> {
  final _habitNameController = TextEditingController();
  final _habitFrequencyController = TextEditingController();
  DateTime? _selectedDate;
  bool _showDatePicker = false;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Habit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _habitNameController,
              decoration: const InputDecoration(
                labelText: 'Habit Name',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _habitFrequencyController,
              decoration: const InputDecoration(
                labelText: 'Frequency',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'No Date Chosen!'
                        : 'Picked Date: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                  ),
                ),
                Switch(
                  value: _showDatePicker,
                  onChanged: (value) {
                    setState(() {
                      _showDatePicker = value;
                      if (!_showDatePicker) {
                        _selectedDate = null;
                      }
                    });
                  },
                ),
                _showDatePicker
                    ? TextButton(
                        onPressed: _presentDatePicker,
                        child: const Text(
                          'Choose Date',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_habitNameController.text.isEmpty ||
                    _habitFrequencyController.text.isEmpty) {
                  return;
                }
                widget.onAddHabit(
                  _habitNameController.text,
                  _habitFrequencyController.text,
                  _selectedDate,
                );
                Navigator.of(context).pop();
              },
              child: const Text('Add Habit'),
            ),
          ],
        ),
      ),
    );
  }
}