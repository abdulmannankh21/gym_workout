import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_workout/screens/login_signup_screen.dart';
import 'package:gym_workout/sizes.dart';
import 'package:gym_workout/workouts/workout.dart';

import '../widgets/customButton.dart';

class ChoseLoginOfline extends StatelessWidget {
  const ChoseLoginOfline({super.key});

  @override
  Widget build(BuildContext context) {
    double wt = MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'GYM ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                Image.asset('assets/icon.png'),
                const Text(
                  ' WORKOUT',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: ht * 0.25,
            ),
            CustomButton(
                txt: "Sign In",
                width: AppSizes.width! * 0.5,
                hight: AppSizes.height! * 0.05,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginSignUpScreen(true)));
                },
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.green],
                    ),
                    borderRadius: BorderRadius.circular(40))),
            CustomButton(
                txt: "Sign Up",
                width: AppSizes.width! * 0.5,
                hight: AppSizes.height! * 0.05,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginSignUpScreen(false)));
                },
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.green],
                    ),
                    borderRadius: BorderRadius.circular(40))),
            SizedBox(
              width: wt * 0.28,
              height: ht * 0.04,
              child: const Divider(
                thickness: 1,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: ht * 0.02,
            ),
            const Text(
              'OR ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: ht * 0.01,
            ),
            CustomButton(
                txt: "Go Offline",
                width: AppSizes.width! * 0.5,
                hight: AppSizes.height! * 0.05,
                onPressed: () {
                  Get.to(const WorkoutScreen());
                },
                margin: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.green],
                    ),
                    borderRadius: BorderRadius.circular(40))),
          ],
        ),
      ),
    );
  }
}
