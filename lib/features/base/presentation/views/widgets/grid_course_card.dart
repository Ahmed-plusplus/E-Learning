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

class GridCourseCard extends StatelessWidget {
  const GridCourseCard({super.key, required this._course});

  final CourseModel _course;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card.filled(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.cardBorder),
        borderRadius: BorderRadius.circular(AppDimensions.radius),
      ),
      color: AppColors.white,
      margin: EdgeInsetsGeometry.all(8),
      child: Padding(
        padding: EdgeInsetsGeometry.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: 153 / 86,
              child: Container(
                height: 86 * 204 / AppDimensions.figmaHeight,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(AppDimensions.imageRadius),
                ),
                child: (_course.imageUrl == null)
                    ? null
                    : (_course.imageUrl!.contains('.svg'))
                      ? SvgPicture.network(_course.imageUrl!)
                      : CachedNetworkImage(imageUrl: _course.imageUrl!),
              ),
            ),
            SizedBox(height: 12),
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
            SizedBox(height: 4,),
            Text(
              AppStrings.egp(_course.price ?? 0),
              style: theme.textTheme.labelMedium?.copyWith(
                fontFamily: AppFonts.nimbusSans,
              ),
            ),
            Spacer(),
            CustomElevatedButton(
              text: AppStrings.showDetails,
              onPressed: () => context.go(AppRoutes.courseDetails),
            )
          ],
        ),
      ),
    );
  }
}
