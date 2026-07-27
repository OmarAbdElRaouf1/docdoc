import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({super.key, required this.buttonText, required this.textStyle, required this.onPressed});
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.mainBlue),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: WidgetStateProperty.all(const Size(double.infinity, 52)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
      child: Text(buttonText, style: textStyle),
    );
  }
}
