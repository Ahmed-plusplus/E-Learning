import 'package:elearning/features/course/data/model/course_model.dart';

enum CourseDetailsStatus{
  initial,
  loadingCheckEnrollment,
  loadedCheckEnrollment,
  failedCheckEnrollment,
  loadingEnrollCourse,
  loadedEnrollCourse,
  failedEnrollCourse
}
class CourseDetailsStates {
  CourseDetailsStatus status;
  CourseModel course;
  bool isEnrolled;
  String? errorMessage;

  CourseDetailsStates({
    this.status = CourseDetailsStatus.initial,
    required this.course,
    this.isEnrolled = false,
    this.errorMessage
  });

  CourseDetailsStates copyWith(
    CourseDetailsStatus status, {
    bool? isEnrolled,
    String? errorMessage
  }) => CourseDetailsStates(
    status: status,
    course: course,
    isEnrolled: isEnrolled ?? this.isEnrolled,
    errorMessage: errorMessage
  );
}

