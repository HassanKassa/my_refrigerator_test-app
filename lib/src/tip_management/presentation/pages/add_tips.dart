import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ordered_app/src/common/widgets/procced_button.dart';
import 'package:ordered_app/src/common/widgets/reactive_text_field_widget.dart';
import 'package:ordered_app/src/tip_management/riverpods/add_tip_provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../category_management/data/firestore_category_repository.dart';
import '../../../category_management/domain/category.dart';
import '../../../category_management/riverpods/tips_category_provider.dart';
import '../../../common/components/base_scaffold.dart';
import '../../../common/components/categories_bar.dart';
import '../../../common/widgets/add_category_button.dart';
import '../../riverpods/tip_form_provider.dart';

class AddTips extends ConsumerWidget {
  const AddTips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tipForm = ref.watch(tipFormProvider(null));

    return ReactiveForm(
      formGroup: tipForm,
      child: BaseScaffold(
        currentIndex: 2,
        myelements: [
          Consumer(builder: (context, ref, child) {
            return StreamBuilder<List<Category>?>(
              stream:
                  ref.read(firestoreCategoryRepositoryProvider).getCategories(),
              builder: (context, snapshot) {
                return CategoriesBar(
                  additionaltem: const AddCategoryButton(),
                  categories: snapshot.data?.map((e) => e.name).toList() ?? [],
                );
              },
            );
          }),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ReactiveTextFieldWidget(
                    label: 'Name',
                    formControlName: "name",
                    ctficon: null,
                    ctfWidth: 350,
                  ),
                  const ReactiveTextFieldWidget(
                    label: 'Details',
                    formControlName: "details",
                    maxLines: 3,
                    ctficon: null,
                    ctfWidth: 350,
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Consumer(builder: (context, ref, child) {
                      final selectedTipCategory =
                          ref.watch(selectedTipCategoryProvider);

                      if (selectedTipCategory != "All") {
                        tipForm
                            .control('category')
                            .updateValue(selectedTipCategory);
                      }

                      return ReactiveFormConsumer(
                        builder: (context, formGroup, child) => ProccedButton(
                          isEnabled:
                              formGroup.valid && selectedTipCategory != "All",
                          onTap: () async {
                            await ref
                                .read(addTipProvider(formGroup).future)
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
        pageSubTitle: 'Add Storage Tips',
        pageMainTitle: 'Add Tip',
        addLayer: const SizedBox(),
      ),
    );
  }
}
