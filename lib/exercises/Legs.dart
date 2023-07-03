import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_workout/screens/legs/Legs1.dart';
import 'package:gym_workout/screens/legs/Legs2.dart';
import 'package:gym_workout/screens/legs/Legs3.dart';
import 'package:gym_workout/screens/legs/Legs4.dart';
import 'package:gym_workout/screens/legs/Legs5.dart';

class LegsScreen extends StatelessWidget {
  LegsScreen({super.key});

  List imgs = [
    'assets/gifs/leg1.gif',
    'assets/gifs/leg2.gif',
    'assets/gifs/leg3.gif',
    'assets/gifs/leg4.gif',
    'assets/gifs/leg5.gif',
  ];

  List titles = [
    'Lever lying leg\ncurl thighs',
    'Leg press calf\nraise',
    'Barbell hip thrusts',
    'Squat hold calf\nraise',
    'Barbell clean grip\nfront squat thighs',
  ];

  List screens = const [
    Legs1(),
    Legs2(),
    Legs3(),
    Legs4(),
    Legs5(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            'Legs',
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: size.height * 0.25,
                width: size.width * 1,
                child: Image.asset(
                  'assets/sh.png',
                  fit: BoxFit.fill,
                )),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Legs',
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                '5 Workouts for bignner',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(96, 110, 108, 108),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                            size: 25,
                          ),
                          Text(
                            '60 min',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 70),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(96, 110, 108, 108),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Row(
                        children: [
                          Image.asset('assets/Flame.png'),
                          const Text(
                            '  350 Cal',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Padding(
              padding:
                  EdgeInsets.only(left: 10, top: 20, bottom: 10, right: 10),
              child: Text(
                'Want your body to be healthy. Join our program with directions according to body’s goals. Increasing physical strength is the goal of strenght training. Maintain body fitness by doing physical exercise at least 2-3 times a week. ',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(screens[index]);
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: size.height * 0.1,
                                width: size.width * 0.3,
                                child: Image.asset(
                                  imgs[index],
                                  fit: BoxFit.fill,
                                )),
                            Expanded(
                              child: ListTile(
                                title: Row(
                                  children: [
                                    Text(
                                      titles[index],
                                      softWrap: true,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "00:10",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
