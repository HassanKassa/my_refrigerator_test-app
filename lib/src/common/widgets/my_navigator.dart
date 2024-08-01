import 'package:flutter/material.dart';
import 'package:ordered_app/src/item_management/presentation/pages/my_refrigerator.dart';
import 'package:ordered_app/src/unrequired_my_profile.dart';
import '../../recipe_management/presentation/pages/recipes.dart';
import '../../tip_management/presentation/pages/storage_tips.dart';


class MyNavigator extends StatelessWidget {
  final int currentIndex;

  const MyNavigator({super.key, required this.currentIndex});

  void _onItemTapped(BuildContext context, int index) {
    if (index == currentIndex) return;

    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const MyRefrigerator()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Recipes()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const StorageTips()));
        break;
      case 3:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const UnrequiredMyProfile()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white,
          backgroundColor: const Color(0xFF76517B),
          selectedItemColor: const Color(0xff2D0E34),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.kitchen_rounded),
              label: 'Refrigerator',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_outlined),
              label: 'Recipes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.tips_and_updates_outlined),
              label: 'Storage Tips',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'My Profile',
            ),
          ],
          currentIndex: currentIndex,
          onTap: (index) => _onItemTapped(context, index),
        ),
      ),
    );
  }
}
