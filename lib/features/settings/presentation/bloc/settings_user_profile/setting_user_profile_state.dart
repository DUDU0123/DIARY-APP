part of 'setting_user_profile_bloc.dart';

sealed class SettingUserProfileState extends Equatable {
  const SettingUserProfileState();
  
  @override
  List<Object> get props => [];
}

final class SettingUserProfileInitial extends SettingUserProfileState {}
class SettingsLoadingState extends SettingUserProfileState {}

class SettingsErrorState extends SettingUserProfileState {
  final String message;
  const SettingsErrorState({
    required this.message,
  });
  @override
  List<Object> get props => [
        message,
      ];
}
