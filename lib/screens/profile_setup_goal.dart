import 'package:flutter/material.dart';
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:gym_workout/screens/BottomNavBar.dart';
import 'package:gym_workout/screens/show_progress.dart';

import '../sizes.dart';
import '../widgets/customButton.dart';

class ProfGoal extends StatelessWidget {
  static const double _itemHeight = 50;
  static const int _itemCount = 3;
  List level = ['Be Fit', 'Lose Weight', 'Gain Muscles'];
  final _scrollController = FixedExtentScrollController();

  ProfGoal({super.key});
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
              "What is your goal?",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ClickableListWheelScrollView(
                scrollController: _scrollController,
                itemHeight: _itemHeight,
                itemCount: _itemCount,
                onItemTapCallback: (index) {
                  print("onItemTapCallback index: $index");
                },
                child: ListWheelScrollView.useDelegate(
                  controller: _scrollController,
                  itemExtent: _itemHeight,
                  physics: const FixedExtentScrollPhysics(),
                  overAndUnderCenterOpacity: 0.7,
                  perspective: 0.002,
                  onSelectedItemChanged: (index) {
                    print("onSelectedItemChanged index: $index");
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
                          child: Center(child: Text(level[index])),
                        ),
                      );
                    },
                    childCount: _itemCount,
                  ),
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
                          builder: (context) => const Progressbar()));
                },
                margin: const EdgeInsets.all(30),
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
