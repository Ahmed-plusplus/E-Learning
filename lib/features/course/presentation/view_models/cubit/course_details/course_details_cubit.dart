import 'package:elearning/features/course/data/model/course_model.dart';
import 'package:elearning/features/course/data/repository/course_repository.dart';
import 'package:elearning/features/course/presentation/view_models/cubit/course_details/course_details_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseDetailsCubit extends Cubit<CourseDetailsStates> {

  CourseRepository _repository;

  CourseDetailsCubit({required this._repository, required CourseModel course}): super(CourseDetailsStates(course: course));

  Future<void> checkEnrollment() async{
    emit(state.copyWith(CourseDetailsStatus.loadingCheckEnrollment));
    final response = await _repository.checkEnrollment(state.course.id!);
    response.fold(
        (failure) => emit(
            state.copyWith(CourseDetailsStatus.failedCheckEnrollment, errorMessage: failure.errorMessage)
        ),
        (isEnrolled) => emit(state.copyWith(CourseDetailsStatus.loadedCheckEnrollment, isEnrolled: isEnrolled))
    );
  }

  Future<void> enrollCourse() async{
    emit(state.copyWith(CourseDetailsStatus.loadingEnrollCourse));
    final response = await _repository.enrollCourse(state.course.id!);
    response.fold(
        (failure) => emit(
            state.copyWith(CourseDetailsStatus.failedEnrollCourse, errorMessage: failure.errorMessage)
        ),
        (_) => emit(state.copyWith(CourseDetailsStatus.loadedEnrollCourse, isEnrolled: true))
    );
  }

}