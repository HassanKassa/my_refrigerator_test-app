import 'package:flutter/material.dart';
import 'common/components/base_scaffold.dart';

class UnrequiredMyProfile extends StatelessWidget {
  const UnrequiredMyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      currentIndex: 3,
      myelements: const [
        
      ],
      pageMainTitle: 'My Profile',
      pageSubTitle: 'Check Your Recipes and more..',
      addLayer: const Center(child: Text("This page isn't required!",style: TextStyle(
          fontFamily: 'Ibarra Real Nova',
          fontSize: 40,
          fontWeight: FontWeight.w700,
          color: Color(0xFF76517B))),),
    );
  }
}
