import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_workout/screens/chest/chest4.dart';
import '../screens/chest/chest1.dart';
import '../screens/chest/chest2.dart';
import '../screens/chest/chest3.dart';
import '../screens/chest/chest5.dart';
import '../screens/chest/chest6.dart';

class ChestsScreen extends StatefulWidget {
  ChestsScreen({super.key});

  @override
  State<ChestsScreen> createState() => _ChestsScreenState();
}

class _ChestsScreenState extends State<ChestsScreen> {
  var _currentIndex = 0;
  final List imgs = [
    'assets/gifs/chest1.gif',
    'assets/gifs/chest2.gif',
    'assets/gifs/chest3.gif',
    'assets/gifs/chest4.gif',
    'assets/gifs/chest5.gif',
    'assets/gifs/chest6.gif'
  ];

  final List titles = [
    'Barbell Bench Press',
    'Dumbbell Bench Press',
    'Dumbbell Fly Press',
    'Dumbbell Decline Bench Press',
    'Barbell Incline Bench Press',
    'Dumbbell Decline Fly'
  ];

  final List screens =  [
    Chest1(),
    Chest2(),
    Chest3(),
    Chest4(),
    Chest5(),
    Chest6(),
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
                    'Chest',
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.white ,
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
                  itemCount: 6,
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
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
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
