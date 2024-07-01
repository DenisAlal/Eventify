import 'package:flutter/material.dart';

import '../../presentation.dart';

enum ActionButtonStyle { accent, secondary, transparent, like }

class ActionButton extends StatelessWidget {
  final ActionButtonStyle style;
  final Widget? item;
  final Widget? disabledItem;
  final Function()? onTap;
  final bool enabled;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? borderWidth;
  final Color? borderColor;

  const ActionButton(
      {super.key,
      required this.style,
      required this.item,
      this.disabledItem,
      this.onTap,
      this.enabled = true,
      this.width,
      this.height,
      this.borderRadius,
      this.borderWidth,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 20),
            border: Border.all(
              width: borderWidth ?? 2,
              color: borderColor ?? AppColors.darkOrchid,
            ),
            color: buttonColorByStyle(),
          ),
          child: Material(
            borderRadius: BorderRadius.circular(borderRadius ?? 20),
            color: Colors.transparent,
            child: InkWell(
                borderRadius: BorderRadius.circular(borderRadius ?? 20), onTap: enabled ? onTap : null, child: item),
          )),
      if (!enabled)
        Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.emptyField,
              border: Border.all(
                width: 2,
                color: AppColors.emptyField,
              ),
            ),
            child: disabledItem),
    ]);
  }

  Color buttonColorByStyle() {
    switch (style) {
      case ActionButtonStyle.accent:
        return AppColors.darkOrchid;
      case ActionButtonStyle.secondary:
        return AppColors.blackBrown;
      case ActionButtonStyle.like:
        return AppColors.translucentDarkOrchid;
      case ActionButtonStyle.transparent:
        return Colors.transparent;
    }
  }
}
