import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String message;
  final int code;

  ApiErrorModel({required this.message, required this.code});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return _$ApiErrorModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ApiErrorModelToJson(this);
  }
}
