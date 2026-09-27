import 'dart:io';

import 'package:elearning/core/route/app_routes.dart';
import 'package:elearning/core/utils/app_colors.dart';
import 'package:elearning/core/utils/app_dimensions.dart';
import 'package:elearning/core/utils/app_fonts.dart';
import 'package:elearning/features/course/data/model/lesson_model.dart';
import 'package:elearning/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
            Expanded(
              child: Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(AppDimensions.imageRadius),
                ),
                child: (thumbnail == null) ? null : Image.file(File(thumbnail!)),
              ),
            ),
            SizedBox(width: 24,),
            Expanded(
              child: Column(
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
