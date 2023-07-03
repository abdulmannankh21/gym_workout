import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
final TextEditingController controller;
  final TextInputType keyboardtype;
  final String hinttxt;
  final bool isobsecure;

  CustomTextField({
    required this.controller,
    required this.label,
    required this.keyboardtype,
    required this.hinttxt,
    required this.isobsecure,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          obscureText: widget.isobsecure,
          controller: widget.controller,
          style: const TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            //e label: Text(widget.label),
focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: widget.hinttxt,
            labelStyle: const TextStyle(color: Colors.grey),
          ),
          keyboardType: widget.keyboardtype,
        ),
      ),
    );
  }
}
