import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Legs1 extends StatelessWidget {
  const Legs1({super.key});

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
                      child: Image.asset('assets/gifs/leg1.gif'),
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
            'Lever lying leg curl thighs',
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
                    'Hamstrings, Calves',
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
                    'Lie face down on the machine. Secure your ankles under the lever pad and hands on the handles.'
                    '\n\n1.	Squeeze your hamstrings to curl your legs up and raise your heels towards your hips, keeping your thighs and hips on the bench.'
                    '\n\n2.	Hold for a count at the top position.'
                    '\n\n3.	Return to the starting position and repeat.',
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
