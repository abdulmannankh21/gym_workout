import 'package:flutter/material.dart';

import '../../widgets/custombutton.dart';

class ShouldersScreen extends StatelessWidget {
  const ShouldersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'Shoulders',
          style: TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Image.asset('assets/sh.png'),
          const Text(
            'Shoulders',
            style: TextStyle(
                fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const Text(
            '4 Workouts for bignner',
            style: TextStyle(
                fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold),
          ),
          Image.asset('assets/Info.png'),
          Image.asset('assets/Description.png'),
          Container(
              margin: EdgeInsets.all(2),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 110,
                              width: 150,
                              child: Image.asset(
                                'assets/ex.png',
                                fit: BoxFit.cover,
                              )),
                          Expanded(
                            child: ListTile(
                              title: Row(
                                children: const [
                                  Text(
                                    "Chin Ups",
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 60,
                                  ),
                                  Icon(
                                    Icons.add_circle,
                                    color: Colors.green,
                                    size: 25,
                                  )
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "00:10",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.green,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: CustomButton(
                                        txt: "Start",
                                        width: 200,
                                        hight: 30,
                                        onPressed: () {},
                                        margin: EdgeInsets.all(30),
                                        decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                              colors: [
                                                Colors.blue,
                                                Colors.green
                                              ],
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40))),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
