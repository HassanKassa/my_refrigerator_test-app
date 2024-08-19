// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ordered_app/src/common/widgets/my_check_box.dart';
import 'package:ordered_app/src/common/widgets/procced_button.dart';
import 'package:ordered_app/src/recipe_management/presentation/widgets/my_avatar.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../category_management/data/firestore_category_repository.dart';
import '../../../category_management/domain/category.dart';
import '../../../category_management/riverpods/items_category_provider.dart';
import '../../../category_management/riverpods/recipes_category_provider.dart';
import '../../../common/components/base_scaffold.dart';
import '../../../common/components/categories_bar.dart';
import '../../../common/widgets/add_category_button.dart';
import '../../../common/widgets/reactive_text_field_widget.dart';
import '../../riverpods/add_recipe_provider.dart';
import '../../riverpods/recipe_form_provider.dart';

class AddNewRecipe extends ConsumerWidget {
  const AddNewRecipe({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();
    final recipeForm = ref.watch(recipeFormProvider(null));
    return ReactiveForm(
      formGroup: recipeForm,
      child: BaseScaffold(
        currentIndex: 1,
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
                    additionaltem: AddCategoryButton(),
                    categories:
                        snapshot.data?.map((e) => e.name).toList() ?? [],
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
                    MyAvatar(),
                    ReactiveTextFieldWidget(
                      ctfWidth: 350,
                      label: 'Name',
                      ctficon: null,
                      formControlName: 'name',
                    ),
                    ReactiveTextFieldWidget(
                      ctfWidth: 350,
                      label: 'Ingredients',
                      maxLines: 3,
                      ctficon: null,
                      formControlName: 'ingredients',
                    ),
                    ReactiveTextFieldWidget(
                      ctfWidth: 350,
                      label: 'Details',
                      maxLines: 3,
                      ctficon: null,
                      formControlName: 'details',
                    ),
                    MyCheckBox(),
                    SizedBox(height: 20),
                    Center(
                      child: Consumer(builder: (context, ref, child) {
                        final selectedRecipeCategory =
                            ref.watch(selectedRecipeCategoryProvider);

                        if (selectedRecipeCategory != "All") {
                          recipeForm
                              .control('category')
                              .updateValue(selectedRecipeCategory);
                        }

                        return ReactiveFormConsumer(
                          builder: (context, formGroup, child) => ProccedButton(
                            isEnabled: formGroup.valid &&
                                selectedRecipeCategory != "All",
                            onTap: () async {
                              await ref
                                  .read(addRecipeProvider(formGroup).future)
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
          )
        ],
        pageMainTitle: 'Add New Recipe',
        pageSubTitle: 'Add item to your refrigerator',
        addLayer: SizedBox(),
      ),
    );
  }
}
