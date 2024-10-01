import 'package:diary_app/core/error/exceptions/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseExceptionHandler {
  static Exception getFirebaseAuthExceptionMessage({
    required FirebaseAuthException firebaseAuthException,
  }) {
    switch (firebaseAuthException.code) {
      case 'invalid-email':
        return ClientException(message: "You've entered invalid email");
      case 'user-disabled':
        return ServerException(message: "User is disabled");
      case 'user-not-found':
        return ServerException(message: "User not found");
      case 'wrong-password':
        return ClientException(message: "You've entered wrong password");
      case 'network-request-failed':
        return ClientException(message: "Please check your network connection");
      case 'too-many-requests':
        return ServerException(message: "Attempted too many requests");
      case 'user-token-expired':
        return ServerException(message: "Sorry, your token expired");
      case 'operation-not-allowed':
        return ServerException(message: "This operation is not allowed");
      case 'email-already-in-use':
        return ServerException(
            message: "Email already exists, try use another");
      case 'weak-password':
        return ClientException(message: "You've entered weak password");
      case 'account-exists-with-different-credential':
        return ClientException(
            message: "Account exists with different credentials");
      case 'invalid-verification-code':
        return ClientException(message: "Verification code is invalid");
      case 'invalid-verification-id':
        return ClientException(message: "Verification id is invalid");
      case 'user-mismatch':
        return ClientException(message: "Unable to match user");
      case 'invalid-credential':
        return ClientException(message: "Given credentials are invalid");
      default:
        return ServerException(message: "Something went wrong");
    }
  }
}
