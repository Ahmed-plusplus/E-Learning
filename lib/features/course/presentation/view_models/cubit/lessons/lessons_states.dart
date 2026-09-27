import 'package:elearning/features/course/data/model/lesson_model.dart';

enum LessonsStatus {
  initial,
  initGetThumbnail,
  successGetThumbnail,
  failedGetThumbnail,
}

class LessonsStates {
  LessonsStatus status;
  List<LessonModel> lessons;
  List? thumbnails;
  String? errorMessage;

  LessonsStates({
    this.status = LessonsStatus.initial,
    required this.lessons,
    this.thumbnails,
    this.errorMessage,
  });

  LessonsStates copyWith(
  LessonsStatus status, {
    List<LessonModel>? lessons,
    List? thumbnails,
    String? errorMessage
  }) => LessonsStates(
    status: status,
    lessons: lessons ?? this.lessons,
    thumbnails: thumbnails ?? this.thumbnails,
    errorMessage: errorMessage ?? this.errorMessage
  );
}
