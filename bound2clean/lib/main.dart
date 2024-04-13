import 'package:flutter/material.dart';
import 'pages/HomePage.dart';
import 'pages/Missions.dart';
import 'pages/Calendar.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bound 2 Clean',
      home: BottomTabBar(), //This is the page that will be displayed
    );
  }
}


class BottomTabBar extends StatefulWidget {
  const BottomTabBar({Key? key}) : super(key: key);

  @override
  _BottomTabBarState createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int _currentIndex = 1;

  final List<Widget> _children = [
    Missions(),
    HomePage(),
    Calendar(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: myAppBar(),
      body: _children[_currentIndex],
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
      backgroundColor: Colors.blue[900],
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
      selectedItemColor: Colors.yellow[400],
      unselectedItemColor: Colors.white,
    );
  }
}
