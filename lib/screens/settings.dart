import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym_workout/screens/chose_login_suginUp_ofline.dart';
import 'login_signup_screen.dart';

class SettingsScreen extends StatelessWidget {
  final SettingsController _settingsController = Get.put(SettingsController());

  SettingsScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            'Settings',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset('assets/Profile Picture.png'),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                              () {
                            final name = _settingsController.name.value;
                            return Text(
                              name,
                              style: const TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                        Text(
                          _settingsController.exerciseLevel.value,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    const Text(
                      'Weight',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Obx(
                          () {
                        final email = _settingsController.weight.value;
                        return Text(
                          email,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      'Age',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Obx(
                          () {
                        final email = _settingsController.age.value;
                        return Text(
                          email,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      'Goal',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      _settingsController.goal.value,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Obx(
                          () {
                        final email = _settingsController.email.value;
                        return Text(
                          email,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Get.defaultDialog(
                      title: 'Are you sure?',
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 1,
                              textStyle: const TextStyle(color: Colors.black),
                            ),
                            child: const Text('No'),
                          ),
                          ElevatedButton(
                            onPressed:(){
                              _settingsController.signOutUser();
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 1,
                              backgroundColor: Colors.red,
                              textStyle: const TextStyle(color: Colors.white),
                            ),
                            child: const Text('Yes'),
                          ),
                        ],
                      ),
                    );
                  },
                  child:  Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SettingsController extends GetxController {
  final name = ''.obs;
  final age = ''.obs;
  final weight = ''.obs;
  final exerciseLevel = ''.obs;
  final goal = ''.obs;
  final email = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData(); // Call the method to fetch user data on initialization
  }
  void signOutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => ChoseLoginOfline());
      // Successful logout
    } catch (e) {
      print('Error logging out: $e');
      // Handle any errors that occur during logout
    }
  }

  Future<void> fetchData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userId = user.uid;
        final snapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();

        final userData = snapshot.data();
        if (userData != null) {
          name.value = userData['name'] ?? '';
          age.value = userData['age'] ?? '';
          weight.value = userData['weight'] ?? '';
          exerciseLevel.value = userData['exercise_level'] ?? '';
          goal.value = userData['goal'] ?? '';
          email.value = userData['email'] ?? '';
        }
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }
}
