import 'package:flutter/material.dart';
import 'package:gym_workout/exercises/Chest.dart';

class TBigner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 30,
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChestScreen()));
            },
            child: Image.asset('assets/ex1.png')),
        const SizedBox(
          height: 5,
        ),
        GestureDetector(
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => ShouldersScreen()));
            },
            child: Image.asset('assets/ex2.png')),
        const SizedBox(
          height: 5,
        ),
        GestureDetector(
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => ShouldersScreen()));
            },
            child: Image.asset('assets/ex3.png')),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => ShouldersScreen()));
            },
            child: Image.asset('assets/ex4.png')),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => ShouldersScreen()));
            },
            child: Image.asset('assets/ex5.png')),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
