import 'package:elearning/core/utils/app_strings.dart';
import 'package:elearning/features/course/presentation/view_models/cubit/lessons/lessons_cubit.dart';
import 'package:elearning/features/course/presentation/view_models/cubit/lessons/lessons_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/lesson_card.dart';

class LessonsView extends StatelessWidget {
  const LessonsView({super.key, });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.courseVideos),
        ),
        body: BlocConsumer<LessonsCubit, LessonsStates>(
          listenWhen: (context, state) => state.status == LessonsStatus.failedGetThumbnail,
          listener: (context, state) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.errorMessage!))),
          builder: (context, state) {
            return ListView.builder(
              itemBuilder: (context, index) => LessonCard(
                lesson: state.lessons[index],
                thumbnail: state.thumbnails?[index],
              ),
              itemCount: state.lessons.length,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
            );
          }
        ),
      ),
    );
  }
}
