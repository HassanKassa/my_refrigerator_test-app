// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  final String mainTitle;
  MainTitle({super.key, required this.mainTitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      mainTitle,
      style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Color(0xFF001F29)),
    );
  }
}
