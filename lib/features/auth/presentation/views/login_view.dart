import 'package:elearning/core/route/app_routes.dart';
import 'package:elearning/core/shared/widgets/custom_elevated_button.dart';
import 'package:elearning/core/utils/app_colors.dart';
import 'package:elearning/core/utils/app_dimensions.dart';
import 'package:elearning/core/utils/app_fonts.dart';
import 'package:elearning/core/utils/app_strings.dart';
import 'package:elearning/features/auth/presentation/view_models/cubit/login/login_cubit.dart';
import 'package:elearning/features/auth/presentation/view_models/cubit/login/login_states.dart';
import 'package:elearning/features/auth/presentation/views/widgets/login_form.dart';
import 'package:elearning/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'widgets/main_header_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  late LoginCubit _cubit;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final widthRatio = size.width / AppDimensions.figmaWidth;
    final heightRatio = size.height / AppDimensions.figmaHeight;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const MainHeaderWidget(pageName: AppStrings.login,),
            Expanded(
              child: SingleChildScrollView(
                child: BlocConsumer<LoginCubit, LoginStates>(
                  listenWhen: (context, state) => state.status == LoginStatus.successLogin
                    || state.status == LoginStatus.failedLogin,
                  listener: (context, state){
                    if(state.status == LoginStatus.successLogin){
                      context.go(AppRoutes.base);
                    } else if(state.status == LoginStatus.failedLogin){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.errorMessage!),
                        ),
                      );
                    }
                  },
                  buildWhen: (context, state) => state.status == LoginStatus.initial
                    || state.status == LoginStatus.loadingLogin
                    || state.status == LoginStatus.failedLogin,
                  builder: (context, state) {
                    _cubit = context.read<LoginCubit>();
                    return Padding(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 30 * widthRatio, vertical: 40 * heightRatio),
                      child: Column(
                        children: [
                          LoginForm(formKey: _formKey, cubit: _cubit),
                          SizedBox(height: 20 * heightRatio,),
                          Align(
                            alignment: AlignmentGeometry.centerEnd,
                            child: Text(
                              AppStrings.forgetPassword,
                              style: theme.textTheme.titleSmall?.copyWith(
                                color: AppColors.text1, fontFamily: AppFonts.nimbusSans,
                              ),
                            ),
                          ),
                          SizedBox(height: 34 * heightRatio,),
                          CustomElevatedButton(
                            onPressed: () {
                              if(_formKey.currentState!.validate()) {
                                _cubit.login();
                              }
                            },
                            text: AppStrings.login,
                            isEnabled: state.status != LoginStatus.loadingLogin,
                          ),
                          SizedBox(height: 20 * heightRatio,),
                          Row(
                            children: [
                              Expanded(child: Container(height: 1, color: AppColors.divider,)),
                              Padding(
                                padding: EdgeInsetsGeometry.symmetric(horizontal: 16 * widthRatio),
                                child: Text(
                                  AppStrings.continueWith,
                                  style: theme.textTheme.titleMedium?.copyWith(fontFamily: AppFonts.nimbusSans),
                                ),
                              ),
                              Expanded(child: Container(height: 1, color: AppColors.divider,)),
                            ],
                          ),
                          SizedBox(height: 32 * heightRatio,),
                          Row(
                            children: [
                              Spacer(),
                              Assets.images.googleIcon.image(),
                              Spacer(),
                              Assets.icons.facebookIcon.svg(),
                              Spacer(),
                              Assets.icons.appleIcon.svg(),
                              Spacer(),
                            ],
                          ),
                          SizedBox(height: 90 * heightRatio,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.noAccount,
                                style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.text2),
                              ),
                              GestureDetector(
                                onTap: () => context.go(AppRoutes.signup),
                                child: Text(
                                  AppStrings.signup,
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
