import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ordered_app/src/tip_management/data/firestore_tip_repository.dart';
import 'package:ordered_app/src/tip_management/domain/tip.dart';
import 'package:reactive_forms/reactive_forms.dart';

final tipRepositoryServiceProvider = Provider((ref) {
  final firestoreTipRepository = ref.watch(firestoreTipRepositoryProvider);
  return TipRepositoryService(firestoreTipRepository);
});

class TipRepositoryService {
  final FirestoreTipRepository firestoreTipRepository;
  TipRepositoryService(
    this.firestoreTipRepository,
  );
  Future<void> createStorageTips(FormGroup formGroup) async {
    try {
      final tip = Tip(
        category: formGroup.control('category').value,
        name: formGroup.control('name').value,
        details: formGroup.control('details').value,
      );

      await firestoreTipRepository.createTip(tip);
    } catch (e) {
      rethrow;
    }
  }
}
