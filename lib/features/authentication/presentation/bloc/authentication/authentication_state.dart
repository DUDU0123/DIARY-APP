part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState extends Equatable{
  @override
  List<Object?> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState{}
class AuthenticationSuccessState extends AuthenticationState{}
class AuthenticationErrorState extends AuthenticationState {
  final String message;
  AuthenticationErrorState({
    required this.message,
  });
  @override
  List<Object?> get props => [message,];
}
