import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_workout/exercises/biceps.dart';

import '../exercises/abs.dart';
import '../exercises/back.dart';
import '../exercises/chest.dart';
import '../exercises/legs.dart';
import '../exercises/shoulders.dart';
import '../exercises/triceps.dart';

class Intrmediate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Get.to(ShoulderScreen());
                  },
                  child: SizedBox(
                      width: size.width * 0.35,
                      child: Image.asset('assets/w1.png'))),
              SizedBox(
                width: size.width * 0.09,
              ),
              GestureDetector(
                  onTap: () {
                    Get.to(ChestScreen());
                  },
                  child: SizedBox(
                      width: size.width * 0.35,
                      child: Image.asset('assets/w2.png'))),
            ],
          ),
          SizedBox(
            height: size.height * 0.07,
          ),
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Get.to(BackScreen());
                  },
                  child: SizedBox(
                      width: size.width * 0.35,
                      child: Image.asset('assets/w3.png'))),
              SizedBox(
                width: size.width * 0.09,
              ),
              GestureDetector(
                  onTap: () {
                    Get.to(AbsScreen());
                  },
                  child: SizedBox(
                      width: size.width * 0.35,
                      child: Image.asset('assets/w4.png'))),
            ],
          ),
          SizedBox(
            height: size.height * 0.07,
          ),
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Get.to(LegsScreen());
                  },
                  child: SizedBox(
                      width: size.width * 0.35,
                      child: Image.asset('assets/w5.png'))),
              SizedBox(
                width: size.width * 0.09,
              ),
              GestureDetector(
                  onTap: () {
                    Get.to(BicepsScreen());
                  },
                  child: SizedBox(
                      width: size.width * 0.35,
                      child: Image.asset('assets/w6.png'))),
            ],
          ),
          SizedBox(
            height: size.height * 0.07,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    Get.to(TricepsScreen());
                  },
                  child: SizedBox(
                      width: size.width * 0.35,
                      child: Image.asset('assets/w7.png'))),
            ],
          ),
          SizedBox(
            height: size.height * 0.07,
          ),
        ],
      ),
    );
  }
}
