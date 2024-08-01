// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ordered_app/src/tip_management/data/tip_repository.dart';
import 'package:ordered_app/src/tip_management/domain/tip.dart';

final firestoreTipRepositoryProvider =
    Provider((ref) => FirestoreTipRepository());

class FirestoreTipRepository implements TipRepository {
  final firestore = FirebaseFirestore.instance.collection("Tips");

  @override
  Future<void> createTip(Tip tip) async {
    try {
      await firestore.add(tip.toJson());
      print("Success");
    } catch (error) {
      print("Error: ${error.toString()}");
    }
  }

  @override
  Stream<List<Tip>?> getTips(String category) {
    if (category == "All") {
      return firestore
          .orderBy("name", descending: true)
          .snapshots()
          .map((event) {
        return event.docs
            .map((e) => Tip.fromJson(e.data()).copyWith(tipId: e.id))
            .toList();
      });
    }
    return firestore
        .where("category", isEqualTo: category)
        .orderBy("name", descending: true)
        .snapshots()
        .map((event) {
      return event.docs
          .map((e) => Tip.fromJson(e.data()).copyWith(tipId: e.id))
          .toList();
    });
  }
}
