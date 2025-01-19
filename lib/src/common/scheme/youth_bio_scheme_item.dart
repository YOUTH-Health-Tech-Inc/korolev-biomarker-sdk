import 'package:equatable/equatable.dart';
import 'package:youth_biomarkers_sdk/src/common/scheme/youth_bio_measure_type.dart';
import 'package:youth_biomarkers_sdk/src/common/scheme/youth_bio_type.dart';

class YouthBioSchemeItem extends Equatable {
  const YouthBioSchemeItem({
    required this.type,
    required this.name,
    required this.unit,
  });

  final YouthBioType type;
  final String name;
  final YouthBioUnitType unit;

  @override
  List<Object?> get props => [type, name, unit];
}
