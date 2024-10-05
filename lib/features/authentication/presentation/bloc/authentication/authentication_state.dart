part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {
  final String? currentUserId;
  final bool? isUserLoggedIn;
  AuthenticationInitial({
    this.currentUserId,
    this.isUserLoggedIn = false,
  });
  @override
  List<Object?> get props => [
        currentUserId,
        isUserLoggedIn,
      ];
}

class AuthenticationLoadingState extends AuthenticationState {}

class AuthenticationSuccessState extends AuthenticationState {
  final String? userId;
  AuthenticationSuccessState({
    this.userId,
  });
  @override
  List<Object?> get props => [
        userId,
      ];
}

class AuthenticationErrorState extends AuthenticationState {
  final String message;
  AuthenticationErrorState({
    required this.message,
  });
  @override
  List<Object?> get props => [
        message,
      ];
}

class UserAuthenticated extends AuthenticationState {}
class UserNotAuthenticated extends AuthenticationState {}
