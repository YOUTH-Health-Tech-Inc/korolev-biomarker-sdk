import 'package:equatable/equatable.dart';
import 'package:youth_biomarkers_sdk/src/common/scheme/youth_bio_measure_type.dart';

class YouthDataPoint extends Equatable {
  const YouthDataPoint(
      {required this.type,
      required this.name,
      required this.value,
      required this.unit});

  final String type;
  final String name;
  final dynamic value;
  final YouthBioUnitType unit;

  @override
  List<Object?> get props => [type, name, value, unit];
}
