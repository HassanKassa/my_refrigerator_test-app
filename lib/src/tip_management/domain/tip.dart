import 'package:freezed_annotation/freezed_annotation.dart';

part 'tip.freezed.dart';
part 'tip.g.dart';

@freezed
class Tip with _$Tip {
  factory Tip({
    String? tipId,
    String? name,
    String? details,
    String category,
  }) = _Tip;

  factory Tip.fromJson(Map<String, dynamic> json) => _$TipFromJson(json);
}
