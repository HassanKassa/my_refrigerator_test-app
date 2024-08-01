// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 40,
      onPressed: () {},
      icon: Icon(Icons.filter_list_outlined),
      color: Color(0xff44474F),
    );
  }
}
