import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_workout/screens/legs/legs1.dart';
import 'package:gym_workout/screens/legs/legs2.dart';
import 'package:gym_workout/screens/legs/legs3.dart';
import 'package:gym_workout/screens/legs/legs4.dart';
import 'package:gym_workout/screens/legs/legs5.dart';

class LegScreen extends StatefulWidget {
  LegScreen({super.key});

  @override
  State<LegScreen> createState() => _LegScreenState();
}

class _LegScreenState extends State<LegScreen> {
  var _currentIndex = 0;
  final List imgs = [
    'assets/gifs/leg1.gif',
    'assets/gifs/leg2.gif',
    'assets/gifs/leg3.gif',
    'assets/gifs/leg4.gif',
    'assets/gifs/leg5.gif',
  ];

  final List titles = [
    'Lever lying leg\ncurl thighs',
    'Leg press calf\nraise',
    'Barbell hip thrusts',
    'Squat hold calf\nraise',
    'Barbell clean grip\nfront squat thighs',
  ];

  final List screens =  [
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 300,
// Adjust the height as per your requirement
                initialPage: 0,
// Set the initial page
                enableInfiniteScroll: true,
// Allow infinite scroll
                autoPlay: true,
// Enable auto-play
                autoPlayInterval: Duration(seconds: 3),
// Set auto-play interval
                autoPlayAnimationDuration: Duration(milliseconds: 800),
// Set animation duration
                autoPlayCurve: Curves.fastOutSlowIn,
// Set animation curve
                enlargeCenterPage: true,
// Increase the size of the center item
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: imgs.map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Legs',
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.white.withOpacity(0.3),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            const Padding(
              padding:
              EdgeInsets.only(left: 10, top: 20, bottom: 10, right: 10),
              child: Text(
                'Want your body to be healthy. Join our program with directions according to body’s goals.Follow Below list of Exercises For Today',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(screens[index]);
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
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
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                subtitle: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
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
