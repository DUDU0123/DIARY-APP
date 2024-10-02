import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? userId;
  final String? userName;
  final String? userEmail;
  final String? userPassword;
  final String? userProfilePic;
  final String? userCreatedDate;
  const UserEntity({
    this.userId,
    this.userName,
    this.userEmail,
    this.userPassword,
    this.userProfilePic,this.userCreatedDate,
  });

  @override
  List<Object?> get props => [
        userId,
        userName,
        userEmail,
        userPassword,
        userProfilePic,userCreatedDate,
      ];
}
