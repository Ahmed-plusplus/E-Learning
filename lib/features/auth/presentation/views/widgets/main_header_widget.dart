import 'package:elearning/core/utils/app_colors.dart';
import 'package:elearning/core/utils/app_dimensions.dart';
import 'package:elearning/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class MainHeaderWidget extends StatelessWidget {
  const MainHeaderWidget({super.key, required this.pageName});

  final String pageName;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height * (188 / AppDimensions.figmaHeight);
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppDimensions.authHeaderRadius),
          bottomRight: Radius.circular(AppDimensions.authHeaderRadius),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(AppStrings.csAcademy, style: theme.textTheme.headlineLarge,),
            const SizedBox(height: 8,),
            Text(pageName, style: theme.textTheme.headlineSmall,),
          ],
        ),
      ),
    );
  }
}
