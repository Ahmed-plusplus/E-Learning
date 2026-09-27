import 'package:elearning/core/shared/widgets/custom_text_field.dart';
import 'package:elearning/core/utils/app_strings.dart';
import 'package:elearning/features/auth/presentation/view_models/cubit/signup/signup_cubit.dart';
import 'package:elearning/generated/assets.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key, required this.cubit, required this.formKey});

  final SignupCubit cubit;
  final GlobalKey formKey;

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormFieldState> fullNameKey = GlobalKey();

  final GlobalKey<FormFieldState> emailKey = GlobalKey();

  final GlobalKey<FormFieldState> passwordKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CustomTextField(
            textFieldKey: fullNameKey,
            title: AppStrings.fullName,
            controller: fullNameController,
            hint: AppStrings.fullNameHint,
            icon: Assets.icons.signupFullName,
            onChanged: (fullName) => widget.cubit.changeFullName(fullName),
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
            onChanged: (email) => widget.cubit.changeEmail(email),
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
            onChanged: (password) => widget.cubit.changePassword(password),
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
