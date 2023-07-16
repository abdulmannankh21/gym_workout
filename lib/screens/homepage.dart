import 'package:flutter/material.dart';
import '../exercises/backs.dart';
import '../exercises/bicep.dart';
import '../exercises/chests.dart';
import '../exercises/leg.dart';
import '../exercises/shoulder.dart';
import '../exercises/tricep.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List names = [
    'Simple Warm-up Exercise',
    'Chin Ups',
    'Simple Warm-up Exercise',
    'Chin Ups',
    'Chin Ups'
  ];

  @override
  Widget build(BuildContext context) {
    // Get the current DateTime
    final now = DateTime.now();

    // Get the current day of the week (Monday: 1, Tuesday: 2, etc.)
    final currentDay = now.weekday;

    // Define a function to handle navigation based on the day
    Widget? navigateToScreen() {
      switch (6) {
        case DateTime.monday:
          return ChestsScreen();
        case DateTime.tuesday:
          return BacksScreen();
        case DateTime.wednesday:
          return ShouldersScreen();
        case DateTime.thursday:
          return BicepScreen();
        case DateTime.friday:
          return TricepScreen();

        case DateTime.saturday:
          return LegScreen();
        default:
          return null;
      }
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            "Home",
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Exercise in Log",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(20)),
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child:
              navigateToScreen() ),
            ],
          ),
        ),
      ),
    );
  }
}
