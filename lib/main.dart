import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_workout/screens/splash_screen.dart';
import 'package:gym_workout/sizes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    AppSizes.initializeSize(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gym Workout',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SplashScreen(),
    );
  }
}
