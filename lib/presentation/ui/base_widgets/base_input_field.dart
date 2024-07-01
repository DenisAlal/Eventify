import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../presentation.dart';

const double _defaultHeight = 62;

class BasicInputField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? errorText;
  final TextStyle? style;

  final TextInputType? keyboardType;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? height;
  final double? width;
  final bool disabled;
  final bool disabledToEditing;
  final TextCapitalization textCapitalization;
  final TextAlign? textAlign;
  final TextInputAction textInputAction;
  final List<TextInputFormatter> inputFormatters;
  final Function(String data)? onChange;
  final bool obscureText;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final Color? cursorColor;

  const BasicInputField({super.key, 
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.style,
    this.hintStyle,
    this.suffix,
    this.errorText,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.width,
    this.height = _defaultHeight,
    this.inputFormatters = const [],
    this.disabled = false,
    this.disabledToEditing = false,
    this.onChange,
    this.textInputAction = TextInputAction.done,
    this.textCapitalization = TextCapitalization.sentences,
    this.textAlign,
    this.obscureText = false,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.contentPadding,
    this.cursorColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width,
          height: height ?? _defaultHeight,
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.transparent,
            border: Border.all(color: borderColor ?? (errorText != null ? AppColors.red : AppColors.darkOrchid), width: 2),
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
          ),
          child: Stack(children: [
            TextFormField(
              cursorWidth: 1.0,
              maxLength: 70,
              enabled: !disabled,
              controller: controller,
              obscureText: obscureText,
              textCapitalization: textCapitalization,
              textAlign: textAlign ?? TextAlign.start,
              keyboardType: keyboardType ?? TextInputType.text,
              inputFormatters: inputFormatters,
              style: style ?? AppTextStyles.appIconLabel(),
              onChanged: (text) => {
                if (onChange != null) {onChange!(text)}
              },
              textInputAction: textInputAction,
              decoration: decorationForOptions(),
              cursorColor: cursorColor ?? AppColors.white,
            ),
            if (disabledToEditing)
              Container(
                width: width,
                height: _defaultHeight,
                color: AppColors.disable,
              )
          ]),
        ),
        if (errorText != null && errorText!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  errorText!,
                  style: AppTextStyles.homePageSubtitle(color: AppColors.red),
                )
              ],
            ),
          )
      ],
    );
  }

  InputDecoration decorationForOptions() {
    if (suffix != null || suffixIcon != null || prefixIcon != null) {
      if (suffix != null) {
        return _suffixDecoration();
      }
      if (prefixIcon != null) {
        return suffixIcon != null ? _prefixAndSuffixIconDecoration() : _prefixIconDecoration();
      } else {
        return _suffixIconDecoration();
      }
    } else {
      return _noSuffixDecoration();
    }
  }

  InputDecoration _suffixDecoration() => InputDecoration(
        counterText: '',
        suffix: Container(
          padding: const EdgeInsets.only(left: 24),
          child: suffix,
        ),
        contentPadding: contentPadding ?? const EdgeInsets.only(top: 10, bottom: 8, left: 20, right: 20),
        border: InputBorder.none,
        suffixIconConstraints: const BoxConstraints(minWidth: 50, maxWidth: 64),
        labelText: labelText,
        labelStyle: AppTextStyles.appIconLabel(color: AppColors.notAccent),
        hintText: hintText,
        hintStyle: hintStyle ?? AppTextStyles.appIconLabel(color: disabled ? AppColors.white : AppColors.notAccent),
      );

  InputDecoration _suffixIconDecoration() => InputDecoration(
        counterText: '',
        suffixIcon: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: suffixIcon,
        ),
        contentPadding: contentPadding ??
            EdgeInsets.only(
                top: ((height ?? _defaultHeight) - 21) * 0.5,
                bottom: ((height ?? _defaultHeight) - 24) * 0.5,
                left: 20,
                right: 20),
        border: InputBorder.none,
        suffixIconConstraints: const BoxConstraints(minWidth: 50, maxWidth: 64),
        labelText: labelText,
        labelStyle: AppTextStyles.appIconLabel(color: AppColors.notAccent),
        hintText: hintText,
        hintStyle: hintStyle ?? AppTextStyles.appIconLabel(color: disabled ? AppColors.white : AppColors.notAccent),
      );

  InputDecoration _prefixIconDecoration() => InputDecoration(
        counterText: '',
        prefixIcon: Container(
          alignment: Alignment.center,
          child: prefixIcon,
        ),
        contentPadding: contentPadding ??
            EdgeInsets.only(
                top: ((height ?? _defaultHeight) - 21) * 0.5,
                bottom: ((height ?? _defaultHeight) - 24) * 0.5,
                left: 20,
                right: 20),
        border: InputBorder.none,
        prefixIconConstraints: const BoxConstraints(minWidth: 50, maxWidth: 60),
        labelText: labelText,
        labelStyle: AppTextStyles.appIconLabel(color: AppColors.notAccent),
        hintText: hintText,
        hintStyle: hintStyle ?? AppTextStyles.appIconLabel(color: disabled ? AppColors.white : AppColors.notAccent),
      );

  InputDecoration _prefixAndSuffixIconDecoration() => InputDecoration(
        counterText: '',
        suffixIcon: Container(
          alignment: Alignment.center,
          child: suffixIcon,
        ),
        prefixIcon: Container(
          alignment: Alignment.center,
          child: prefixIcon,
        ),
        contentPadding: contentPadding ??
            EdgeInsets.only(
                top: ((height ?? _defaultHeight) - 21) * 0.5,
                bottom: ((height ?? _defaultHeight) - 24) * 0.5,
                left: 20,
                right: 20),
        border: InputBorder.none,
        prefixIconConstraints: const BoxConstraints(minWidth: 16, maxWidth: 60),
        suffixIconConstraints: const BoxConstraints(minWidth: 16, maxWidth: 64),
        labelText: labelText,
        labelStyle: AppTextStyles.appIconLabel(color: AppColors.notAccent),
        hintText: hintText,
        hintStyle: hintStyle ?? AppTextStyles.appIconLabel(color: disabled ? AppColors.white : AppColors.notAccent),
      );

  InputDecoration _noSuffixDecoration() => InputDecoration(
        counterText: '',
        contentPadding: contentPadding ?? const EdgeInsets.only(top: 14, bottom: 6, left: 20, right: 20),
        border: InputBorder.none,
        labelText: labelText,
        labelStyle: AppTextStyles.appIconLabel(color: AppColors.notAccent),
        hintText: hintText,
        hintStyle: hintStyle ?? AppTextStyles.appIconLabel(color: disabled ? AppColors.white : AppColors.notAccent),
      );
}
