import 'package:flutter/material.dart';
import '../../item_management/presentation/pages/add_item.dart';

class MiddleFloatingButton extends StatelessWidget {
  const MiddleFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xffE7E8FE),
            width: 5.0,
          )),
      child: FloatingActionButton(
        backgroundColor: const Color(0xFF575E71),
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  AddItem()),
          );
        },
        child: const Icon(
          size: 40,
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
