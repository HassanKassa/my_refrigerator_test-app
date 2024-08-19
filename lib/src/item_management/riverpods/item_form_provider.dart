import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../domain/item.dart';

final selectedUnitProvider = StateProvider<Unit?>((ref) => null);
final purchaseDateProvider = StateProvider<DateTime?>((ref) => null);
final expirationDateProvider = StateProvider<DateTime?>((ref) => null);

final itemFormProvider =
    Provider.family.autoDispose<FormGroup, Item?>((ref, Item? item) {
  if (item == null) {
    return FormGroup({
      'photo': FormControl<String>(),
      'category': FormControl<String>(validators: [Validators.required]),
      'name': FormControl<String>(validators: [Validators.required]),
      'purchaseDate': FormControl<DateTime>(validators: [Validators.required]),
      'expirationDate': FormControl<DateTime>(validators: [Validators.required]),
      'quantity': FormControl<double>(validators: [Validators.required]),
      'unit': FormControl<Unit>(validators: [Validators.required]),
      'marketName': FormControl<String>(),
      'notes': FormControl<String>(),
    });
  } else {
    return FormGroup({
      'photo': FormControl<String>(value: item.photo),
      'category': FormControl<String>(value: item.category),
      'name': FormControl<String>(value: item.name),
      'purchaseDate': FormControl<DateTime>(
          value:item.purchaseDate),
      'expirationDate': FormControl<DateTime>(
          value: item.expirationDate),
      'quantity': FormControl<double>(value: item.quantity),
      'unit': FormControl<Unit>(value: item.unit),
      'marketName': FormControl<String>(value: item.marketName),
      'notes': FormControl<String>(value: item.notes),
    });
  }
});
