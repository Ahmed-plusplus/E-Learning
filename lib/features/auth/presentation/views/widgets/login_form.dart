import 'package:elearning/core/shared/widgets/custom_text_field.dart';
import 'package:elearning/core/utils/app_strings.dart';
import 'package:elearning/features/auth/presentation/view_models/cubit/login/login_cubit.dart';
import 'package:elearning/generated/assets.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key, required this._cubit, required this._formKey});

  final LoginCubit _cubit;
  final GlobalKey _formKey;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormFieldState> emailKey = GlobalKey();
  final GlobalKey<FormFieldState> passwordKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            textFieldKey: emailKey,
            title: AppStrings.email,
            controller: emailController,
            hint: AppStrings.emailHint,
            icon: Assets.icons.loginEmailIcon,
            onChanged: (email) => _cubit.changeEmail(email),
            validator: (email){
              if(email?.isEmpty ?? true){
                return 'Please fill your email!';
              }
              return null;
            },
          ),
          SizedBox(height: 20,),
          CustomTextField(
            textFieldKey: passwordKey,
            title: AppStrings.password,
            controller: passwordController,
            hint: AppStrings.passwordHint,
            icon: Assets.icons.loginPasswordIcon,
            isPassword: true,
            onChanged: (password) => _cubit.changePassword(password),
            validator: (password){
              if(password?.isEmpty ?? true){
                return 'Please fill a strong password!';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
