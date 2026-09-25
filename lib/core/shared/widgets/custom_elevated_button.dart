import 'package:elearning/core/utils/app_colors.dart';
import 'package:elearning/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true
  });

  final String text;
  final VoidCallback onPressed;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).textButtonTheme.style?.copyWith(
          textStyle: WidgetStatePropertyAll(TextStyle(fontFamily: AppFonts.nimbusSans))
      ),
      child: isEnabled
          ? Text(text)
          : CircularProgressIndicator(
        color: AppColors.white,
        constraints: BoxConstraints(maxHeight: 30, maxWidth: 30, minWidth: 20, minHeight: 20),
      ),
    );
  }
}
