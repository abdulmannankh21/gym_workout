import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tri4 extends StatelessWidget {
  const Tri4({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(children: [
          Card(
            elevation: 5,
            child: Container(
              height: size.height * 0.35,
              width: size.width * 0.96,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  FittedBox(
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                    child: SizedBox(
                      height: size.height * 0.28,
                      width: size.width * 0.94,
                      child: Image.asset('assets/gifs/tri4.gif'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.92,
            child: const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ),
          Text(
            'Seated leg raise waist',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          // const Text(
          //   '4 Sets x 12 Reps',
          //   style: TextStyle(
          //     fontSize: 20,
          //   ),
          // ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Card(
            elevation: 5,
            child: Container(
              margin: const EdgeInsets.all(10),
              width: size.width * 0.96,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'TARGET MUSCLES:',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.055,
                  ),
                  const Text(
                    'Abs',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              margin: const EdgeInsets.all(10),
              width: size.width * 0.96,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'PREPARATION AND EXECUTION:',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Text(
                    'Sit on edge of bench with legs extended to floor.'
                    'Place weight between ankles or use no weight. Grasp edge of bench. Lean torso back and balance body weight on edge of bench'
                    '\n\n1.	Raise legs by flexing hips and knees while pulling torso slightly forward to maintain balance.'
                    '\n\n2.	Return by extending hips and knees and lean torso back to counter balance. Repeat.',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    ));
  }
}
