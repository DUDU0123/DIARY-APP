import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_app/core/common_entity/diary.dart';

class DiaryModel extends Diary {
  const DiaryModel({
    required super.id,
    required super.title,
    required super.content,
    required super.createdAt,
  });

  // Factory method to create a DiaryModel from a Map (Firestore data)
  factory DiaryModel.fromMap(Map<String, dynamic> map) {
    return DiaryModel(
      id: map['dId'],
      title: map['title'],
      content: map['content'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  // Method to convert DiaryModel to a Map (for Firestore)
  Map<String, dynamic> toMap() {
    return {
      'dId': id,
      'title': title,
      'content': content,
      'createdAt': createdAt,
    };
  }

  // CopyWith method for creating a new instance with modified values
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

  // New method to convert a Diary entity to DiaryModel
  factory DiaryModel.fromEntity(Diary diary) {
    return DiaryModel(
      id: diary.id,
      title: diary.title,
      content: diary.content,
      createdAt: diary.createdAt,
    );
  }

  // Method to convert DiaryModel back to a Diary entity (if needed)
  Diary toEntity() {
    return Diary(
      id: id,
      title: title,
      content: content,
      createdAt: createdAt,
    );
  }
}
