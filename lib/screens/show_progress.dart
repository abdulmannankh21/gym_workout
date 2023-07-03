import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:gym_workout/screens/BottomNavBar.dart';

import '../sizes.dart';
import '../widgets/customButton.dart';

class Progressbar extends StatefulWidget {
  const Progressbar({super.key});

  @override
  State<Progressbar> createState() => _ProgressbarState();
}

class _ProgressbarState extends State<Progressbar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Row(
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
                ),
                const SizedBox(
                  height: 80,
                ),
                const SizedBox(
                  width: 180,
                  child: CircleProgressBar(
                    foregroundColor: Colors.green,
                    backgroundColor: Colors.grey,
                    value: 0.8,
                    child: Center(
                      child: AnimatedCount(
                        style: TextStyle(color: Colors.white),
                        fractionDigits: 0,
                        count: 90,
                        unit: '%',
                        duration: Duration(milliseconds: 500),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                    txt: "Next",
                    width: AppSizes.width! * 0.5,
                    hight: AppSizes.height! * 0.05,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyNavBar()));
                    },
                    margin: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.blue, Colors.green],
                        ),
                        borderRadius: BorderRadius.circular(40)))
              ],
            ),
          )),
    );
  }
}
