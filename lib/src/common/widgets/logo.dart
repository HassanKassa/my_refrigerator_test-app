// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'logo',
      style: TextStyle(
          fontFamily: 'Ibarra Real Nova',
          fontSize: 60,
          fontWeight: FontWeight.w700,
          color: Colors.black),
    );
  }
}
