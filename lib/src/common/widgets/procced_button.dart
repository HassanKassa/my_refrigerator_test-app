// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProccedButton extends StatelessWidget {
  final Function() onTap;

  const ProccedButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF141B2C),
        minimumSize: Size(350, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        'Procced',
        style: TextStyle(
          color: Color(0xFFFEFBFF),
          fontFamily: 'Recloeta',
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
