import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final Function()? onTap;

  MyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Color.fromRGBO(10, 150, 80, 0.7),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            "Zaloguj",
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
