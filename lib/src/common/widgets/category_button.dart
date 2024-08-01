// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String label;
  final bool selected;
  final void Function()? onPressed;

  CategoryButton({
    super.key,
    required this.label,
    this.selected = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 12.5),
          backgroundColor: selected ? Color(0xff575E71) : Color(0xffFAFDFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          minimumSize: Size(0, 50),
        ),
        child: Text(
          textAlign: TextAlign.center,
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: 'Roboto',
            color: selected ? Color(0xffFAFDFF) : Color(0xff575E71),
          ),
        ),
      ),
    );
  }
}
