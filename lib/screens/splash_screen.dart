import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gym_workout/screens/chose_login_suginUp_ofline.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bottomnavbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
          () => navigateToScreen(),
    );
  }

  Future<void> navigateToScreen() async {
    if (_auth.currentUser != null) {
      // User is already logged in, navigate to MyNavBar
      final _preferences = SharedPreferences.getInstance();
      final prefs = await _preferences;
      final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
      isLoggedIn  ?
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyNavBar()),
      ):  Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ChoseLoginOfline()),
      );
    } else {
      // User is not logged in, navigate to ChoseLoginOfline
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ChoseLoginOfline()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'GYM ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset('assets/icon.png'),
            const Text(
              ' WORKOUT',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
