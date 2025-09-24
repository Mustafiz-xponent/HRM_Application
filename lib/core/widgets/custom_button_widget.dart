import 'package:flutter/material.dart';
import 'package:hrm_application/core/theme/app_colors.dart';
import 'package:hrm_application/core/theme/app_styles.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CustomButtonWidget extends StatelessWidget {
  final String buttonTitle;
  final Color buttonBackground;
  final VoidCallback onTap;
  Widget? leadingIcon;

  CustomButtonWidget({
    super.key,
    required this.buttonTitle,
    required this.buttonBackground,
    required this.onTap,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ShadButton(
      backgroundColor: buttonBackground,
      leading: leadingIcon,
      width: double.infinity,
      child: Text(buttonTitle, style: AppStyles.mediumWhiteBoldTitleFontStyle),
      onPressed: onTap,
    );
  }
}
