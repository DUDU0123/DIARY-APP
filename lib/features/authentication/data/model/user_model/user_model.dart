import 'package:diary_app/core/constants/db_field_name_constants.dart';
import 'package:diary_app/features/authentication/domain/entity/user_entity/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    super.userId,
    super.userCreatedDate,
    super.userEmail,
    super.userName,
    super.userProfilePic,
    super.userPassword,
  });
  // fromJson method
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        userId: json[dbUserId] as String?,
        userEmail: json[dbUserEmail] as String?,
        userName: json[dbUserName] as String?,
        userPassword: json[dbUserPassword] as String?,
        userCreatedDate: json[dbUserCreatedDate] as String?,
        userProfilePic: json[dbUserProfilePic] as String?,);

  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      dbUserId: userId,
      dbUserEmail: userEmail,
      dbUserName: userName,
      dbUserPassword: userPassword,
      dbUserProfilePic: userProfilePic,
      dbUserCreatedDate: userCreatedDate,
    };
  }

  // copyWith method
  UserModel copyWith({
    String? userId,
    String? userEmail,
    String? userName,
    String? userPassword,
    String? userProfilePic,
    String? userCreatedDate,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      userEmail: userEmail ?? this.userEmail,
      userName: userName ?? this.userName,
      userPassword: userPassword ?? this.userPassword,
      userCreatedDate: userCreatedDate??this.userCreatedDate,
      userProfilePic: userProfilePic ?? this.userProfilePic,
    );
  }
}
