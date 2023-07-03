import 'package:flutter/material.dart';

class SuplementScreen extends StatelessWidget {
  const SuplementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Your Diet",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Image.asset('assets/suply.png'),
          const Text(
            "Suplements",
            style: TextStyle(
                color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          Image.asset('assets/Info.png'),
          Image.asset('assets/suply2.png')
        ],
      ),
    );
  }
}
