import 'package:elearning/features/base/data/model/course_model.dart';

enum BaseStatus{
  initial,
  loadingUserName,
  loadedUserName,
  loadingAllCourses,
  fetchedAllCourses,
  failedFetchingAllCourses,
  loadingMyCourses,
  fetchedMyCourses,
  failedFetchingMyCourses,
}

class BaseStates {
  BaseStatus status;
  String userName;
  List<CourseModel>? allCourses;
  List<CourseModel>? myCourses;
  String? errorMessage;

  BaseStates({
    this.status = BaseStatus.initial,
    this.userName = '',
    this.allCourses,
    this.myCourses,
    this.errorMessage
  });

  BaseStates copyWith(
    BaseStatus status, {
    String? userName,
    List<CourseModel>? allCourses,
    List<CourseModel>? myCourses,
    String? errorMessage
  }) => BaseStates(
    status: status,
    userName: userName ?? this.userName,
    allCourses: allCourses ?? this.allCourses,
    myCourses: myCourses ?? this.myCourses,
    errorMessage: errorMessage
  );
}

