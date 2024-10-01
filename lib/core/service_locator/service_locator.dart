import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // initAuthDependencies();
  // initUserProfileDependencies();
  // initNoteDataDependencies();
  serviceLocator.registerLazySingleton(() => FirebaseAuth.instance);
  serviceLocator.registerLazySingleton(() => FirebaseStorage.instance);
  serviceLocator.registerLazySingleton(() => FirebaseFirestore.instance);
}

// void initAuthDependencies() {
//   serviceLocator
//     ..registerFactory<AuthRemoteDataSource>(
//       () => AuthRemoteDataSourceImpl(
//         firebaseAuth: serviceLocator<FirebaseAuth>(),
//         firebaseFirestore: serviceLocator<FirebaseFirestore>(),
//       ),
//     )
//     ..registerFactory<AuthRepository>(
//       () => AuthRepositoryImpl(
//         authRemoteDataSource: serviceLocator(),
//       ),
//     )
//     ..registerFactory<UserSignUp>(
//       () => UserSignUp(
//         authRepository: serviceLocator(),
//       ),
//     )
//     ..registerFactory(
//       () => UserLogOut(
//         authRepository: serviceLocator(),
//       ),
//     )
//     ..registerFactory(
//       () => UserLogin(
//         authRepository: serviceLocator(),
//       ),
//     )
//     ..registerFactory(
//       () => GetCurrentUser(
//         authRepository: serviceLocator(),
//       ),
//     )
//     ..registerLazySingleton<AuthenticationBloc>(
//       () => AuthenticationBloc(
//         getCurrentUser: serviceLocator(),
//         userSignUp: serviceLocator(),
//         userLogOut: serviceLocator(),
//         userLogIn: serviceLocator(),
//       ),
//     );
// }

// void initUserProfileDependencies() {
//   serviceLocator
//     ..registerFactory<ProfileManager>(
//       () => ProfileManagerImpl(
//         firebaseFirestore: serviceLocator<FirebaseFirestore>(),
//         firebaseAuth: serviceLocator<FirebaseAuth>(),
//       ),
//     )
//     ..registerFactory<ProfileManagerRepo>(
//       () => ProfileManagerRepoImpl(
//         profileManager: serviceLocator(),
//       ),
//     )
//     ..registerFactory<UpdaterUserProfileUsecase>(
//       () => UpdaterUserProfileUsecase(
//         profileManagerRepo: serviceLocator(),
//       ),
//     )
//     ..registerFactory<UpdateUserProfileImageUsecase>(
//       () => UpdateUserProfileImageUsecase(
//         profileManagerRepo: serviceLocator(),
//       ),
//     )
//     ..registerLazySingleton(
//       () => SettingsProfileBloc(
//         updateUserProfileImageUsecase: serviceLocator(),
//         updaterUserProfileUsecase: serviceLocator(),
//       ),
//     );
// }

