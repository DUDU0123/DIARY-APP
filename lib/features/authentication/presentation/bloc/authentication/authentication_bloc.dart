import 'dart:async';
import 'package:diary_app/features/authentication/data/data_sources/authentication_remote_data.dart';
import 'package:diary_app/features/authentication/domain/entity/user_entity/user_entity.dart';
import 'package:diary_app/features/authentication/domain/usecase/get_current_userid_usecase.dart';
import 'package:diary_app/features/authentication/domain/usecase/user_login_usecase.dart';
import 'package:diary_app/features/authentication/domain/usecase/user_logout_usecase.dart';
import 'package:diary_app/features/authentication/domain/usecase/user_signup_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserSignupUsecase _userSignupUsecase;
  final UserLoginUsecase _userLoginUsecase;
  final UserLogoutUsecase _userLogoutUsecase;
  final GetCurrentUserIdUsecase _getCurrentUserIdUsecase;
  AuthenticationBloc({
    required UserSignupUsecase userSignupUsecase,
    required UserLoginUsecase userLoginUsecase,
    required UserLogoutUsecase userLogoutUsecase,
    required GetCurrentUserIdUsecase getCurrentUserIdUsecase,
  })  : _userSignupUsecase = userSignupUsecase,
        _userLoginUsecase = userLoginUsecase,
        _userLogoutUsecase = userLogoutUsecase,
        _getCurrentUserIdUsecase = getCurrentUserIdUsecase,
        super(AuthenticationInitial()) {
    on<AuthenticationEvent>(
      (event, emit) => emit(AuthenticationLoadingState()),
    );
    on<SignUpUserEvent>(signUpUserEvent);
    on<LogInUserEvent>(logInUserEvent);
    on<LogOutUserEvent>(logOutUserEvent);
    on<CheckUserLoggedInEvent>(checkUserLoggedInEvent);
    on<GetCurrentUserIdEvent>(getCurrentUserIdEvent);
  }

  FutureOr<void> signUpUserEvent(
      SignUpUserEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoadingState());
    try {
      final res = await _userSignupUsecase(
          params: UserEntity(
        userEmail: event.userEmail,
        userPassword: event.userPassword,
      ));
      res.fold(
        (left) => emit(AuthenticationErrorState(message: left.message)),
        (uid) {
          uid != null
              ? emit(AuthenticationSuccessState(userId: uid))
              : emit(AuthenticationErrorState(message: "User not found"));
        },
      );
    } catch (e) {
      emit(AuthenticationErrorState(message: e.toString()));
    }
  }

  Future<FutureOr<void>> logInUserEvent(
      LogInUserEvent event, Emitter<AuthenticationState> emit) async {
    try {
      emit(AuthenticationLoadingState());

      final res = await _userLoginUsecase(
          params: UserEntity(
        userEmail: event.userEmail,
        userPassword: event.userPassword,
      ));

      res.fold(
        (left) {
          emit(AuthenticationErrorState(message: left.message));
        },
        (uid) {
          uid != null
              ? emit(AuthenticationSuccessState(userId: uid))
              : emit(AuthenticationErrorState(message: "User not found"));
        },
      );
    } catch (e) {
      emit(AuthenticationErrorState(message: e.toString()));
    }
  }

  Future<FutureOr<void>> logOutUserEvent(
      LogOutUserEvent event, Emitter<AuthenticationState> emit) async {
    try {
      final res = await _userLogoutUsecase(params: null);
      res.fold(
        (left) => emit(AuthenticationErrorState(message: left.message)),
        (isLoggedOut) => isLoggedOut,
      );
    } catch (e) {
      emit(AuthenticationErrorState(message: e.toString()));
    }
  }

  Future<FutureOr<void>> checkUserLoggedInEvent(
      CheckUserLoggedInEvent event, Emitter<AuthenticationState> emit) async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final isLoggedIn = sharedPreferences.getBool(userAuthStatus);
      emit(AuthenticationInitial(isUserLoggedIn: isLoggedIn));
    } catch (e) {
      emit(AuthenticationErrorState(message: e.toString()));
    }
  }

  FutureOr<void> getCurrentUserIdEvent(
      GetCurrentUserIdEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoadingState());

    try {
      final res = await _getCurrentUserIdUsecase(params: null);
      res.fold(
        (left) => AuthenticationErrorState(message: left.message),
        (currentUserId) => AuthenticationInitial(currentUserId: currentUserId),
      );
    } catch (e) {
      emit(AuthenticationErrorState(message: e.toString()));
    }
  }
}
