// ignore_for_file: use_super_parameters, prefer__ructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:ordered_app/src/common/widgets/background.dart';
import 'package:ordered_app/src/common/widgets/middle_floating_button.dart';
import 'package:ordered_app/src/common/widgets/my_navigator.dart';
import '../widgets/logo.dart';
import '../widgets/main_title.dart';
import '../widgets/notificatios_icon.dart';
import '../widgets/sub_title.dart';

class BaseScaffold extends StatelessWidget {
  final String pageMainTitle;
  final String pageSubTitle;
  final Widget? addLayer;
  final List<Widget> myelements;
  final int currentIndex;

  BaseScaffold({
    Key? key,
    required this.myelements,
    required this.currentIndex,
    required this.pageMainTitle,
    required this.pageSubTitle,
    this.addLayer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Background(),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Logo(), NotificationsIcon()]),
                  MainTitle(mainTitle: pageMainTitle),
                  SubTitle(subTitle: pageSubTitle),
                  SizedBox(height: 10),
                  ...myelements,
                ],
              ),
            ),
            addLayer!,
          ],
        ),
        floatingActionButton: MiddleFloatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: MyNavigator(currentIndex: currentIndex),
      ),
    );
  }
}
