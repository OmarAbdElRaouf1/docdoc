import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String? message;
  @JsonKey(name: 'data')
  UserData userData;
  bool status;
  int code;

  LoginResponse({
    this.message,
    required this.userData,
    required this.status,
    required this.code,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  String? token;
  @JsonKey(name: 'username')
  String? userName;

  UserData({this.userName, this.token});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
