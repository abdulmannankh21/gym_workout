import 'package:flutter/material.dart';
import 'package:gym_workout/screens/tutorials/tadvance.dart';

import 'tbignner.dart';
import 'tintermediate.dart';

class TutorialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Tutorials',
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.black,
            bottom: const TabBar(tabs: [
              Tab(text: 'Bignner'),
              Tab(
                text: 'Intermediate',
              ),
              Tab(
                text: 'Advance',
              )
            ]),
          ),
          body: TabBarView(children: [TBigner(), TIntrmediate(), TAdvnace()]
              // ProductList(showFav),
              ),
        ));
  }
}
