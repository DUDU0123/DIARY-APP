import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthenticationRemoteData {
  // void loginUser();
  // void signUpUser();
  // void logOutUser();
}

class AuthenticationRemoteDataImpl extends AuthenticationRemoteData {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  AuthenticationRemoteDataImpl({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });

  signUpUser(){}

  loginUser(){}

  logOutUser(){}
}
