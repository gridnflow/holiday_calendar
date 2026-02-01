import 'package:freezed_annotation/freezed_annotation.dart';

part 'federal_state.freezed.dart';

@freezed
class FederalState with _$FederalState {
  const factory FederalState({
    required String code,
    required String nameDE,
    required String nameEN,
  }) = _FederalState;

  static const List<FederalState> all = [
    FederalState(code: 'DE-BW', nameDE: 'Baden-Württemberg', nameEN: 'Baden-Württemberg'),
    FederalState(code: 'DE-BY', nameDE: 'Bayern', nameEN: 'Bavaria'),
    FederalState(code: 'DE-BE', nameDE: 'Berlin', nameEN: 'Berlin'),
    FederalState(code: 'DE-BB', nameDE: 'Brandenburg', nameEN: 'Brandenburg'),
    FederalState(code: 'DE-HB', nameDE: 'Bremen', nameEN: 'Bremen'),
    FederalState(code: 'DE-HH', nameDE: 'Hamburg', nameEN: 'Hamburg'),
    FederalState(code: 'DE-HE', nameDE: 'Hessen', nameEN: 'Hesse'),
    FederalState(code: 'DE-MV', nameDE: 'Mecklenburg-Vorpommern', nameEN: 'Mecklenburg-Western Pomerania'),
    FederalState(code: 'DE-NI', nameDE: 'Niedersachsen', nameEN: 'Lower Saxony'),
    FederalState(code: 'DE-NW', nameDE: 'Nordrhein-Westfalen', nameEN: 'North Rhine-Westphalia'),
    FederalState(code: 'DE-RP', nameDE: 'Rheinland-Pfalz', nameEN: 'Rhineland-Palatinate'),
    FederalState(code: 'DE-SL', nameDE: 'Saarland', nameEN: 'Saarland'),
    FederalState(code: 'DE-SN', nameDE: 'Sachsen', nameEN: 'Saxony'),
    FederalState(code: 'DE-ST', nameDE: 'Sachsen-Anhalt', nameEN: 'Saxony-Anhalt'),
    FederalState(code: 'DE-SH', nameDE: 'Schleswig-Holstein', nameEN: 'Schleswig-Holstein'),
    FederalState(code: 'DE-TH', nameDE: 'Thüringen', nameEN: 'Thuringia'),
  ];
}
