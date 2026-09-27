import 'package:elearning/core/shared/widgets/custom_text_field.dart';
import 'package:elearning/core/utils/app_strings.dart';
import 'package:elearning/features/auth/presentation/view_models/cubit/login/login_cubit.dart';
import 'package:elearning/generated/assets.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.cubit, required this.formKey});

  final LoginCubit cubit;
  final GlobalKey formKey;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormFieldState> emailKey = GlobalKey();

  final GlobalKey<FormFieldState> passwordKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CustomTextField(
            textFieldKey: emailKey,
            title: AppStrings.email,
            controller: emailController,
            hint: AppStrings.emailHint,
            icon: Assets.icons.loginEmailIcon,
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
            icon: Assets.icons.loginPasswordIcon,
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
