// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveTextFieldWidget extends StatelessWidget {
  final String label;
  final int maxLines;
  final Widget? ctficon;
  final double ctfWidth;
  final String formControlName;
  final Function(FormControl<dynamic>)? onChanged;

  const ReactiveTextFieldWidget({
    super.key,
    required this.label,
    this.maxLines = 1,
    this.ctficon,
    required this.formControlName,
    required this.ctfWidth,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ctfWidth,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: ReactiveTextField(
          formControlName: formControlName,
          onChanged: onChanged,
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
        ),
      ),
    );
  }
}
