import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_app/features/new_diary/domain/entities/diary.dart';

class DiaryModel extends Diary {
  DiaryModel({
    required String id,
    required String title,
    required String content,
    required DateTime createdAt,
  }) : super(id: id, title: title, content: content, createdAt: createdAt);

  factory DiaryModel.fromMap(Map<String, dynamic> map, String id) {
    return DiaryModel(
      id: id,
      title: map['title'],
      content: map['content'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'createdAt': createdAt,
    };
  }

  // CopyWith method to create a new instance with modified values
  DiaryModel copyWith({
    String? id,
    String? title,
    String? content,
    DateTime? createdAt,
  }) {
    return DiaryModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
