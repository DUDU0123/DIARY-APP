import 'dart:async';

import 'package:diary_app/features/authentication/domain/usecase/user_login_usecase.dart';
import 'package:diary_app/features/authentication/domain/usecase/user_logout_usecase.dart';
import 'package:diary_app/features/authentication/domain/usecase/user_signup_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserSignupUsecase _userSignupUsecase;
  final UserLoginUsecase _userLoginUsecase;
  final UserLogoutUsecase _userLogoutUsecase;
  AuthenticationBloc({
    required UserSignupUsecase userSignupUsecase,
    required UserLoginUsecase userLoginUsecase,
    required UserLogoutUsecase userLogoutUsecase,
  })  : _userSignupUsecase = userSignupUsecase,
        _userLoginUsecase = userLoginUsecase,
        _userLogoutUsecase = userLogoutUsecase,
        super(AuthenticationInitial()) {
    on<SignUpUserEvent>(signUpUserEvent);
    on<LogInUserEvent>(logInUserEvent);
    on<LogOutUserEvent>(logOutUserEvent);
    on<CheckUserLoggedInEvent>(checkUserLoggedInEvent);
  }

  FutureOr<void> signUpUserEvent(
      SignUpUserEvent event, Emitter<AuthenticationState> emit) {}

  FutureOr<void> logInUserEvent(
      LogInUserEvent event, Emitter<AuthenticationState> emit) {}

  FutureOr<void> logOutUserEvent(
      LogOutUserEvent event, Emitter<AuthenticationState> emit) {}

  FutureOr<void> checkUserLoggedInEvent(
      CheckUserLoggedInEvent event, Emitter<AuthenticationState> emit) {}
}
