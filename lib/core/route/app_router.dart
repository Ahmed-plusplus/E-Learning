import 'package:elearning/core/route/app_routes.dart';
import 'package:elearning/core/service/service_locator.dart';
import 'package:elearning/features/auth/data/repository/auth_repository.dart';
import 'package:elearning/features/auth/presentation/view_models/cubit/login/login_cubit.dart';
import 'package:elearning/features/auth/presentation/view_models/cubit/signup/signup_cubit.dart';
import 'package:elearning/features/auth/presentation/views/login_view.dart';
import 'package:elearning/features/auth/presentation/views/signup_view.dart';
import 'package:elearning/features/auth/presentation/views/splash_view.dart';
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
      path: AppRoutes.home,
      builder: (context, state) => SplashView()
    ),
  ]
);