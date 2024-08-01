// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RightFloatingButton extends StatelessWidget {
  final IconData theIcon;
  final Widget theDestenation;
  const RightFloatingButton(
      {super.key,  required this.theIcon, required this.theDestenation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>theDestenation),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff0F1B32),
            shape: CircleBorder(),
            padding: EdgeInsets.all(16),
          ),
          child: Icon(
            theIcon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
