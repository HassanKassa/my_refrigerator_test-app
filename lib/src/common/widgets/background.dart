import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: 0.6,
        child: Image.asset(
          fit: BoxFit.cover,
          width: double.infinity,
          'assets/images/bground.png',
        ),
      ),
    );
  }
}
