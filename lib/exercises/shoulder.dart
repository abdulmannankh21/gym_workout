import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/shoulders/sho1.dart';
import '../screens/shoulders/sho2.dart';
import '../screens/shoulders/sho3.dart';
import '../screens/shoulders/sho4.dart';
import '../screens/shoulders/sho5.dart';
import '../screens/shoulders/sho6.dart';

class ShouldersScreen extends StatefulWidget {
  ShouldersScreen({super.key});

  @override
  State<ShouldersScreen> createState() => _ShouldersScreenState();
}

class _ShouldersScreenState extends State<ShouldersScreen> {
  var _currentIndex = 0;
  final List imgs = [
    'assets/gifs/sho1.gif',
    'assets/gifs/sho2.gif',
    'assets/gifs/sho3.gif',
    'assets/gifs/sho4.gif',
    'assets/gifs/sho5.gif',
    'assets/gifs/sho6.gif'
  ];

  final List titles = [
    'Barbell standing wide\nmilitary press shoulders',
    'Dubmbbell seated shoulder\npress shoulders',
    'Dumbbell front rise\nshoulders',
    'Dunmbell rear fly\nshoulders',
    'Dumbbell lateral rise\nshoulders',
    'Dunmbbell upright row\nshoulders'
  ];

  final List screens =  [
    Sho1(),
    Sho2(),
    Sho3(),
    Sho4(),
    Sho5(),
    Sho6(),
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
                    'Shoulder',
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
