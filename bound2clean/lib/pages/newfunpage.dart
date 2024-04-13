import 'package:flutter/material.dart';

class NewFunPage extends StatelessWidget {
  const NewFunPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: const Text('Bound 2 Clean'), //You don't need const but we can edit this later
        backgroundColor: Colors.blue[600],
        foregroundColor: Colors.white, //Top Bar Text Color
      ),
      body: const Center(
        child: Text('Hi World!'),
      ),
    );
  }
}