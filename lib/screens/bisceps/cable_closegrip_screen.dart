import 'package:flutter/material.dart';
import 'package:get/get.dart';
 

import '../../preference_controller.dart';

class Biceps2 extends StatelessWidget {
   Biceps2({super.key});

    final PreferenceController prefsController = Get.put(PreferenceController());
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
                      child: Image.asset('assets/gifs/bi5.gif'),
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
            'Cable close grip curl upper arms',
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
            height: size.height * 0.02,
          ),
          Card(
            elevation: 5,
            child: Container(
              margin: const EdgeInsets.all(10),
              height: size.height * 0.07,
              width: size.width * 0.96,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'TARGET MUSCLES:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Biceps, Forearms',
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Text(
                    'Stand and hold the bar connected to the low pulley in an underhand grip and shoulder width apart with elbows tucked to your sides.'
                    '\n\n1.	Curl the bar up until your forearms touch your chest.'
                    '\n\n2.	Pause for a count and squeeze your biceps.'
                    '\n\n3.	Lower the bar to the starting position and repeat.',
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
