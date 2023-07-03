import 'package:flutter/material.dart';

import 'package:gym_workout/screens/suplement_screen.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

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
        body: ListView.builder(
            itemCount: 6,
            itemBuilder: (conext, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SuplementScreen()));
                },
                child: ListTile(
                  leading: Image.asset("assets/recipe1.png"),
                  title: const Text(
                    "Suplement",
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: const Text(
                    "By: Robert Patison",
                    style: TextStyle(color: Colors.green),
                  ),
                  trailing: const Text("01:52 pm",
                      style: TextStyle(color: Colors.green)),
                ),
              );
            }),
      ),
    );
  }
}
