import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Biceps4 extends StatelessWidget {
  const Biceps4({super.key});

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
                      child: Image.asset('assets/gifs/bi3.gif'),
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
            'Rope biceps Hammer curl upper arms',
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
              height: size.height * 0.07,
              width: size.width * 0.96,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'TARGET MUSCLES:',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Text(
                    'Stand with feet shoulder width apart. Hold the rope attachment in front of your thighs with palms facing each other. Extend arms tucked to your sides.'
                    '\n\n1.	Squeeze your biceps to bend your elbows and curl the rope up to the height of your chest.'
                    '\n\n2.	Return to the starting position slowly and repeat.',
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
