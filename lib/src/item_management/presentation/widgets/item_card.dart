// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemCard extends StatelessWidget {
  final String name;
  final int daysLeft;
  final String quantity;
  final String cardImage;
  final Function()? onEdit;
  final Function() onDelete;

  ItemCard(
      {super.key,
      required this.name,
      required this.daysLeft,
      required this.quantity,
      required this.cardImage,
      required this.onDelete, this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffFEFBFF),
      child: ListTile(
        leading: SizedBox(
          width: 50,
          height: 50,
          child: ClipOval(
            child: cardImage.contains("assets")
                ? Image.asset(cardImage,fit: BoxFit.cover,)
                : Image.network(cardImage,fit: BoxFit.cover,),
          ),
        ),
        title: Text(
          name,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('$daysLeft Day(s)',
                style: TextStyle(
                    color: daysLeft < 3 ? Colors.red : Color(0xff715573),
                    fontSize: 22,
                    fontWeight: FontWeight.w400)),
            SizedBox(width: 75),
            Text(quantity,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400)),
          ],
        ),
        trailing: Column(
          children: [
            Expanded(
              child: FittedBox(
                child: IconButton(
                  icon: SvgPicture.asset('assets/icons/edit.svg'),
                  onPressed: onEdit,
                ),
              ),
            ),
            Expanded(
              child: FittedBox(
                child: IconButton(
                  icon: SvgPicture.asset('assets/icons/delete.svg'),
                  onPressed: onDelete,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
