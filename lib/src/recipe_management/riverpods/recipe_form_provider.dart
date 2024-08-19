import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../domain/recipe.dart';

final recipeFormProvider =
    Provider.family.autoDispose<FormGroup, Recipe?>((ref, Recipe? recipe) {
  if (recipe == null) {
    return FormGroup({
      'photo': FormControl<String>(),
      'category': FormControl<String>(validators: [Validators.required]),
      'name': FormControl<String>(validators: [Validators.required]),
      'ingredients': FormControl<String>(validators: [Validators.required]),
      'details': FormControl<String>(validators: [Validators.required]),
    });
  } else {
    return FormGroup({
      'photo': FormControl<String>(value: recipe.photo),
      'category': FormControl<String>(value: recipe.category),
      'name': FormControl<String>(value: recipe.name),
      'ingredients': FormControl<String>(value: recipe.ingredients),
      'details': FormControl<String>(value: recipe.details),
    });
  }
});
