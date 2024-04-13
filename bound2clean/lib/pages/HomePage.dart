import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.blue[200],

      appBar: myAppBar(),



      body: const Center(
        child: Text('Heyyyy World!'),
      ),
      

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.scoreboard_rounded),
            label: 'Missions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_rounded),
            label: 'Calendar',
          ),
        ],
        selectedItemColor: Colors.yellow[500],
        unselectedItemColor: Colors.white,
        iconSize: 30,
      )

      
    );
  }

  AppBar myAppBar() {
    return AppBar(
      title: const Text(
        'Bound 2 Clean',
        style: TextStyle(
          fontWeight: FontWeight.bold),
          ),
      backgroundColor: Colors.blue[600],
      foregroundColor: Colors.white, //Top Bar Text Color
      shadowColor: Colors.black,
      elevation: 10,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.person_rounded),
          iconSize: 30,
          onPressed: () {
          //For use later
          },
        ),
      ],
    );
  }
}