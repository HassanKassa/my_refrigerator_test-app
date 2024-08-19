// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProccedButton extends StatelessWidget {
  final Function() onTap;
  final bool isEnabled;

  const ProccedButton({super.key, required this.onTap, this.isEnabled = true});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? onTap : () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: isEnabled ? Color(0xFF141B2C) : Colors.grey,
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
