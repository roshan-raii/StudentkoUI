import 'package:equatable/equatable.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginClickedEvent extends LoginEvent {
  final String email;
  final String password;
  const LoginClickedEvent({required this.email, required this.password});
}

class ClearLoginDetail extends LoginEvent {}
