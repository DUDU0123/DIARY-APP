import 'dart:async';
import 'package:diary_app/core/common_entity/diary.dart';
import 'package:diary_app/core/error/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:diary_app/features/diary_home/data/data_source/diary_feed_datasource.dart';
import 'package:diary_app/core/error/exceptions/exceptions.dart';
import '../../domain/repository/diary_feed_repository.dart';

class DiaryFeedRepoImpl implements DiaryFeedRepository {
  final DiaryFeedDatasource remoteDataSource;

  DiaryFeedRepoImpl({required this.remoteDataSource});

  @override
  Stream<Either<Failure, List<Diary>>> fetchDiaryEntries() async* {
    try {
      final diaryEntriesStream = remoteDataSource.fetchDiaryEntries();
      await for (final entries in diaryEntriesStream) {
        yield Right(entries);
      }
    } on ClientException catch (e) {
      yield Left(Failure(message: e.message));
    } on FirebaseAuthException catch (e) {
      yield Left(
          Failure(message: e.message ?? 'Firebase Authentication Error'));
    } on ServerException catch (e) {
      yield Left(Failure(message: e.message));
    } catch (e) {
      yield Left(Failure(message: 'An unexpected error occurred: $e'));
    }
  }
}
