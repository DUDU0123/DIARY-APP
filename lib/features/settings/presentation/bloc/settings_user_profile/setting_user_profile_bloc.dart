import 'dart:async';
import 'dart:io';

import 'package:diary_app/features/authentication/data/model/user_model/user_model.dart';
import 'package:diary_app/features/settings/domain/usecase/update_user_profile_image_usecase.dart';
import 'package:diary_app/features/settings/domain/usecase/updater_user_profile_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'setting_user_profile_event.dart';
part 'setting_user_profile_state.dart';

class SettingUserProfileBloc
    extends Bloc<SettingUserProfileEvent, SettingUserProfileState> {
  final UpdateUserProfileImageUsecase _updateUserProfileImageUsecase;
  final UpdaterUserProfileUsecase _updaterUserProfileUsecase;
  SettingUserProfileBloc({
    required UpdateUserProfileImageUsecase updateUserProfileImageUsecase,
    required UpdaterUserProfileUsecase updaterUserProfileUsecase,
  })  : _updateUserProfileImageUsecase = updateUserProfileImageUsecase,
        _updaterUserProfileUsecase = updaterUserProfileUsecase,
        super(SettingUserProfileInitial()) {
    on<UpdateUserDataEvent>(updateUserDataEvent);
    on<UpdateUserProfileImageEvent>(updateUserProfileImageEvent);
  }
  FutureOr<void> updateUserDataEvent(
      UpdateUserDataEvent event, Emitter<SettingUserProfileState> emit) async {
    try {
      final res =
          await _updaterUserProfileUsecase(params: event.updatedUserModel);
      res.fold(
        (left) => emit(SettingsErrorState(message: left.message)),
        (r) => r,
      );
    } catch (e) {
      emit(SettingsErrorState(message: e.toString()));
    }
  }

  Future<FutureOr<void>> updateUserProfileImageEvent(
      UpdateUserProfileImageEvent event,
      Emitter<SettingUserProfileState> emit) async {
    try {
      final res = await _updateUserProfileImageUsecase(
        params: UserParams(file: event.file, userModel: event.updatedUserModel),
      );
      res.fold(
        (left) => emit(SettingsErrorState(message: left.message)),
        (r) => r,
      );
    } catch (e) {
      emit(SettingsErrorState(message: e.toString()));
    }
  }
}
