import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_workout/screens/back/back2.dart';
import '../screens/back/back1.dart';
import '../screens/back/back3.dart';
import '../screens/back/back4.dart';
import '../screens/back/back5.dart';

class BacksScreen extends StatefulWidget {
  BacksScreen({super.key});

  @override
  State<BacksScreen> createState() => _BacksScreenState();
}

class _BacksScreenState extends State<BacksScreen> {
  var _currentIndex = 0;
  final List imgs = [
    'assets/gifs/back1.gif',
    'assets/gifs/back2.gif',
    'assets/gifs/back3.gif',
    'assets/gifs/back4.gif',
    'assets/gifs/back5.gif',
  ];

  final List titles = [
    'Weighted hanging leg\nhip raise waist',
    'Wheel roll out waist\nfix waist',
    'Lying scissor kicks\nwaist',
    'Seated leg raise\nwaist',
    'Incline leg hip raise\neg straight waist',
    'Hanging leg hip\nraise waist'
  ];

  final List screens = [
    Back1(),
    Back2(),
    Back3(),
    Back4(),
    Back5(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
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
                    'Back',
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.white ,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Want your body to be healthy. Join our program with directions according to body’s goals.Follow Below list of Exercises For Today',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: screens.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(20),
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
