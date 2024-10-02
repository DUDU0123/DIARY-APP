part of 'setting_user_profile_bloc.dart';

sealed class SettingUserProfileEvent extends Equatable {
  const SettingUserProfileEvent();

  @override
  List<Object> get props => [];
}
class UpdateUserDataEvent extends SettingUserProfileEvent {
  final UserModel? updatedUserModel;
  const UpdateUserDataEvent({
    required this.updatedUserModel,
  });
  @override
  List<Object> get props => [updatedUserModel??const UserModel()];
}
class UpdateUserProfileImageEvent extends SettingUserProfileEvent {
  final File file;
  final UserModel updatedUserModel;
  const UpdateUserProfileImageEvent({
    required this.file,required this.updatedUserModel,
  });
  @override
  List<Object> get props => [file,];
}