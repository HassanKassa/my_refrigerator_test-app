import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ordered_app/src/recipe_management/application/recipe_repository_service.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:bot_toast/bot_toast.dart';

final addRecipeProvider =
    FutureProvider.autoDispose.family((ref, FormGroup formGroup) async {
  final recipeRepositoryService = ref.watch(recipeRepositoryServiceProvider);
  try {
    BotToast.showLoading();
    await recipeRepositoryService.createRecipes(formGroup);
    BotToast.cleanAll();
    BotToast.showText(text: "Done", contentColor: Colors.green);
  } catch (e) {
    // ignore: avoid_print
    print("$e+++++++++++++++++++++++++++++++");
    BotToast.cleanAll();
    BotToast.showText(text: "Error", contentColor: Colors.red);
  }
});
