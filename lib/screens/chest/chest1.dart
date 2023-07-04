import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Chest1 extends StatelessWidget {
  const Chest1({super.key});

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
                      child: Image.asset('assets/gifs/chest1.gif'),
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
            'Barbell bent over row back fix',
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
                    'Back, Traps, Biceps',
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
                    'Hang on the bar with hands shoulder width apart and palms facing forward. Keep your arms extended and legs straight down.'
                    '\n\n1.	Exhale and squeeze your abs to lift your knees to your chest.'
                    '\n\n2.	Pause for a count, inhale and return to the starting position slowly and repeat.',
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
