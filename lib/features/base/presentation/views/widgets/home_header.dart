import 'package:elearning/core/utils/app_colors.dart';
import 'package:elearning/core/utils/app_dimensions.dart';
import 'package:elearning/core/utils/app_fonts.dart';
import 'package:elearning/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightRatio = (size.height / AppDimensions.figmaHeight);
    final height = 184 * heightRatio;
    final theme = Theme.of(context);
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppDimensions.authHeaderRadius),
          bottomRight: Radius.circular(AppDimensions.authHeaderRadius),
        ),
      ),
      padding: EdgeInsetsGeometry.only(left: 20, right: 20, bottom: 24 * heightRatio, top: 40 * heightRatio),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.hi(name),
            style: theme.textTheme.bodyLarge?.copyWith(
              fontFamily: AppFonts.nimbusSans,
              fontWeight: FontWeight.w600
            ),
          ),
          Text(
            AppStrings.welcome,
            style: theme.textTheme.titleLarge,
          ),

        ],
      ),
    );
  }
}
