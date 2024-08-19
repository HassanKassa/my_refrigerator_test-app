import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/riverpod/providers.dart';

class MyAvatar extends StatelessWidget {
  const MyAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 125,
      backgroundImage: AssetImage('assets/images/pizza.png'),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Consumer(builder: (context, ref, child) {
          final image = ref.watch(imageRecipeProvider);
          return FloatingActionButton(
            shape: CircleBorder(),
            backgroundColor: Colors.white,
            mini: true,
            onPressed: () async {
              final ImagePicker picker = ImagePicker();
              XFile? img = await picker.pickImage(source: ImageSource.gallery);
              if (img != null) {
                ref.read(imageRecipeProvider.notifier).state = img.path;
              }
            },
            child: Icon(
              image == null
                  ? Icons.add_photo_alternate_outlined
                  : Icons.restore_page_outlined,
              size: 20,
              color: image != null ? Colors.green : null,
            ),
          );
        }),
      ),
    );
  }
}
