import 'package:elearning/features/course/data/model/lesson_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import 'lessons_states.dart';

class LessonsCubit extends Cubit<LessonsStates> {

  LessonsCubit(List<LessonModel> lessons): super(LessonsStates(lessons: lessons));

  Future<void> getThumbnail() async{
    emit(state.copyWith(LessonsStatus.initGetThumbnail));
    try {
      List thumbnailList = await Future.wait(
          List.generate(
            state.lessons.length,
                (index) async =>
            (state.lessons[index].videoUrl == null)
                ? null
                : await VideoThumbnail.thumbnailFile(
                  video: state.lessons[index].videoUrl!,
                  imageFormat: ImageFormat.WEBP,
                  timeMs: 1000
                ),
          )
      );
      emit(state.copyWith(LessonsStatus.successGetThumbnail, thumbnails: thumbnailList));
    } catch (e){
      emit(state.copyWith(LessonsStatus.failedGetThumbnail, errorMessage: e.toString()));
    }
  }

}