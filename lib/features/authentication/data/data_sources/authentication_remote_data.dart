import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_app/config/routes/routes_name.dart';
import 'package:diary_app/core/constants/db_field_name_constants.dart';
import 'package:diary_app/core/constants/navigator_key.dart';
import 'package:diary_app/core/error/exceptions/exceptions.dart';
import 'package:diary_app/core/error/exceptions/firebase_exception_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

const userAuthStatus = 'userLoggedIn';

abstract interface class AuthenticationRemoteData {
  Future<String?> loginUser({
    required String email,
    required String password,
  });
  Future<String?> signUpUser({
    required String email,
    required String password,
  });
  String? getCurrentUserId();
  Future<bool?> logOutUser();
  Future<void> setUserAuthStatus({required bool value});
}

class AuthenticationRemoteDataImpl extends AuthenticationRemoteData {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  AuthenticationRemoteDataImpl({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });
  @override
  Future<String?> signUpUser({
    required String email,
    required String password,
  }) async {
    try {
      RegExp emailRegExp =
          RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
      RegExp passwordRegExp = RegExp(
          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&#]{8,}$');
      if (email.isNotEmpty && password.isNotEmpty) {
        if (emailRegExp.hasMatch(email)) {
          if (passwordRegExp.hasMatch(password)) {
            final userCred = await firebaseAuth.createUserWithEmailAndPassword(
              email: email,
              password: password,
            );
            if (userCred.user != null) {
              await firebaseFirestore
                  .collection(usersCollection)
                  .doc(userCred.user?.uid)
                  .set({
                dbUserCreatedDate: DateTime.now().toString(),
                dbUserId: userCred.user?.uid,
                dbUserEmail: email,
                dbUserPassword: password,
              });
              setUserAuthStatus(value: true);
              return userCred.user?.uid;
            } else {
              return null;
            }
          } else {
            throw ClientException(
              message:
                  "Password must contains atleast one uppercase, lowercase, number, special character",
            );
          }
        } else {
          throw ClientException(message: "Entered email is not valid");
        }
      } else {
        throw ClientException(message: "Enter valid credentials");
      }
    } on FirebaseAuthException catch (e) {
      throw FirebaseExceptionHandler.getFirebaseAuthExceptionMessage(
        firebaseAuthException: e,
      );
    } catch (e) {
      throw ServerException(message: "An unexpected error occured");
    }
  }

  @override
  Future<String?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final userCred = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCred.user != null) {
        setUserAuthStatus(value: true);
        return userCred.user?.uid;
      }
      throw ServerException(message: "User not found");
    } on FirebaseAuthException catch (e) {
      throw FirebaseExceptionHandler.getFirebaseAuthExceptionMessage(
        firebaseAuthException: e,
      );
    } catch (e) {
      throw ServerException(message: "An unexpected error occured");
    }
  }

  @override
  Future<bool?> logOutUser() async {
    if (firebaseAuth.currentUser != null) {
      await firebaseAuth.signOut();
      await setUserAuthStatus(value: false);
      return true;
    } else {
      return false;
    }
  }

  @override
  String? getCurrentUserId() {
    return firebaseAuth.currentUser?.uid;
  }

  @override
  Future<bool> setUserAuthStatus({required bool value}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setBool(userAuthStatus, value);
  }
}
