// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ordered_app/src/common/widgets/filter_button.dart';
import 'package:ordered_app/src/common/widgets/textfield.dart';

import '../../riverpod/providers.dart';

class SearchingAndFiltering extends StatelessWidget {
  const SearchingAndFiltering({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: Consumer(builder: (context, ref, child) {
            return MyTextField(
              onChanged: (process) {
                ref.read(searchProcessProvider.notifier).state = process;
              },
              label: 'Search',
              ctficon: Icon(
                Icons.search,
                color: Color(0xff44474F),
              ),
              ctfWidth: 350,
            );
          }),
        ),
        Expanded(
          flex: 1,
          child: FilterButton(),
        ),
      ],
    );
  }
}
