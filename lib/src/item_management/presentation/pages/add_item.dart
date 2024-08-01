// ignore_for_file: prefer_const_constructors_in_immutables, no_leading_underscores_for_local_identifiers, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../common/components/base_scaffold.dart';
import '../../../common/widgets/add_category_button.dart';
import '../../../common/widgets/textfield.dart';
import '../../../category_management/data/firestore_category_repository.dart';
import '../../../category_management/domain/category.dart';
import '../../../riverpod/providers.dart';
import '../../data/firestore_item_repository.dart';
import '../../domain/item.dart';
import '../../../common/components/categories_bar.dart';
import '../../../common/widgets/procced_button.dart';

final selectedUnitProvider = StateProvider<Unit?>((ref) => null);
final purchaseDateProvider = StateProvider<String?>((ref) => null);
final expirationDateProvider = StateProvider<String?>((ref) => null);

class AddItem extends ConsumerWidget {
  AddItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();

    final nameController = TextEditingController();
    final quantityController = TextEditingController();
    final marketNameController = TextEditingController();
    final notesController = TextEditingController();

    return SafeArea(
      child: BaseScaffold(
        currentIndex: 3,
        myelements: [
          Consumer(builder: (context, ref, child) {
            return StreamBuilder<List<Category>?>(
                stream: ref
                    .read(firestoreCategoryRepositoryProvider)
                    .getCategories(),
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
                                                    Navigator.of(context)
                                                        .pop());
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
                    categories:
                        snapshot.data?.map((e) => e.name).toList() ?? [],
                  );
                });
          }),
          Form(
            key: _formKey,
            child: Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: 350,
                      child: Row(
                        children: [
                          Consumer(builder: (context, ref, child) {
                            final image = ref.watch(imageProvider);
                            return IconButton(
                              onPressed: () async {
                                final ImagePicker picker = ImagePicker();
                                XFile? img = await picker.pickImage(
                                    source: ImageSource.gallery);
                                if (img != null) {
                                  ref.read(imageProvider.notifier).state =
                                      img.path;
                                }
                              },
                              icon: Icon(
                                image == null
                                    ? Icons.add_photo_alternate_outlined
                                    : Icons.restore_page_outlined,
                                size: 35,
                                color: image != null ? Colors.green : null,
                              ),
                            );
                          }),
                          SizedBox(width: 10),
                          MyTextField(
                            ctfWidth: 288,
                            controller: nameController,
                            label: 'Name',
                            ctficon: null,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a name';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 350,
                      child: Row(
                        children: [
                          Expanded(
                            child: Consumer(
                              builder: (context, ref, child) {
                                final purchaseDate =
                                    ref.watch(purchaseDateProvider) ??
                                        'Purchase Date';
                                return TextButton(
                                  style: ButtonStyle(
                                    alignment: Alignment.centerLeft,
                                    padding: MaterialStateProperty.all<
                                        EdgeInsetsGeometry>(
                                      EdgeInsets.all(20),
                                    ),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color(0xffFEFBFF)),
                                    shape: MaterialStateProperty.all<
                                        OutlinedBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        side: BorderSide(
                                          color: Color(0xFF1B1B1F),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2020),
                                      lastDate: DateTime(2030),
                                    ).then((selectedDate) {
                                      if (selectedDate != null) {
                                        final dateString = selectedDate
                                            .toLocal()
                                            .toString()
                                            .split(' ')[0];
                                        ref
                                            .read(purchaseDateProvider.notifier)
                                            .state = dateString;
                                      }
                                    });
                                  },
                                  child: Text(
                                    purchaseDate,
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(0xFF1B1B1F),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Consumer(
                              builder: (context, ref, child) {
                                final expirationDate =
                                    ref.watch(expirationDateProvider) ??
                                        'Expiration Date';
                                return TextButton(
                                  style: ButtonStyle(
                                    alignment: Alignment.centerLeft,
                                    padding: MaterialStateProperty.all<
                                        EdgeInsetsGeometry>(
                                      EdgeInsets.all(20),
                                    ),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color(0xffFEFBFF)),
                                    shape: MaterialStateProperty.all<
                                        OutlinedBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        side: BorderSide(
                                          color: Color(0xFF1B1B1F),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2030),
                                    ).then((selectedDate) {
                                      if (selectedDate != null) {
                                        final dateString = selectedDate
                                            .toLocal()
                                            .toString()
                                            .split(' ')[0];
                                        ref
                                            .read(
                                                expirationDateProvider.notifier)
                                            .state = dateString;
                                      }
                                    });
                                  },
                                  child: Text(
                                    expirationDate,
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(0xFF1B1B1F),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 350,
                      child: Row(
                        children: [
                          Expanded(
                            child: MyTextField(
                              controller: quantityController,
                              ctfWidth: 170,
                              label: 'Quantity',
                              ctficon: null,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a quantity';
                                }
                                if (double.tryParse(value) == null) {
                                  return 'Please enter a valid number';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Consumer(
                              builder: (context, ref, child) {
                                final selectedUnit =
                                    ref.watch(selectedUnitProvider);
                                return Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      color: Color(0xffFEFBFF),
                                      borderRadius: BorderRadius.circular(15.0),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      )),
                                  child: DropdownButtonFormField<Unit>(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    value: selectedUnit,
                                    hint: Text(
                                      'Unit',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    items: Unit.values
                                        .map((unit) => DropdownMenuItem(
                                              value: unit,
                                              child: Text(unit
                                                  .toString()
                                                  .split('.')
                                                  .last),
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      ref
                                          .read(selectedUnitProvider.notifier)
                                          .state = value;
                                    },
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Please select a unit';
                                      }
                                      return null;
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    MyTextField(
                      ctfWidth: 350,
                      label: 'Market Name',
                      controller: marketNameController,
                      ctficon: null,
                    ),
                    MyTextField(
                      ctfWidth: 350,
                      label: 'Notes',
                      maxLines: 3,
                      controller: notesController,
                      ctficon: null,
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: ProccedButton(
                        onTap: () async {
                          final selectedCategory =
                              ref.watch(selectedCategoryProvider);
                          if (_formKey.currentState!.validate() &&
                              selectedCategory != "All") {
                            final item = Item(
                              name: nameController.text,
                              purchaseDate: DateTime.parse(
                                  ref.read(purchaseDateProvider) ??
                                      DateTime.now().toIso8601String()),
                              expirationDate: DateTime.parse(
                                  ref.read(expirationDateProvider) ??
                                      DateTime.now().toIso8601String()),
                              quantity: double.parse(quantityController.text),
                              unit: ref.read(selectedUnitProvider)!,
                              marketName: marketNameController.text,
                              notes: notesController.text,
                              category: selectedCategory,
                            );
                            await ref
                                .read(firestoreItemRepositoryProvider)
                                .createItem(item);

                            // Clear form fields
                            nameController.clear();
                            quantityController.clear();
                            marketNameController.clear();
                            notesController.clear();
                            ref.read(purchaseDateProvider.notifier).state =
                                null;
                            ref.read(expirationDateProvider.notifier).state =
                                null;
                            ref.read(selectedUnitProvider.notifier).state =
                                null;
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        pageSubTitle: 'Add item to your refrigerator',
        pageMainTitle: 'Add New Item',
        addLayer: SizedBox(),
      ),
    );
  }
}
