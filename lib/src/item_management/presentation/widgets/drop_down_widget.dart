// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DropdownButtonFormFieldWidget<T> extends StatelessWidget {
  final String formControlName;
  final List<DropdownMenuItem<T>> items;
  final String hint;
  final String? Function(T?)? validator;

  const DropdownButtonFormFieldWidget({
    Key? key,
    required this.formControlName,
    required this.items,
    required this.hint,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConsumer(
      builder: (context, formGroup, child) {
        final control = formGroup.control(formControlName) as FormControl<T>;

        return DropdownButtonFormField<T>(
          value: control.value,
          items: items,
          hint: Text(hint),
          onChanged: (value) {
            control.updateValue(value);
          },
          validator: validator,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: Colors.black),
            ),
            filled: true,
            fillColor: Color(0xffFEFBFF),
          ),
        );
      },
    );
  }
}
