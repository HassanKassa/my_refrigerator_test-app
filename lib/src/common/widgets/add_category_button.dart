// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ordered_app/src/category_management/domain/category.dart';

import '../../category_management/data/firestore_category_repository.dart';

class AddCategoryButton extends StatelessWidget {
  const AddCategoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: IconButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xffFAFDFF))),
        onPressed: () {
          final categoryDialogText = TextEditingController();
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Column(
                    children: [
                      TextField(
                        controller: categoryDialogText,
                      ),
                      Consumer(builder: (context, ref, child) {
                        return ElevatedButton(
                          onPressed: () async {
                            final category =
                                Category(name: categoryDialogText.text);
                            await ref
                                .read(firestoreCategoryRepositoryProvider)
                                .createCategory(category)
                                .then((value) => Navigator.of(context).pop());
                          },
                          child: const Text("Add"),
                        );
                      })
                    ],
                  ),
                ),
              );
            },
          );
        },
        icon: Icon(Icons.add),
        color: Colors.black,
      ),
    );
  }
}
