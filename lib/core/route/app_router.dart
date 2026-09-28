import 'package:elearning/core/route/app_routes.dart';
import 'package:elearning/core/service/service_locator.dart';
import 'package:elearning/features/auth/data/repository/auth_repository.dart';
import 'package:elearning/features/auth/presentation/view_models/cubit/login/login_cubit.dart';
import 'package:elearning/features/auth/presentation/view_models/cubit/signup/signup_cubit.dart';
import 'package:elearning/features/auth/presentation/views/login_view.dart';
import 'package:elearning/features/auth/presentation/views/signup_view.dart';
import 'package:elearning/features/auth/presentation/views/splash_view.dart';
import 'package:elearning/features/base/data/repository/base_repository.dart';
import 'package:elearning/features/base/presentation/view_models/cubit/base_cubit.dart';
import 'package:elearning/features/base/presentation/views/base_view.dart';
import 'package:elearning/features/course/data/model/course_model.dart';
import 'package:elearning/features/course/data/model/lesson_model.dart';
import 'package:elearning/features/course/data/repository/course_repository.dart';
import 'package:elearning/features/course/presentation/view_models/cubit/course_details/course_details_cubit.dart';
import 'package:elearning/features/course/presentation/view_models/cubit/lessons/lessons_cubit.dart';
import 'package:elearning/features/course/presentation/views/course_details_view.dart';
import 'package:elearning/features/course/presentation/views/lesson_video_view.dart';
import 'package:elearning/features/course/presentation/views/lessons_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => SplashView()
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => BlocProvider(
        create: (context) => LoginCubit(getIt<AuthRepository>()),
        child: LoginView(),
      ),
    ),
    GoRoute(
      path: AppRoutes.signup,
      builder: (context, state) => BlocProvider(
        create: (context) => SignupCubit(getIt<AuthRepository>()),
        child: SignupView(),
      )
    ),
    GoRoute(
      path: AppRoutes.base,
      builder: (context, state) => BlocProvider(
        create: (context) => BaseCubit(getIt<BaseRepository>())..init(),
        child: BaseView(),
      )
    ),
    GoRoute(
      path: AppRoutes.courseDetails,
      builder: (context, state) => BlocProvider(
        create: (context) => CourseDetailsCubit(
          repository: getIt<CourseRepository>(),
          course: CourseModel.fromJson(state.extra as Map<String, dynamic>),
        )..checkEnrollment(),
        child: CourseDetailsView(),
      )
    ),
    GoRoute(
      path: AppRoutes.lessons,
      builder: (context, state) => BlocProvider(
        create: (context) => LessonsCubit(
            (state.extra as List<Map<String, dynamic>>)
                .map((json) => LessonModel.fromJson(json)).toList()
              ..sort((l1, l2) => l1.order?.compareTo(l2.order ?? 0) ?? 0)
        )..getThumbnail(),
        child: LessonsView(),
      )
    ),
    GoRoute(
      path: AppRoutes.lessonVideo,
      builder: (context, state) => LessonVideoView(
        lesson: LessonModel.fromJson(state.extra as Map<String, dynamic>),
      )
    ),
  ]
);