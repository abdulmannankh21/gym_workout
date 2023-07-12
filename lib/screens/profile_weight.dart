import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym_workout/screens/profile_exercise_level.dart';

import '../sizes.dart';
import '../widgets/custombutton.dart';

class ProfWeight extends StatelessWidget {
  static const double _itemHeight = 50;

  List weight = [
    '45 kg',
    '46 kg',
    '47 kg',
    '48 kg',
    '49 kg',
    '50 kg',
    '51 kg',
    '52 kg',
    '53 kg',
    '54 kg',
    '55 kg',
    '56 kg',
    '57 kg',
    '58 kg',
    '59 kg',
    '60 kg',
    '61 kg',
    '62 kg',
    '63 kg',
    '64 kg',
    '65 kg',
    '66 kg',
    '67 kg',
    '68 kg',
    '69 kg',
    '70 kg',
    '70-75 kg',
    '75-80 kg',
    '80-90 kg',
    '100+ kg',
  ];
  final _scrollController = FixedExtentScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'GYM ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  Image.asset('assets/icon.png'),
                  const Text(
                    ' WORKOUT',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Profile SetUp",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "What is your weight?",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ClickableListWheelScrollView(
                scrollController: _scrollController,
                itemHeight: _itemHeight,
                itemCount: weight.length,
                onItemTapCallback: (index) {
                  print("onItemTapCallback index: $index");

                },
                child: ListWheelScrollView.useDelegate(
                  controller: _scrollController,
                  itemExtent: _itemHeight,
                  physics: FixedExtentScrollPhysics(),
                  overAndUnderCenterOpacity: 0.7,
                  perspective: 0.002,
                  onSelectedItemChanged: (index) {
                    print("onSelectedItemChanged index: $index");
                    String uid = FirebaseAuth.instance.currentUser!.uid;
                    // Save the selected age value to Firestore
                    FirebaseFirestore.instance
                        .collection('users') // Assuming 'users' is the collection name
                        .doc(uid) // Replace 'userID' with the actual user ID
                        .update({'weight': weight[index]});
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: 20,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(child: Text(weight[index])),
                          ),
                        );
                      },
                      childCount: weight.length),
                ),
              ),
            ),
            CustomButton(
                txt: "Next",
                width: AppSizes.width! * 0.5,
                hight: AppSizes.height! * 0.05,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfExerciseLevel()));
                },
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.green],
                    ),
                    borderRadius: BorderRadius.circular(40)))
          ],
        ),
      ),
    );
  }
}
