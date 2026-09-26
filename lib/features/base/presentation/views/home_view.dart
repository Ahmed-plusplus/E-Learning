import 'package:elearning/features/base/presentation/view_models/cubit/base_cubit.dart';
import 'package:flutter/material.dart';

import 'widgets/grid_course_card.dart';
import 'widgets/home_header.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this._cubit});

  final BaseCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeHeader(name: _cubit.state.userName,),
        Expanded(
          child: (_cubit.state.allCourses == null)
              ? Center(child: CircularProgressIndicator())
              : GridView.count(
                  crossAxisCount: 2,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  childAspectRatio: 171 / 204,
                  children: _cubit.state.allCourses!.map(
                      (course) => GridCourseCard(course: course)
                  ).toList(),
                ),
        ),
      ],
    );
  }
}
