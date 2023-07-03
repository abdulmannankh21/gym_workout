import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Legs2 extends StatelessWidget {
  const Legs2({super.key});

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
                        child: Image.asset('assets/gifs/leg2.gif'),
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
                'Leg press calf raise',
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
                      'Sit on the machine and position your toes shoulder width apart at the bottom of the platform. Hold handles on your sides.'
                      '\n\n1.	Exhale and press on the platform to extend your ankles as far as possible.'
                      '\n\n2.	Inhale and extend your calves to lower to the starting position slowly and repeat.',
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
