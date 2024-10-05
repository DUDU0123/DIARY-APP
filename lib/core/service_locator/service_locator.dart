import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_app/features/authentication/data/data_sources/authentication_remote_data.dart';
import 'package:diary_app/features/authentication/data/repository/auth_repo_impl/authentication_repository_impl.dart';
import 'package:diary_app/features/authentication/domain/repository/auth_repo/authentication_repository.dart';
import 'package:diary_app/features/authentication/domain/usecase/get_current_userid_usecase.dart';
import 'package:diary_app/features/authentication/domain/usecase/user_login_usecase.dart';
import 'package:diary_app/features/authentication/domain/usecase/user_logout_usecase.dart';
import 'package:diary_app/features/authentication/domain/usecase/user_signup_usecase.dart';
import 'package:diary_app/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:diary_app/features/diary_home/data/data_source/diary_feed_datasource.dart';
import 'package:diary_app/features/diary_home/data/repository/diary_feed_repo_impl.dart';
import 'package:diary_app/features/diary_home/domain/repository/diary_feed_repository.dart';
import 'package:diary_app/features/diary_home/domain/usecases/get_diaries.dart';
import 'package:diary_app/features/diary_home/presentation/diary_feed_cubit/diary_feed_cubit.dart';
import 'package:diary_app/features/new_diary/data/datasources/diary_remote_data_source.dart';
import 'package:diary_app/features/new_diary/data/repositories/diary_repository_impl.dart';
import 'package:diary_app/features/new_diary/domain/repositories/diary_repository.dart';
import 'package:diary_app/features/new_diary/domain/usecases/add_diary_entry.dart';
import 'package:diary_app/features/new_diary/presentation/bloc/diary_manager/diary_manager_bloc.dart';
import 'package:diary_app/features/settings/data/data_sources/profile_manager/profile_manager.dart';
import 'package:diary_app/features/settings/data/repository/profile_manager_repo_impl/profile_manager_repo_impl.dart';
import 'package:diary_app/features/settings/domain/repository/profile_manager_repo/profile_manager_repo.dart';
import 'package:diary_app/features/settings/domain/usecase/update_user_profile_image_usecase.dart';
import 'package:diary_app/features/settings/domain/usecase/updater_user_profile_usecase.dart';
import 'package:diary_app/features/settings/presentation/bloc/settings_user_profile/setting_user_profile_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  initAuthDependencies();
  initUserProfileDependencies();
  initDiaryDependencies();
  diaryFeed();
  serviceLocator.registerLazySingleton(() => FirebaseAuth.instance);
  serviceLocator.registerLazySingleton(() => FirebaseStorage.instance);
  serviceLocator.registerLazySingleton(() => FirebaseFirestore.instance);
}

void initAuthDependencies() {
  serviceLocator
    ..registerFactory<AuthenticationRemoteData>(
      () => AuthenticationRemoteDataImpl(
        firebaseAuth: serviceLocator<FirebaseAuth>(),
        firebaseFirestore: serviceLocator<FirebaseFirestore>(),
      ),
    )
    ..registerFactory<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(
        authenticationData: serviceLocator(),
      ),
    )
    ..registerFactory<UserSignupUsecase>(
      () => UserSignupUsecase(
        authenticationRepository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserLogoutUsecase(
        authenticationRepository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserLoginUsecase(
        authenticationRepository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => GetCurrentUserIdUsecase(
        authenticationRepository: serviceLocator(),
      ),
    )
    ..registerLazySingleton<AuthenticationBloc>(
      () => AuthenticationBloc(
        getCurrentUserIdUsecase: serviceLocator(),
        userSignupUsecase: serviceLocator(),
        userLoginUsecase: serviceLocator(),
        userLogoutUsecase: serviceLocator(),
      ),
    );
}

void initUserProfileDependencies() {
  serviceLocator
    ..registerFactory<ProfileManager>(
      () => ProfileManagerImpl(
        firebaseFirestore: serviceLocator<FirebaseFirestore>(),
        firebaseAuth: serviceLocator<FirebaseAuth>(),
      ),
    )
    ..registerFactory<ProfileManagerRepo>(
      () => ProfileManagerRepoImpl(
        profileManager: serviceLocator(),
      ),
    )
    ..registerFactory<UpdaterUserProfileUsecase>(
      () => UpdaterUserProfileUsecase(
        profileManagerRepo: serviceLocator(),
      ),
    )
    ..registerFactory<UpdateUserProfileImageUsecase>(
      () => UpdateUserProfileImageUsecase(
        profileManagerRepo: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => SettingUserProfileBloc(
        updateUserProfileImageUsecase: serviceLocator(),
        updaterUserProfileUsecase: serviceLocator(),
      ),
    );
}

void initDiaryDependencies() {
  serviceLocator
    ..registerFactory<DiaryRemoteDataSource>(
        () => DiaryRemoteDataSourceImpl(serviceLocator()))
    ..registerFactory<DiaryRepository>(
        () => DiaryRepositoryImpl(serviceLocator()))
    ..registerFactory(() => AddDiaryEntry(serviceLocator()))
    ..registerFactory(() => DiaryManagerBloc(serviceLocator()));
}

void diaryFeed() {
  serviceLocator
    ..registerLazySingleton<DiaryFeedDatasource>(
        () => DiaryFeedDatasourceImpl(firestore: serviceLocator()))
    ..registerLazySingleton<DiaryFeedRepository>(
        () => DiaryFeedRepoImpl(remoteDataSource: serviceLocator()))
    ..registerLazySingleton(
        () => GetDiariesUseCases(diaryFeedRepository: serviceLocator()))
    ..registerFactory(
        () => DiaryFeedCubit(getDiariesUseCases: serviceLocator()));
}
