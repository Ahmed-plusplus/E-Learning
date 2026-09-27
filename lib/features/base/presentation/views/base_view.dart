import 'package:elearning/core/utils/app_colors.dart';
import 'package:elearning/core/utils/app_dimensions.dart';
import 'package:elearning/core/utils/app_strings.dart';
import 'package:elearning/features/base/presentation/view_models/cubit/base_cubit.dart';
import 'package:elearning/features/base/presentation/view_models/cubit/base_states.dart';
import 'package:elearning/features/base/presentation/views/home_view.dart';
import 'package:elearning/features/base/presentation/views/my_course_view.dart';
import 'package:elearning/features/base/presentation/views/profile_view.dart';
import 'package:elearning/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseView extends StatefulWidget {
  const BaseView({super.key});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {

  ValueNotifier<int> bottomNavBarIndex = ValueNotifier(0);
  late BaseCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: bottomNavBarIndex,
      builder: (context, value, child) {
        return SafeArea(
          child: Scaffold(
            body: BlocConsumer<BaseCubit, BaseStates>(
              listenWhen: (context, state) => state.status == BaseStatus.failedFetchingAllCourses
                || state.status == BaseStatus.failedFetchingMyCourses,
              listener: (context, state){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMessage!))
                );
              },
              builder: (context, state) {
                _cubit = context.read<BaseCubit>();
                return IndexedStack(
                  index: value,
                  children: [
                    HomeView(cubit: _cubit),
                    MyCourseView(cubit: _cubit),
                    ProfileView(),
                  ],
                );
              }
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppDimensions.bottomNavBarRadius),
                  topRight: Radius.circular(AppDimensions.bottomNavBarRadius),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                child: BottomNavigationBar(
                  items: [
                    BottomNavigationBarItem(icon: Assets.icons.homeIcon.svg(), label: AppStrings.home),
                    BottomNavigationBarItem(icon: Assets.icons.myCoursesIcon.svg(), label: AppStrings.myCourses),
                    BottomNavigationBarItem(icon: Assets.icons.profileIcon.svg(), label: AppStrings.profile),
                  ],
                  currentIndex: value,
                  onTap: (index) => bottomNavBarIndex.value = index,
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
