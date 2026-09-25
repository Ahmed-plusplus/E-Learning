import 'package:elearning/core/route/app_routes.dart';
import 'package:elearning/core/utils/app_colors.dart';
import 'package:elearning/core/utils/app_dimensions.dart';
import 'package:elearning/core/utils/app_strings.dart';
import 'package:elearning/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 3), () {
        if(mounted) {
          context.go(AppRoutes.login);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final imgSize = (size.width * (80 / AppDimensions.figmaWidth)).clamp(70, 100).toDouble();
    return Scaffold(
      backgroundColor: AppColors.splashBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: imgSize,
              height: imgSize,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.splashIconBorder, width: 2),
                borderRadius: BorderRadius.circular(AppDimensions.splashIconRadius),
                color: AppColors.splashIconContainer,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 23),
                child: Assets.icons.splashIcon.svg(),
              )
            ),
            const SizedBox(height: 24,),
            Text(AppStrings.csAcademy, style: Theme.of(context).textTheme.displayMedium,),
            const SizedBox(height: 8,),
            Text(AppStrings.splashBody, style: Theme.of(context).textTheme.bodyLarge,),
          ],
        ),
      ),
    );
  }
}
