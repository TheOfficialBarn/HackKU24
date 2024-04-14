import 'package:flutter/material.dart';
import 'package:bound2clean/classes/tiles.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A page that displays a list of missions for the day.
class Missions extends StatefulWidget {
  const Missions({Key? key}) : super(key: key);

  @override
  _MissionsState createState() => _MissionsState();
}

class _MissionsState extends State<Missions> {
  List<String> tasks = ['Shower', 'Brush Teeth', 'Deodorant', 'Fragrance','Face Wash', 'Moisturizer']; // Add your tasks here
  List<bool> taskStatus = [false, false, false, false, false, false]; // Add your task status here

  late bool incrementMade; // This is used to check if the increment has been made for the day
  late int lastOpenedDay; // This is used to check if the day has changed for resetting the ToDoList
  late int incrementVariable; // This is used to increment the variable for the day. It is a global because I want to use it in HomePage.dart
  // If something wrong it might have to do with late.

  @override
  void initState() {
    super.initState();
    loadPreferences();
  }

  /// Loads the preferences from shared preferences.
  void loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    lastOpenedDay = prefs.getInt('lastOpenedDay') ?? DateTime.now().day;
    incrementVariable = prefs.getInt('incrementVariable') ?? 0;
    incrementMade = prefs.getBool('incrementMade') ?? false;
    checkIfNewDay();
    checkIfAllTasksCompleted();
  }

  /// Saves the preferences to shared preferences.
  void savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lastOpenedDay', lastOpenedDay);
    await prefs.setInt('incrementVariable', incrementVariable);
    await prefs.setBool('incrementMade', incrementMade);
  }

  /// Checks if a new day has started and resets the task status accordingly.
  void checkIfNewDay() {
    if (DateTime.now().day != lastOpenedDay) {
      setState(() {
        taskStatus = [false, false, false, false, false, false];
        lastOpenedDay = DateTime.now().day;
        incrementMade = false;
        savePreferences(); // Save the changes
      });
    }
  }

  /// Checks if all tasks have been completed and increments the variable if they have.
  void checkIfAllTasksCompleted() {
    if (!incrementMade && taskStatus.every((task) => task)) {
      incrementVariable++;
      incrementMade = true;
      savePreferences(); // Save the changes
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Aligns children to the start (left for LTR languages)
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Today\'s Missions:', 
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, decoration: TextDecoration.underline, color: Colors.black),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ToDoTile(
                  taskName: tasks[index],
                  taskCompleted: taskStatus[index],
                  onChanged: (bool? newValue) {
                    setState(() {
                      taskStatus[index] = newValue!;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}