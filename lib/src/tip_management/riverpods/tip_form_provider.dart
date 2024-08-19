import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../domain/tip.dart';

final tipFormProvider =
    Provider.family.autoDispose<FormGroup, Tip?>((ref, Tip? tip) {
  if (tip == null) {
    return FormGroup({
      'name': FormControl<String>(validators: [Validators.required]),
      'details': FormControl<String>(validators: [Validators.required]),
      'category': FormControl<String>(validators: [Validators.required])
    });
  } else {
    return FormGroup({
      'name': FormControl<String>(value: tip.name),
      'details': FormControl<String>(value: tip.details),
      'category': FormControl<String>(value: tip.category)
    });
  }
});
