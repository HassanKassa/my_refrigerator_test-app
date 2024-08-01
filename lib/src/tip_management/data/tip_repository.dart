import '../domain/tip.dart';

abstract class TipRepository {
  Future<void> createTip(Tip tip);
  Stream<List<Tip>?> getTips(String category);
}
