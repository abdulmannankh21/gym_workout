import 'package:flutter/material.dart';

import 'bignner.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            'Workouts',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: const Bigner());
  }
}
