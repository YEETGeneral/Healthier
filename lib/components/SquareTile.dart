import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  const SquareTile({
    super.key,
    required this.imagePath
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color.fromRGBO(20, 20, 20, 0.8)),
        color: const Color.fromRGBO(20, 20, 20, 0.3)
      ),
      child: Image.asset(
        imagePath, 
        width: 40, 
        height: 40,
      ),
    );
  }
}
