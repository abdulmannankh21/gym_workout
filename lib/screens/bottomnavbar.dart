import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';

import 'package:gym_workout/screens/homepage.dart';
import 'package:gym_workout/screens/recipe_screen.dart';
import 'package:gym_workout/screens/settings.dart';

import 'package:gym_workout/workouts/workout.dart';

class MyNavBar extends StatefulWidget {
  const MyNavBar({super.key});

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  int selectedPage = 0;
  final _pageOptions = [
    const HomePage(),
    const WorkoutScreen(),
    const RecipeScreen(),
     SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _pageOptions[selectedPage],
      bottomNavigationBar: CircleNavBar(
        cornerRadius: BorderRadius.circular(10),
        activeIcons: [
          Container(
            padding: const EdgeInsets.all(15),
            child: const Icon(
              Icons.home,
              color: Colors.green,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: const Icon(
              Icons.workspaces_outline,
              color: Colors.green,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: const Icon(
              Icons.food_bank_outlined,
              color: Colors.green,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: const Icon(
              Icons.settings,
              color: Colors.green,
            ),
          ),
        ],
        inactiveIcons: const [
          Text(
            "Home",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            "Workout",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            "Diet",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            "Settings",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
        color: Colors.transparent,
        height: 50,
        circleWidth: 50,
        shadowColor: Colors.transparent,
        onChanged: (initIndex) {
          setState(() {
            selectedPage = initIndex;
          });
        },
        initIndex: 0,
      ),
    );
  }
}
