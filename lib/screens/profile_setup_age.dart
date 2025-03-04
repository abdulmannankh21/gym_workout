import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym_workout/screens/profile_weight.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../sizes.dart';
import '../widgets/custombutton.dart';

class ProfAge extends StatefulWidget {
  static const double _itemHeight = 50;

  @override
  State<ProfAge> createState() => _ProfAgeState();
}

class _ProfAgeState extends State<ProfAge> {
  void initState() {
    // TODO: implement initState
    super.initState();
    settingPrefs();
  }
  void settingPrefs() async {
    final _preferences = SharedPreferences.getInstance();
    final prefs = await _preferences;
    prefs.setBool('isLoggedIn', true);
  }
//`  static const int _itemCount = 5;
  List age = [
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
    '32',
    '33',
    '34',
    '35',
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
    '45',
    '46',
    '47',
    '48',
    '49',
    '50',
    '50-55',
    '55-60',
    '60-65',
    '65-70',
    '80+',
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
              "What is your age?",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ClickableListWheelScrollView(
                scrollController: _scrollController,
                itemHeight: ProfAge._itemHeight,
                itemCount: age.length,
                onItemTapCallback: (index) {
                  print("onItemTapCallback index: $index");
                },
                child: ListWheelScrollView.useDelegate(
                  controller: _scrollController,
                  itemExtent: ProfAge._itemHeight,
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
                        .update({'age': age[index]});
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
                          child: Center(child: Text(age[index])),
                        ),
                      );
                    },
                    childCount: age.length,
                  ),
                ),
              ),
            ),
            CustomButton(
              txt: "Next",
              width: AppSizes.width! * 0.5,
              hight: AppSizes.height! * 0.05,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfWeight()));
              },
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.green],
                ),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
