import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 20, 45),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Text('Current Hygiene Streak:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        Text('24 Days!', style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
      );
  }
}