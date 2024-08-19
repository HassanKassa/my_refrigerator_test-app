import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ImagePickerWidget extends ConsumerWidget {
  final String formControlName;

  const ImagePickerWidget({
    super.key,
    required this.formControlName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ReactiveValueListenableBuilder<String>(
      formControlName: formControlName,
      builder: (context, photoControl, child) {
        return IconButton(
          onPressed: () async {
            final ImagePicker picker = ImagePicker();
            XFile? img = await picker.pickImage(source: ImageSource.gallery);
            if (img != null) {
              // Update the photoControl and the imageItemProvider
              photoControl.updateValue(img.path);
              // ref.read(imageItemProvider.notifier).state = img.path;
            }
          },
          icon: Icon(
            photoControl.value == null
                ? Icons.add_photo_alternate_outlined
                : Icons.restore_page_outlined,
            size: 35,
            color: photoControl.value != null ? Colors.green : null,
          ),
        );
      },
    );
  }
}
