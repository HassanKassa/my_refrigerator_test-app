// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';

class MyCheckBox extends StatefulWidget {
  const MyCheckBox({super.key});
  @override
  _MyCheckBoxState createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 350,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Transform.scale(
            scale: 1.5,
            child: Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
              fillColor: MaterialStateProperty.all(Colors.white),
              shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(2)),
              activeColor: Colors.white,
              checkColor: Color(0xff326669),
            ),
          ),
          Text('Share recipe with community',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                  color: Color(0xFF000000))),
        ],
      ),
    );
  }
}

// التصنيفات