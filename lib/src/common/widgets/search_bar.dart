// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ordered_app/src/common/widgets/textfield.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      label: 'Search',
      ctficon: Icon(
        Icons.search,
        color: Color(0xff44474F),
      ),
      ctfWidth: 350,
    );
  }
}
