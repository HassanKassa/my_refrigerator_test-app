// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DateWidget extends StatelessWidget {
  final String formControlName;
  final String label;

  const DateWidget({
    Key? key,
    required this.formControlName,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConsumer(
      builder: (context, formGroup, child) {
        final dateControl = formGroup.control(formControlName) as FormControl<DateTime>;
        final dateValue = dateControl.value;

        return TextButton(
          style: ButtonStyle(
            alignment: Alignment.centerLeft,
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(20)),
            backgroundColor: MaterialStateProperty.all<Color>(Color(0xffFEFBFF)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide(color: Color(0xFF1B1B1F), width: 1),
              ),
            ),
          ),
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: dateValue ?? DateTime.now(),
              firstDate: DateTime(2020),
              lastDate: DateTime(2030),
            ).then((selectedDate) {
              if (selectedDate != null) {
                dateControl.updateValue(selectedDate);
              }
            });
          },
          child: Text(
            dateValue != null ? dateValue.toLocal().toIso8601String().split('T')[0] : label,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xFF1B1B1F),
            ),
          ),
        );
      },
    );
  }
}
