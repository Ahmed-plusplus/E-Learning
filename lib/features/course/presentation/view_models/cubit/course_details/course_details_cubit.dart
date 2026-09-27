import 'package:elearning/features/course/data/model/course_model.dart';
import 'package:elearning/features/course/presentation/view_models/cubit/course_details/course_details_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseDetailsCubit extends Cubit<CourseDetailsStates> {

  CourseDetailsCubit(CourseModel course): super(CourseDetailsStates(course: course));


}