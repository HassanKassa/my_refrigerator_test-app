// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class SubTitle extends StatelessWidget {
  final String subTitle;
  SubTitle({super.key, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
      style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Color(0xFF575E71)),
    );
  }
}
