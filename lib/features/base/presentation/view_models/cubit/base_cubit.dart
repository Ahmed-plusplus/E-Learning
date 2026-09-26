import 'package:elearning/features/base/data/model/course_model.dart';
import 'package:elearning/features/base/data/repository/base_repository.dart';
import 'package:elearning/features/base/presentation/view_models/cubit/base_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseCubit extends Cubit<BaseStates> {

  BaseCubit(this._repository): super(BaseStates());

  BaseRepository _repository;

  Future<void> init() async{
    await loadUserName();
    await fetchAllCourses();
    await fetchMyCourses();
  }

  Future<void> loadUserName() async{
    emit(state.copyWith(BaseStatus.loadingUserName));
    String userName = await _repository.getUserName();
    emit(state.copyWith(BaseStatus.loadedUserName, userName: userName));
  }

  Future<void> fetchAllCourses() async {
    emit(state.copyWith(BaseStatus.loadingAllCourses));
    final response = await _repository.fetchAllCourses();
    response.fold(
            (failure) => emit(state.copyWith(BaseStatus.failedFetchingAllCourses, errorMessage: failure.errorMessage)),
            (courses) => emit(state.copyWith(BaseStatus.fetchedAllCourses, allCourses: courses))
    );
  }

  Future<void> fetchMyCourses() async {
    emit(state.copyWith(BaseStatus.loadingMyCourses));
    final myCoursesResponse = await _repository.fetchMyCourses();
    myCoursesResponse.fold(
            (failure) => emit(state.copyWith(BaseStatus.failedFetchingMyCourses, errorMessage: failure.errorMessage)),
            (courses) => emit(state.copyWith(BaseStatus.fetchedMyCourses, myCourses: courses))
    );
  }
}