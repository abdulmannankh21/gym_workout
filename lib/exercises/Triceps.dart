import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/triceps/Tri1.dart';
import '../screens/triceps/Tri2.dart';
import '../screens/triceps/Tri3.dart';
import '../screens/triceps/Tri4.dart';
import '../screens/triceps/Tri5.dart';
import '../screens/triceps/Tri6.dart';

class TricepsScreen extends StatelessWidget {
  TricepsScreen({super.key});

  List imgs = [
    'assets/gifs/tri1.gif',
    'assets/gifs/tri2.gif',
    'assets/gifs/tri3.gif',
    'assets/gifs/tri4.gif',
    'assets/gifs/tri5.gif',
    'assets/gifs/tri6.gif'
  ];

  List titles = [
    'Bench reverse dips\nupper arms',
    'One hand triceps kick\nback upper arms',
    'Ez bar lying close grip\ntriceps extension behind\nhead',
    'Cable triceps push\ndown upper arms',
    'Cable high pulley\noverhead triceps ',
    'Barbell decline close\ngrip to skull press\nupper arms'
  ];

  List screens = const [
    Tri1(),
    Tri2(),
    Tri3(),
    Tri4(),
    Tri5(),
    Tri6(),
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
            'Triceps',
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
                'Triceps',
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                '6 Workouts for bignner',
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
                  itemCount: 6,
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
