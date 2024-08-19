// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ordered_app/src/item_management/riverpods/edit_item_provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../category_management/riverpods/items_category_provider.dart';
import '../../../common/components/base_scaffold.dart';
import '../../../common/widgets/add_category_button.dart';
import '../../../category_management/data/firestore_category_repository.dart';
import '../../../category_management/domain/category.dart';
import '../../../common/widgets/reactive_text_field_widget.dart';
import '../../domain/item.dart';
import '../../../common/components/categories_bar.dart';
import '../../../common/widgets/procced_button.dart';
import '../../riverpods/item_form_provider.dart';
import '../widgets/date_widget.dart';
import '../widgets/image_picker_widget.dart';
import '../widgets/drop_down_widget.dart';

class EditItem extends ConsumerWidget {
  final Item item;
  EditItem({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemForm = ref.watch(itemFormProvider(item));

    return ReactiveForm(
      formGroup: itemForm,
      child: BaseScaffold(
        currentIndex: 3,
        myelements: [
          Consumer(builder: (context, ref, child) {
            return StreamBuilder<List<Category>?>(
              stream:
                  ref.read(firestoreCategoryRepositoryProvider).getCategories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return CategoriesBar(
                  additionaltem: AddCategoryButton(),
                  categories: snapshot.data?.map((e) => e.name).toList() ?? [],
                );
              },
            );
          }),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: 350,
                    child: Row(
                      children: [
                        Expanded(
                            child: ImagePickerWidget(formControlName: 'photo')),
                        SizedBox(width: 10),
                        Expanded(
                          child: ReactiveTextFieldWidget(
                            ctfWidth: 288,
                            label: 'Name',
                            formControlName: "name",
                            ctficon: null,
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
                          child: DateWidget(
                            formControlName: 'purchaseDate',
                            label: 'Purchase Date',
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: DateWidget(
                            formControlName: 'expirationDate',
                            label: 'Expiration Date',
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
                          child: ReactiveTextFieldWidget(
                            ctfWidth: 170,
                            label: 'Quantity',
                            ctficon: null,
                            formControlName: 'quantity',
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: DropdownButtonFormFieldWidget<Unit>(
                            formControlName: 'unit',
                            hint: 'Unit',
                            items: Unit.values
                                .map((unit) => DropdownMenuItem(
                                      value: unit,
                                      child:
                                          Text(unit.toString().split('.').last),
                                    ))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ReactiveTextFieldWidget(
                    ctfWidth: 350,
                    label: 'Market Name',
                    ctficon: null,
                    formControlName: 'marketName',
                  ),
                  ReactiveTextFieldWidget(
                    ctfWidth: 350,
                    label: 'Notes',
                    maxLines: 3,
                    ctficon: null,
                    formControlName: 'notes',
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Consumer(builder: (context, ref, child) {
                      final selectedCategory =
                          ref.watch(selectedCategoryProvider);

                      if (selectedCategory != "All") {
                        itemForm
                            .control('category')
                            .updateValue(selectedCategory);
                      }

                      return ReactiveFormConsumer(
                        builder: (context, formGroup, child) => ProccedButton(
                          isEnabled:
                              formGroup.valid && selectedCategory != "All",
                          onTap: () async {
                            await ref
                                .read(
                                    editItemProvider((formGroup, item)).future)
                                .then((value) => Navigator.pop(context));
                          },
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
        pageSubTitle: 'Edit item in your refrigerator',
        pageMainTitle: 'Edit An Item',
        addLayer: SizedBox(),
      ),
    );
  }
}
