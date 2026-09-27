import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearning/core/shared/widgets/custom_elevated_button.dart';
import 'package:elearning/core/utils/app_colors.dart';
import 'package:elearning/core/utils/app_dimensions.dart';
import 'package:elearning/core/utils/app_fonts.dart';
import 'package:elearning/core/utils/app_strings.dart';
import 'package:elearning/features/course/data/model/course_model.dart';
import 'package:elearning/features/course/presentation/view_models/cubit/course_details/course_details_cubit.dart';
import 'package:elearning/features/course/presentation/view_models/cubit/course_details/course_details_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class CourseDetailsView extends StatefulWidget {
  const CourseDetailsView({super.key, });

  @override
  State<CourseDetailsView> createState() => _CourseDetailsViewState();
}

class _CourseDetailsViewState extends State<CourseDetailsView> {

  late CourseDetailsCubit _cubit;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightRatio = size.height / AppDimensions.figmaHeight;
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(AppStrings.courseDetails),),
        body: BlocConsumer<CourseDetailsCubit, CourseDetailsStates>(
          listener: (context, state){

          },
          builder: (context, state) {
            _cubit = context.read<CourseDetailsCubit>();
            return Column(
              children: [
                AspectRatio(
                  aspectRatio: AppDimensions.figmaWidth / 256,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppDimensions.imageRadius),
                    child: (_cubit.state.course.imageUrl == null)
                        ? Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        height: 85 * heightRatio,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(AppDimensions.imageRadius),
                        ),
                      ),
                    )
                        : (_cubit.state.course.imageUrl!.contains('.svg'))
                        ? SvgPicture.network(_cubit.state.course.imageUrl!)
                        : CachedNetworkImage(imageUrl: _cubit.state.course.imageUrl!),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24 * heightRatio,),
                      Text(
                        _cubit.state.course.name ?? '',
                        style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.titleDetails
                        ),
                      ),
                      SizedBox(height: 8 * heightRatio,),
                      Text(
                        AppStrings.egp(_cubit.state.course.price ?? 0),
                        style: theme.textTheme.titleLarge?.copyWith(
                            fontFamily: AppFonts.publicSans,
                            color: AppColors.priceDetails
                        ),
                      ),
                      SizedBox(height: 23 * heightRatio,),
                      Text(
                        AppStrings.description,
                        style: theme.textTheme.bodyLarge?.copyWith(
                            color: AppColors.title,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      SizedBox(height: 25 * heightRatio,),
                      Text(
                          _cubit.state.course.description ?? '',
                          style: theme.textTheme.bodyMedium
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: CustomElevatedButton(
                    text: AppStrings.startCourse,
                    onPressed: () => null,
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
