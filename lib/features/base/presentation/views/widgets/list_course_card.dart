import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearning/core/route/app_routes.dart';
import 'package:elearning/core/shared/widgets/custom_elevated_button.dart';
import 'package:elearning/core/utils/app_colors.dart';
import 'package:elearning/core/utils/app_dimensions.dart';
import 'package:elearning/core/utils/app_fonts.dart';
import 'package:elearning/core/utils/app_strings.dart';
import 'package:elearning/features/base/data/model/course_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class ListCourseCard extends StatelessWidget {
  const ListCourseCard({super.key, required this._course});

  final CourseModel _course;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card.filled(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.cardBorder),
        borderRadius: BorderRadius.circular(AppDimensions.cardListRadius),
      ),
      color: AppColors.white,
      margin: EdgeInsetsGeometry.all(8),
      child: Padding(
        padding: EdgeInsetsGeometry.all(24),
        child: Row(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 128 / 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppDimensions.imageRadius),
                  child: (_course.imageUrl == null)
                    ? Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                        height: 80 * 130 / AppDimensions.figmaHeight,
                        width: 128 * 358 / AppDimensions.figmaWidth,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(AppDimensions.imageRadius),
                        ),
                      ),
                    )
                    : (_course.imageUrl!.contains('.svg'))
                      ? SvgPicture.network(_course.imageUrl!)
                      : CachedNetworkImage(imageUrl: _course.imageUrl!),
                ),
              ),
            ),
            SizedBox(width: 24,),
            Expanded(
              child: Column(
                children: [
                  Text(
                    _course.name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontFamily: AppFonts.nimbusSans,
                      fontWeight: FontWeight.w700,
                      color: AppColors.cardTitle,
                    ),
                  ),
                  SizedBox(height: 12,),
                  CustomElevatedButton(
                    text: AppStrings.completeCourse,
                    onPressed: () => context.push(
                      AppRoutes.lessons,
                      extra: _course.lessons?.map((lesson) => lesson.toMap()).toList() ?? [],
                    ),
                    fontFamily: AppFonts.publicSans,
                    fontSize: 14,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
