import 'package:equatable/equatable.dart';

class Diary extends Equatable {
  final String id;
  final String title;
  final String content;
  final DateTime createdAt;

  const Diary({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, title, content, createdAt];
}
