import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.white60, fontSize: 20),
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(1, 174, 92, 1), width: 1.5)
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(10, 100, 70, 1), width: 1)
          ),
          fillColor: const Color.fromRGBO(1, 174, 92, 0.2),
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white54),

        ),
      ),
    );
  }
}
