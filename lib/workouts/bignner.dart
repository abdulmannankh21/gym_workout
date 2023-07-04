import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_workout/exercises/abs.dart';
import 'package:gym_workout/exercises/back.dart';
import 'package:gym_workout/exercises/biceps.dart';
import 'package:gym_workout/exercises/legs.dart';
import 'package:gym_workout/exercises/shoulders.dart';
import '../exercises/chest.dart';
import '../exercises/triceps.dart';

class Bigner extends StatelessWidget {
  const Bigner({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    Get.to(ShoulderScreen());
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(
                          'assets/shoulder.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          bottom: 0.0,
                          child: Text(
                            "Shoulder",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )),
                    ],
                  )),
              GestureDetector(
                  onTap: () {
                    Get.to(ChestScreen());
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(
                          'assets/chest.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          bottom: 0.0,
                          child: Text(
                            "Chest",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )),
                    ],
                  )),

            ],
          ),
          SizedBox(
            height: size.height * 0.06,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    Get.to(BackScreen());
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(
                          'assets/wings.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          bottom: 0.0,
                          child: Text(
                            "Wings",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )),
                    ],
                  )),
              GestureDetector(
                  onTap: () {
                    Get.to(LegsScreen());
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(
                          'assets/leg.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          bottom: 0.0,
                          child: Text(
                            "Legs",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )),
                    ],
                  )),
            ],
          ),
          SizedBox(
            height: size.height * 0.06,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    Get.to(AbsScreen());
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(
                          'assets/abs.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          bottom: 0.0,
                          child: Text(
                            "Abs",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )),
                    ],
                  )),
              GestureDetector(
                  onTap: () {
                    Get.to(BicepsScreen());
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(
                          'assets/bicep.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          bottom: 0.0,
                          child: Text(
                            "Bicep",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )),
                    ],
                  )),
            ],
          ),
          SizedBox(
            height: size.height * 0.06,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    Get.to(TricepsScreen());
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(
                          'assets/tricep.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          bottom: 0.0,
                          child: Text(
                            "Tricep",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
