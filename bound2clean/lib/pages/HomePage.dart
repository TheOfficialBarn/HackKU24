import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: myAppBar(),
      body: const Center(
        child: Text('Heyyyy World!'),
      ),
      bottomNavigationBar: myBottomNavigationBar(),
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
      shadowColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 4.0,
    );
  }

  BottomNavigationBar myBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
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
    );
  }
}