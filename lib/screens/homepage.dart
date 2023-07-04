import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../exercises/shoulders.dart';
import '../sizes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List names = [
    'Simple Warm-up Exercise',
    'Chin Ups',
    'Simple Warm-up Exercise',
    'Chin Ups',
    'Chin Ups'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            "Home",
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Exercise in Log",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 50,
                  animation: true,
                  lineHeight: 10.0,
                  animationDuration: 1200,
                  // ignore: deprecated_member_use
                  linearStrokeCap: LinearStrokeCap.round,
                  linearGradient:
                      const LinearGradient(colors: [Colors.blue, Colors.green]),
                  percent: 0.3,
                  backgroundColor: Colors.black,
                  center: const Text(
                    '2/5 Done',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(20)),
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width * 1,
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 5, left: 10),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(ShoulderScreen());
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: AppSizes.width! * 0.3,
                                    height: AppSizes.height! * 0.1,
                                    child: Image.asset(
                                      'assets/ex.png',
                                      fit: BoxFit.cover,
                                    )),
                                 SizedBox(width: 20,),
                                 Expanded(
                                    child: Text(
                                      names[index],
                                      maxLines: 2,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                 ),
                              ],
                            ),
                          ),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
