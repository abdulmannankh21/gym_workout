
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String txt;
  final double? width;
  final double? hight;

  final VoidCallback onPressed;
  var margin;
  var decoration;
  CustomButton(
      {required this.txt,
      required this.width,
      required this.hight, required this.onPressed, this.margin,
      required this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
    
      height: hight,
      width: width,
      margin: margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         
             
          TextButton(
            onPressed: onPressed,
            child: Text(
              txt,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
