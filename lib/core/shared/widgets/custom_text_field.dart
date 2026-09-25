import 'package:elearning/core/utils/app_colors.dart';
import 'package:elearning/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.title,
    required this.controller,
    this.textFieldKey,
    this.hint,
    this.icon,
    this.isPassword = false,
    this.inputType,
    this.onChanged,
    this.validator,
  });

  final String title;
  final TextEditingController controller;
  GlobalKey<FormFieldState>? textFieldKey;
  String? hint;
  SvgGenImage? icon;
  bool isPassword;
  TextInputType? inputType;
  Function(String)? onChanged;
  FormFieldValidator<String>? validator;
  late final ValueNotifier _hidePassword = ValueNotifier(isPassword);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Align(
          alignment: AlignmentGeometry.centerStart,
          child: Text(title, style: theme.textTheme.labelLarge,),
        ),
        const SizedBox(height: 6,),
        ValueListenableBuilder(
          valueListenable: _hidePassword,
          builder: (context, value, child) {
            return TextFormField(
              key: textFieldKey,
              controller: controller,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.title,
                fontWeight: FontWeight.w400
              ),
              obscureText: value,
              keyboardType: inputType,
              decoration: InputDecoration(
                hint: Text(hint ?? ''),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: icon?.svg(),
                ),
                suffixIcon: isPassword
                    ? Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () => _hidePassword.value = !value,
                        child: value
                          ? Assets.icons.loginEyeIcon.svg()
                          : Icon(Icons.visibility_off_rounded, color: AppColors.eye,),
                      ),
                    )
                    : null,
              ),
              onChanged: onChanged,
              validator: validator,
            );
          }
        ),
      ],
    );
  }
}
