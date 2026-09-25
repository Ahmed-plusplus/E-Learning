import 'package:elearning/core/shared/widgets/custom_text_field.dart';
import 'package:elearning/core/utils/app_strings.dart';
import 'package:elearning/features/auth/presentation/view_models/cubit/signup/signup_cubit.dart';
import 'package:elearning/generated/assets.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatelessWidget {
  SignupForm({super.key, required this._cubit, required this._formKey});

  final SignupCubit _cubit;
  final GlobalKey _formKey;
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormFieldState> fullNameKey = GlobalKey();
  final GlobalKey<FormFieldState> emailKey = GlobalKey();
  final GlobalKey<FormFieldState> passwordKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            textFieldKey: fullNameKey,
            title: AppStrings.fullName,
            controller: fullNameController,
            hint: AppStrings.fullNameHint,
            icon: Assets.icons.signupFullName,
            onChanged: (fullName) => _cubit.changeFullName(fullName),
            validator: (fullName){
              if(fullName?.isEmpty ?? true){
                return 'Please fill your fullName!';
              }
              return null;
            },
          ),
          CustomTextField(
            textFieldKey: emailKey,
            title: AppStrings.email,
            controller: emailController,
            hint: AppStrings.emailHint,
            icon: Assets.icons.signupEmail,
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
            icon: Assets.icons.signupPassword,
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
