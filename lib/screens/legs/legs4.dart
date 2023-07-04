import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Legs4 extends StatelessWidget {
  const Legs4({super.key});

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
                        child: Image.asset('assets/gifs/leg4.gif'),
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
            SizedBox(
              height: size.height * 0.02,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Squat hold calf raise',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            const Text(
              '4 Sets x 12 Reps',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
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
                      'Calves',
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
                      'Stand with feet shoulder width apart. Hold the squat position.'
                      '\n\n1.	Exhale and raise your legs as much as you can with the help of your toes.'
                      '\n\n2.	Inhale, slowly return to the starting position and repeat.',
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
