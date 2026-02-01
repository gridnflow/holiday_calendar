import 'package:freezed_annotation/freezed_annotation.dart';

part 'holiday.freezed.dart';

@freezed
class Holiday with _$Holiday {
  const factory Holiday({
    required DateTime date,
    required String localName,
    required String name,
    required String countryCode,
    required bool fixed,
    required bool global,
    List<String>? counties,
    List<String>? types,
  }) = _Holiday;

  const Holiday._();

  bool isApplicableTo(String? stateCode) {
    if (global) return true;
    if (stateCode == null) return true;
    if (counties == null || counties!.isEmpty) return true;
    return counties!.contains(stateCode);
  }
}
