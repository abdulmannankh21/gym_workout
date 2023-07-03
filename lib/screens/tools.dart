import 'package:flutter/material.dart';

import '../tutorials/tutorials.dart';

class ToolsScreen extends StatelessWidget {
  const ToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Tools',
          style: TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TutorialScreen()));
              },
              child: Image.asset('assets/1.png')),
          const SizedBox(
            height: 5,
          ),
          GestureDetector(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => RecipeScreen()));
              },
              child: Image.asset('assets/2.png')),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
