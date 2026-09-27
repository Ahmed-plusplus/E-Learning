import 'package:elearning/core/route/app_routes.dart';
import 'package:elearning/core/shared/widgets/custom_elevated_button.dart';
import 'package:elearning/core/utils/app_colors.dart';
import 'package:elearning/core/utils/app_dimensions.dart';
import 'package:elearning/core/utils/app_fonts.dart';
import 'package:elearning/core/utils/app_strings.dart';
import 'package:elearning/features/auth/presentation/view_models/cubit/signup/signup_cubit.dart';
import 'package:elearning/features/auth/presentation/view_models/cubit/signup/signup_states.dart';
import 'package:elearning/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'widgets/main_header_widget.dart';
import 'widgets/signup_form.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {

  late SignupCubit _cubit;
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
            const MainHeaderWidget(pageName: AppStrings.signup,),
            Expanded(
              child: SingleChildScrollView(
                child: BlocConsumer<SignupCubit, SignupStates>(
                    listenWhen: (context, state) => state.status == SignupStatus.successSignup
                        || state.status == SignupStatus.failedSignup,
                    listener: (context, state){
                      if(state.status == SignupStatus.successSignup){
                        context.go(AppRoutes.base);
                      } else if(state.status == SignupStatus.failedSignup){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.errorMessage!),
                          ),
                        );
                      }
                    },
                    buildWhen: (context, state) => state.status == SignupStatus.initial
                        || state.status == SignupStatus.loadingSignup
                        || state.status == SignupStatus.failedSignup,
                    builder: (context, state) {
                      _cubit = context.read<SignupCubit>();
                      return Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 30 * widthRatio, vertical: 40 * heightRatio),
                        child: Column(
                          children: [
                            SignupForm(formKey: _formKey, cubit: _cubit),
                            SizedBox(height: 36 * heightRatio,),
                            CustomElevatedButton(
                              onPressed: () {
                                if(_formKey.currentState!.validate()) {
                                  _cubit.signup();
                                }
                              },
                              text: AppStrings.signup,
                              isEnabled: state.status != SignupStatus.loadingSignup,
                            ),
                            SizedBox(height: 20 * heightRatio,),
                            Row(
                              children: [
                                Expanded(child: Container(height: 1, color: AppColors.divider,)),
                                Padding(
                                  padding: EdgeInsetsGeometry.symmetric(horizontal: 16 * widthRatio),
                                  child: Text(
                                    AppStrings.signupWith,
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
                            SizedBox(height: 64 * heightRatio,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppStrings.haveAccount,
                                  style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.text2),
                                ),
                                GestureDetector(
                                  onTap: () => context.go(AppRoutes.login),
                                  child: Text(
                                    AppStrings.logIn,
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
