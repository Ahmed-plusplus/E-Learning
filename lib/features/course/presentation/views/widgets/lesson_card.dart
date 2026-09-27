import 'dart:io';

import 'package:elearning/core/route/app_routes.dart';
import 'package:elearning/core/utils/app_colors.dart';
import 'package:elearning/core/utils/app_dimensions.dart';
import 'package:elearning/core/utils/app_fonts.dart';
import 'package:elearning/features/course/data/model/lesson_model.dart';
import 'package:elearning/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class LessonCard extends StatelessWidget {
  const LessonCard({super.key, required this._lesson, this.thumbnail});

  final LessonModel _lesson;
  final String? thumbnail;

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
        padding: EdgeInsetsGeometry.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppDimensions.imageRadius),
              child: (thumbnail == null)
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        height: 64,
                        width: 64,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            AppDimensions.imageRadius,
                          ),
                        ),
                      ),
                    )
                  : Image.file(File(thumbnail!), height: 64, width: 64, fit: BoxFit.cover,),
            ),
            SizedBox(width: 16,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _lesson.name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontFamily: AppFonts.nimbusSans,
                      fontWeight: FontWeight.w700,
                      color: AppColors.cardTitle,
                    ),
                  ),
                  SizedBox(height: 12,),
                  Text(_lesson.description ?? ''),
                ],
              ),
            ),
            SizedBox(width: 16,),
            GestureDetector(
              onTap: () => context.push(AppRoutes.lessonVideo, extra: _lesson.toMap()),
              child: CircleAvatar(
                backgroundColor: AppColors.primary,
                child: Assets.icons.playIcon.svg(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
