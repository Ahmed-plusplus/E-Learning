import 'package:elearning/core/utils/app_colors.dart';
import 'package:elearning/core/utils/app_dimensions.dart';
import 'package:elearning/core/utils/app_strings.dart';
import 'package:elearning/features/base/presentation/view_models/cubit/base_cubit.dart';
import 'package:elearning/features/base/presentation/view_models/cubit/base_states.dart';
import 'package:elearning/features/base/presentation/views/widgets/list_course_card.dart';
import 'package:flutter/material.dart';

class MyCourseView extends StatelessWidget {
  const MyCourseView({super.key, required this._cubit});

  final BaseCubit _cubit;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          height: 64 * (size.height / AppDimensions.figmaHeight),
          color: AppColors.primary,
          child: Center(child: Text(
            AppStrings.subscribedCourses,
            style: theme.appBarTheme.titleTextStyle?.copyWith(fontWeight: FontWeight.w500, ),)),
        ),
        Expanded(
          child: (_cubit.state.status == BaseStatus.loadingMyCourses)
          ? Center(child: CircularProgressIndicator())
          : (_cubit.state.myCourses?.isEmpty ?? true)
              ? Center(child: Text(AppStrings.noCoursesEnrolled, style: theme.textTheme.headlineMedium,))
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
