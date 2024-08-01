// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final int maxLines;
  final Widget? ctficon;
  final TextEditingController? controller;
  final double ctfWidth;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  const MyTextField({
    super.key,
    required this.label,
    this.maxLines = 1,
    this.ctficon,
    this.controller,
    required this.ctfWidth,
    this.validator, this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ctfWidth,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(onChanged: onChanged,
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xffFEFBFF),
            suffixIcon: ctficon,
            labelText: label,
            labelStyle: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          validator: validator,
        ),
      ),
    );
  }
}
