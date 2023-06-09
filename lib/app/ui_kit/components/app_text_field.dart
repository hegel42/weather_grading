import 'package:fitness_app/app/ui_kit/models/app_fonts.dart';
import 'package:fitness_app/app/ui_kit/models/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _kDefaultBorderRadius = 24.0;

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.hintText,
    this.keyboardType,
    this.controller,
    this.labelText,
    this.prefixIcon,
    this.focusNode,
    this.onTap,
    this.readOnly = false,
    this.borderColor,
    this.borderRadius,
    this.inputFormatters,
    this.suffixIcon,
    this.maxLines = 1,
    this.obscureText,
    this.focusBorderColor,
  });

  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Color? focusBorderColor;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final bool readOnly;
  final Color? borderColor;
  final double? borderRadius;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;

  final int? maxLines;
  final bool? obscureText;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final FocusNode _focusNode = FocusNode();

  bool textEditHasFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        textEditHasFocus = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(
          widget.borderRadius ?? _kDefaultBorderRadius,
        ),
      ),
    );

    return TextFormField(
      style: AppFonts().mainText,
      cursorColor: ColorPallete.darkGrey,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines,
      obscureText: widget.obscureText ?? false,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        floatingLabelStyle: TextStyle(
          color: ColorPallete.primary,
        ),
        labelText: widget.labelText,
        filled: true,
        fillColor: ColorPallete.white.withOpacity(0.2),
        enabledBorder: outlineInputBorder.copyWith(
          borderSide:
              BorderSide(color: widget.borderColor ?? ColorPallete.darkGrey),
        ),
        focusedBorder: outlineInputBorder.copyWith(
          borderSide: BorderSide(
            color: widget.focusBorderColor ?? ColorPallete.accent,
          ),
        ),
        border: outlineInputBorder,
      ),
      onTap: widget.onTap,
      readOnly: widget.readOnly,
      inputFormatters: widget.inputFormatters,
    );
  }
}
