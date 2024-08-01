// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String myimageasset;
  final String title;
  final String ingredients;
  final int likes;
  final int comments;
  final int shares;
  final int favorites;
  final String? details;

  const RecipeCard({
    super.key,
    required this.myimageasset,
    required this.title,
    required this.ingredients,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.favorites, this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: myimageasset.contains("assets")
            ? Image.asset(myimageasset)
            : Image.network(myimageasset),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.thumb_up, size: 16.0),
                    SizedBox(width: 4.0),
                    Text('$likes'),
                    SizedBox(width: 16.0),
                    Icon(Icons.comment, size: 16.0),
                    SizedBox(width: 4.0),
                    Text('$comments'),
                    SizedBox(width: 16.0),
                    Icon(Icons.share, size: 16.0),
                    SizedBox(width: 4.0),
                    Text('$shares'),
                    Spacer(),
                    Icon(Icons.favorite, size: 16.0),
                    SizedBox(width: 4.0),
                    Text('$favorites'),
                  ],
                ),
                SizedBox(height: 8.0),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(ingredients),
                Text('Details: $details!',style: TextStyle(color: Colors.red),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
