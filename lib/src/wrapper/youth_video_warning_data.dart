import 'package:equatable/equatable.dart';

class YouthVideoWarningData extends Equatable {
  final int code;
  final String message;

  const YouthVideoWarningData({required this.code, required this.message});

  @override
  List<Object?> get props => [code, message];
}