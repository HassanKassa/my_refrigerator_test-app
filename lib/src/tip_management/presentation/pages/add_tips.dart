// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ordered_app/src/common/widgets/procced_button.dart';
import '../../../category_management/data/firestore_category_repository.dart';
import '../../../category_management/domain/category.dart';
import '../../../common/components/base_scaffold.dart';
import '../../../common/components/categories_bar.dart';
import '../../../common/widgets/add_category_button.dart';
import '../../../common/widgets/textfield.dart';
import '../../../riverpod/providers.dart';
import '../../data/firestore_tip_repository.dart';
import '../../domain/tip.dart';

class AddTips extends ConsumerWidget {
  const AddTips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final detailsController = TextEditingController();

    return BaseScaffold(
      currentIndex: 2,
      myelements: [
        Consumer(builder: (context, ref, child) {
                  return StreamBuilder<List<Category>?>(
                      stream: ref
                          .read(firestoreCategoryRepositoryProvider)
                          .getCategories(),
                      builder: (context, snapshot) {
                         Future(() {
                    ref.read(selectedTipCategoryProvider.notifier).state =
                        snapshot.data?.firstOrNull?.name ?? "All";
                  });
                        return CategoriesBar(
                          additionaltem: AddCategoryButton(
                            onPressed: () {
                              final categoryDialogText =
                                  TextEditingController();
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
                                          Consumer(
                                              builder: (context, ref, child) {
                                            return ElevatedButton(
                                                onPressed: () async {
                                                  final category = Category(
                                                      name: categoryDialogText
                                                          .text);
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyTextField(
                    label: 'Name',
                    controller: nameController,
                    ctficon: null,
                    ctfWidth: 350,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  MyTextField(
                    label: 'Details',
                    controller: detailsController,
                    maxLines: 3,
                    ctficon: null,
                    ctfWidth: 350,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter details';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: ProccedButton(
                      onTap: () async {
                        final selectedTipCategory = ref.watch(selectedTipCategoryProvider);
                        if (_formKey.currentState!.validate() && selectedTipCategory != "All" ) {
                          
                          final tip = Tip(
                            name: nameController.text,
                            details: detailsController.text,
                            category: selectedTipCategory,
                          );
                          await ref
                              .read(firestoreTipRepositoryProvider)
                              .createTip(tip);
              
                          // Clear form fields
                          nameController.clear();
                          detailsController.clear();
              
                          // Navigate back
                          Navigator.pop(context);
  
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
      pageSubTitle: 'Add Storage Tips',
      pageMainTitle: 'Add Tip',
      addLayer: SizedBox(),
    );
  }
}
