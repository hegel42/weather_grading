import 'package:fitness_app/app/ui_kit/models/app_fonts.dart';
import 'package:fitness_app/app/ui_kit/models/color_palette.dart';
import 'package:flutter/material.dart';

const _kDefaultSecondaryBorderRadius = 16.0;

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.icon,
    required this.onPressed,
    required this.buttonStyle,
    this.gradient,
    // this.borderRadius,
  });

  final String label;
  final Widget? icon;
  final VoidCallback onPressed;
  final ButtonStyle buttonStyle;
  final LinearGradient? gradient;
  // final double? borderRadius;

  factory AppButton.primary({
    required String label,
    required VoidCallback onPressed,
    Color? backgroundColor,
    Color? foregroundColor,
    double? borderRadius,
  }) {
    return AppButton(
      label: label,
      onPressed: onPressed,
      buttonStyle: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? ColorPallete.primary,
        foregroundColor: foregroundColor ?? ColorPallete.white,
        textStyle: AppFonts().mainText,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
        ),
      ).copyWith(
          // shadowColor: MaterialStateProperty.all<Color>(
          //   theme.themeMode.colors.primary.withOpacity(_kDefaultOpacity),
          // ),
          // overlayColor: MaterialStateProperty.all<Color>(
          //   theme.themeMode.colors.primary.withOpacity(_kDefaultOpacity),
          // ),
          ),
    );
  }

  factory AppButton.secondary({
    required String label,
    required VoidCallback onPressed,
    Widget? icon,
    Color? backgroundColor,
    Color? foregroundColor,
    double? borderRadius,
    EdgeInsetsGeometry? padding,
  }) {
    return AppButton(
      icon: icon,
      label: label,
      onPressed: onPressed,
      buttonStyle: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? ColorPallete.primary,
        foregroundColor: foregroundColor ?? ColorPallete.white,
        textStyle: AppFonts().secText,
        elevation: 0,
        padding: padding ??
            const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 10,
            ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
        ),
      ).copyWith(

          // shadowColor: overlayColor ??
          //     MaterialStateProperty.all<Color>(
          //       theme.themeMode.colors.primary.withOpacity(_kDefaultOpacity),
          //     ),
          // overlayColor: overlayColor ??
          //     MaterialStateProperty.all<Color>(
          //       theme.themeMode.colors.primary.withOpacity(_kDefaultOpacity),
          //     ),
          ),
    );
  }

  factory AppButton.outlined({
    required String label,
    required VoidCallback onPressed,
    Widget? icon,
    double? borderRadius,
    EdgeInsets? padding,
    Color? bordColor,
    Color? foregroundColor,
    MaterialStateProperty<Color>? overlayColor,
  }) {
    return AppButton(
      icon: icon,
      label: label,
      onPressed: onPressed,
      buttonStyle: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: foregroundColor ?? ColorPallete.primary,
        side: BorderSide(
          color: bordColor ??= ColorPallete.primary,
        ),
        textStyle: AppFonts().mainText,
        elevation: 0,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius ?? _kDefaultSecondaryBorderRadius),
          ),
        ),
      ).copyWith(
        overlayColor: overlayColor ??
            MaterialStateProperty.all<Color>(
              bordColor.withOpacity(0.08),
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Padding(padding: const EdgeInsets.only(right: 8), child: icon),
          Flexible(
            child: FittedBox(
              child: Text(label),
            ),
          ),
        ],
      ),
    );
  }
}
