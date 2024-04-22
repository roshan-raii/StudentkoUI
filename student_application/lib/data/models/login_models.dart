// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginModel {
  int? success;
  int? error;
  String? message;
  String? token;
  LoginModel({
    this.success,
    this.error,
    this.message,
    this.token,
  });

  LoginModel.initError(this.message);

  LoginModel copyWith({
    int? success,
    int? error,
    String? message,
    String? token,
  }) {
    return LoginModel(
      success: success ?? this.success,
      error: error ?? this.error,
      message: message ?? this.message,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
      'error': error,
      'message': message,
      'token': token,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      success: map['success'] != null ? map['success'] as int : null,
      error: map['error'] != null ? map['error'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LoginModel(success: $success, error: $error, message: $message, token: $token)';
  }

  @override
  bool operator ==(covariant LoginModel other) {
    if (identical(this, other)) return true;

    return other.success == success &&
        other.error == error &&
        other.message == message &&
        other.token == token;
  }

  @override
  int get hashCode {
    return success.hashCode ^
        error.hashCode ^
        message.hashCode ^
        token.hashCode;
  }
}
