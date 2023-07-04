import 'package:flutter/material.dart';

import '../workouts/shoulders.dart';

class TIntrmediate extends StatelessWidget {
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
                  MaterialPageRoute(builder: (context) => ShouldersScreen()));
            },
            child: Image.asset('assets/w1.png')),
        const SizedBox(
          height: 10,
        ),
        Image.asset('assets/w2.png'),
        const SizedBox(
          height: 10,
        ),
        Image.asset('assets/w3.png'),
        const SizedBox(
          height: 10,
        ),
        Image.asset('assets/w4.png'),
        const SizedBox(
          height: 10,
        ),
        Image.asset('assets/w5.png'),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
