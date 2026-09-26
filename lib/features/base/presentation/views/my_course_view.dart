import 'package:elearning/features/base/presentation/view_models/cubit/base_cubit.dart';
import 'package:elearning/features/base/presentation/views/widgets/list_course_card.dart';
import 'package:flutter/material.dart';

class MyCourseView extends StatelessWidget {
  const MyCourseView({super.key, required this._cubit});

  final BaseCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: (_cubit.state.myCourses == null)
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
            itemBuilder: (context, index) => ListCourseCard(course: _cubit.state.myCourses![index]),
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: _cubit.state.myCourses!.length,
          ),
        ),
      ],
    );
  }
}
