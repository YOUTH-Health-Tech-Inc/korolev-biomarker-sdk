import 'package:equatable/equatable.dart';

class YouthVideoErrorData extends Equatable {
  final int code;
  final String message;

  const YouthVideoErrorData({required this.code, required this.message});

  @override
  List<Object?> get props => [code, message];
}