part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
class SignUpUserEvent extends AuthenticationEvent{}
class LogInUserEvent extends AuthenticationEvent{}
class LogOutUserEvent extends AuthenticationEvent{}
class CheckUserLoggedInEvent extends AuthenticationEvent{}