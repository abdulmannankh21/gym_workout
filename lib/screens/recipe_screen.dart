import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
 

class RecipeScreen extends StatelessWidget {
  final RecipeController recipeController = Get.put(RecipeController());
   RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Diet",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                recipeController.exerciseLevel.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child:
                   Obx (() => recipeController.getMealPlanText(recipeController.exerciseLevel.value),

              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecipeController extends GetxController {
  final exerciseLevel = ''.obs;
  final reps = ''.obs;
  final repetitions = ''.obs;

  SharedPreferences? _prefs;

  @override
  void onInit() {
    fetchData();
    _loadDataFromPrefs();
    super.onInit();
  }

  Future<void> _loadDataFromPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    exerciseLevel.value = _prefs?.getString('exercise_level') ?? '';
    reps.value = _prefs?.getString('reps') ?? '';
    repetitions.value = _prefs?.getString('repetitions') ?? '';
  }

  Future<void> _saveDataToPrefs() async {
    await _prefs?.setString('exercise_level', exerciseLevel.value);
    await _prefs?.setString('reps', reps.value);
    await _prefs?.setString('repetitions', repetitions.value);
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
          exerciseLevel.value = userData['exercise_level'] ?? '';

          final exerciseCollection = FirebaseFirestore.instance.collection(exerciseLevel.value);
          final exerciseSnapshot = await exerciseCollection.get();

          if (exerciseSnapshot.docs.isNotEmpty) {
            final exerciseData = exerciseSnapshot.docs.first.data();
            reps.value = exerciseData['raps'] ?? '';
            repetitions.value = exerciseData['repitition'] ?? '';
          } else {
            // Document not found
            // Handle the case when no document exists for the given exercise level
          }

        await _saveDataToPrefs();
        }
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }
  Widget getMealPlanText(String exerciseLevel) {
    if (exerciseLevel == 'Beginner') {
      return const Text(
        "Focus on establishing healthy eating habits and balanced nutrition.\n\nSample meal plan:\n\nBreakfast: Oatmeal with berries and a boiled egg.\n\nSnack: Greek yogurt with mixed nuts.\n\nLunch: Grilled chicken breast with quinoa and steamed vegetables.\n\nSnack: Apple slices with almond butter.\n\nDinner: Baked salmon with brown rice and roasted asparagus.\n\nSnack: Protein shake or a piece of fruit",
        style: TextStyle(color: Colors.white),
      );
    } else if (exerciseLevel == 'Intermediate') {
      return const Text(
        "Focus on maintaining a balanced diet and increasing nutrient intake.\n\nSample meal plan:\n\nBreakfast: Whole grain toast with avocado and poached eggs.\n\nSnack: Protein smoothie with spinach and almond milk.\n\nLunch: Grilled chicken salad with quinoa, vegetables, and olive oil dressing.\n\nSnack: Hummus with carrot sticks.\n\nDinner: Grilled steak with sweet potato and roasted Brussels sprouts.\n\nSnack: Greek yogurt with mixed berries.",
        style: TextStyle(color: Colors.white),
      );
    } else if (exerciseLevel == 'Expert') {
      return const Text(
        "Focus on optimizing performance and recovery with nutrient-dense foods.\n\nSample meal plan:\n\nBreakfast: Quinoa porridge with mixed berries and nuts.\n\nSnack: Energy bars with dates, nuts, and seeds.\n\nLunch: Grilled salmon with quinoa, roasted vegetables, and avocado.\n\nSnack: Green smoothie with kale, banana, and almond milk.\n\nDinner: Grilled chicken or tofu with sweet potato, quinoa, and steamed broccoli.\n\nSnack: Cottage cheese with pineapple and chia seeds.",
        style: TextStyle(color: Colors.white),
      );
    } else {
      return const Text(
        "Invalid exercise level.",
        style: TextStyle(color: Colors.white),
      );
    }
  }
}

