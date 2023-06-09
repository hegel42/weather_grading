import 'package:fitness_app/app/ui_kit/models/app_fonts.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    this.icon,
    required this.onPressed,
    required this.label,
    this.textStyle,
    this.color,
    this.distanceIconText,
  });

  final Widget? icon;
  final VoidCallback onPressed;
  final String label;
  final TextStyle? textStyle;
  final Color? color;
  final double? distanceIconText;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        textStyle: textStyle ?? AppFonts().mainText,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Padding(
              padding: EdgeInsets.only(right: distanceIconText ?? 8),
              child: icon,
            ),
          FittedBox(
            child: Text(label),
          ),
        ],
      ),
    );
  }
}
