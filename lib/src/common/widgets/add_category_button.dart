// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AddCategoryButton extends StatelessWidget {
  final void Function()? onPressed;
  const AddCategoryButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: IconButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xffFAFDFF))),
        onPressed: onPressed,
        icon: Icon(Icons.add),
        color: Colors.black,
      ),
    );
  }
}
