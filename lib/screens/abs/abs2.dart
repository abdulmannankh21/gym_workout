import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../preference_controller.dart';

class Abs2 extends StatelessWidget {
   Abs2({super.key});
   final PreferenceController prefsController = Get.put(PreferenceController());

  @override
    Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: SingleChildScrollView(
          child: Column(children: [
            Card(
              elevation: 5,
              child: SizedBox(
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
                        child: Image.asset('assets/gifs/abs2.gif'),
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
              'Wheel roll out waist fix waist',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

              prefsController.isloggedin ?
             Column(
               children: [
                 Text(
                  'Reps: ${prefsController.reps}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
            ),
                 Text("Repition:${prefsController.repetitions}",style: TextStyle(
                   fontSize: 20,
                 ),),
               ],
             ):SizedBox(),
            SizedBox(
              height: size.height * 0.01,
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
                      'Abs, Shoulders, Back',
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
                      'Put the wheel roller right under your shoulders on the floor. Kneel on the floor and hold the handles of the wheel roller with your arms extended.'
                      '\n\n1. Inhale and slowly roll the wheel forward until your torso is parallel to the ground.'
                      '\n\n2.	Pause for a count when your body is fully extended.'
                      '\n\n3. Exhale and pull the wheel back towards yourself to the starting position and repeat.',
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
      ),
    ));
  }
}
