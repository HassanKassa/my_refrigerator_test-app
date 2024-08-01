// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ordered_app/src/common/widgets/my_check_box.dart';
import 'package:ordered_app/src/common/widgets/procced_button.dart';
import 'package:ordered_app/src/common/widgets/textfield.dart';
import 'package:ordered_app/src/recipe_management/domain/recipe.dart';
import '../../../category_management/data/firestore_category_repository.dart';
import '../../../category_management/domain/category.dart';
import '../../../common/components/base_scaffold.dart';
import '../../../common/components/categories_bar.dart';
import '../../../common/widgets/add_category_button.dart';
import '../../../riverpod/providers.dart';
import '../../data/firestore_recipe_repository.dart';

class AddNewRecipe extends ConsumerWidget {
  const AddNewRecipe({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final ingredientsController = TextEditingController();
    final detailsController = TextEditingController();
    return BaseScaffold(
      currentIndex: 1,
      myelements: [
        Consumer(builder: (context, ref, child) {
          return StreamBuilder<List<Category>?>(
              stream:
                  ref.read(firestoreCategoryRepositoryProvider).getCategories(),
              builder: (context, snapshot) {
                Future(() {
                    ref.read(selectedCategoryProvider.notifier).state =
                        snapshot.data?.firstOrNull?.name ?? "All";
                  });
                return CategoriesBar(
                  additionaltem: AddCategoryButton(
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
                                          final category = Category(
                                              name: categoryDialogText.text);
                                          await ref
                                              .read(
                                                  firestoreCategoryRepositoryProvider)
                                              .createCategory(category)
                                              .then((value) =>
                                                  Navigator.of(context).pop());
                                        },
                                        child: Text("Add"));
                                  })
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  categories: snapshot.data?.map((e) => e.name).toList() ?? [],
                );
              });
        }),
        SizedBox(height: 20),
        Form(
          key: _formKey,
          child: Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 125,
                    backgroundImage: AssetImage('assets/images/pizza.png'),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Consumer(
                        builder: (context, ref , child) {
                          final image = ref.watch(imageProvider);
                          return FloatingActionButton(
                            shape: CircleBorder(),
                            backgroundColor: Colors.white,
                            heroTag: 'first',
                            mini: true,
                            onPressed: () async {
                                    final ImagePicker picker = ImagePicker();
                                    XFile? img = await picker.pickImage(
                                        source: ImageSource.gallery);
                                    if (img != null) {
                                      ref.read(imageProvider.notifier).state =
                                          img.path;
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
                        }
                      ),
                    ),
                  ),
                  MyTextField(
                    controller: nameController,
                    ctfWidth: 350,
                    label: 'Name',
                    ctficon: null,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  MyTextField(
                    controller: ingredientsController,
                    ctfWidth: 350,
                    label: 'Ingredients',
                    maxLines: 3,
                    ctficon: null,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the ingredients';
                      }
                      return null;
                    },
                  ),
                  MyTextField(
                    controller: detailsController,
                    ctfWidth: 350,
                    label: 'Details',
                    maxLines: 3,
                    ctficon: null,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter details';
                      }
                      return null;
                    },
                  ),
                  MyCheckBox(),
                  SizedBox(height: 20),
                  Center(
                    child: ProccedButton(
                      onTap: () async {
                        final selectedRecipeCategory =
                              ref.watch(selectedRecipeCategoryProvider);
                          if (_formKey.currentState!.validate() &&
                              selectedRecipeCategory != "All") {
                          final recipe = Recipe(
                            name: nameController.text,
                            ingredients: ingredientsController.text,
                            details: detailsController.text,
                            category: selectedRecipeCategory,
                          );
                          await ref
                              .read(firestoreRecipeRepositoryProvider)
                              .createRecipe(recipe);

                          // Clear form fields
                          nameController.clear();
                          ingredientsController.clear();
                          detailsController.clear();

                          // Navigate back
                          Navigator.pop(context);
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
      pageMainTitle: 'Add New Recipe',
      pageSubTitle: 'Add item to your refrigerator',
      addLayer: SizedBox(),
    );
  }
}
