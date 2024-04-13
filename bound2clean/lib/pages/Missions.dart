import 'package:flutter/material.dart';
import 'package:bound2clean/classes/tiles.dart';

class Missions extends StatefulWidget {
  const Missions({Key? key}) : super(key: key);

  @override
  _MissionsState createState() => _MissionsState();
}

class _MissionsState extends State<Missions> {
  List<String> tasks = ['Shower', 'Brush Teeth', 'Deodorant', 'Fragrance','Face Wash', 'Moisturizer']; // Add your tasks here
  List<bool> taskStatus = [false, false, false, false, false, false]; // Add your task status here

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