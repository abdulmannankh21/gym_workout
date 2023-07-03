import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../exercises/Biceps.dart';
import '../exercises/Chest.dart';
import '../exercises/Abs.dart';
import '../exercises/Back.dart';
import '../exercises/Legs.dart';
import '../exercises/Shoulders.dart';
import '../exercises/Triceps.dart';

class Advnace extends StatelessWidget {
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
