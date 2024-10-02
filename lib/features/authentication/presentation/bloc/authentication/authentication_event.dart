part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
class SignUpUserEvent extends AuthenticationEvent {
  final String userEmail;
  final String userPassword;
  SignUpUserEvent({
    required this.userEmail,
    required this.userPassword,
  });
  @override
  List<Object?> get props => [userEmail,userPassword];
}
class LogInUserEvent extends AuthenticationEvent{
   final String userEmail;
  final String userPassword;
  LogInUserEvent({
    required this.userEmail,
    required this.userPassword,
  });
  @override
  List<Object?> get props => [userEmail,userPassword];
}
class LogOutUserEvent extends AuthenticationEvent{}
class CheckUserLoggedInEvent extends AuthenticationEvent{}
class GetCurrentUserIdEvent extends AuthenticationEvent{}