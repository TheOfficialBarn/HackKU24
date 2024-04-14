import 'package:flutter/material.dart';
import 'package:bound2clean/pages/Missions.dart';

// Counter variable to keep track of hygiene streak
int aCounter = 0;

/// HomePage widget is a StatefulWidget that represents the home page of the application.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

/// _HomePageState is the state class for the HomePage widget.
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set the background color of the scaffold
      backgroundColor: Color.fromARGB(255, 0, 20, 45),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Current Hygiene Streak',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32, // Increase font size for grand header
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              '$aCounter Days',
              style: TextStyle(
                color: Colors.red,
                fontSize: 60, // Increase font size
                fontWeight: FontWeight.w900
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // Increment the counter when the floating action button is pressed
            aCounter++;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}