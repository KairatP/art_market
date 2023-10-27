import 'package:art_market/constance/colors.dart';
import 'package:art_market/constance/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class GlButton extends StatelessWidget {
  const GlButton({
    Key? key,
    this.label = 'Press',
    this.labelWidget,
    required this.onPressed,
    this.textColor = AppColors.whiteColor,
    this.textStyle,
    this.padding,
    this.borderRadius = 10,
    this.color = AppColors.mainColor,
    this.borderColor,
    this.icon = '',
    this.suffixIcon,
    this.preffixIcon,
  })  : isFilled = true,
        size = 0,
        iconColor = null,
        iconSize = 0,
        super(key: key);

  const GlButton.text({
    Key? key,
    this.label = 'Press',
    this.labelWidget,
    required this.onPressed,
    this.textColor = AppColors.blackColor,
    this.textStyle,
    this.borderColor,
    this.suffixIcon,
    this.preffixIcon,
  })  : color = Colors.transparent,
        isFilled = false,
        padding = EdgeInsets.zero,
        iconColor = null,
        borderRadius = 0,
        icon = '',
        size = 0,
        iconSize = 0,
        super(key: key);

  const GlButton.icon({
    Key? key,
    this.label = 'Press',
    this.labelWidget,
    required this.onPressed,
    this.textColor = AppColors.blackColor,
    this.textStyle,
    this.padding = EdgeInsets.zero,
    this.borderRadius = 15,
    this.color = AppColors.whiteColor,
    this.borderColor,
    this.iconColor,
    required this.icon,
    this.size = 40,
    this.iconSize = 14,
    this.suffixIcon,
    this.preffixIcon,
  })  : isFilled = true,
        super(key: key);

  final String icon;
  final Widget? suffixIcon;
  final Widget? preffixIcon;
  final Color? iconColor;
  final String label;
  final Widget? labelWidget;
  final Color color;
  final Color textColor;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final double borderRadius;
  final Color? borderColor;
  final VoidCallback? onPressed;
  final bool isFilled;
  final double size;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    if (icon.isNotEmpty) {
      return IconButton(
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        disabledColor: Colors.transparent,
        iconSize: size,
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        color: color,
        icon: Container(
          padding: padding,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor ?? Colors.transparent),
            borderRadius: BorderRadius.circular(borderRadius),
            color: color,
          ),
          child: SvgPicture.asset(
            icon,
            width: iconSize,
            height: iconSize,
          ),
        ),
      );
    }
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size.zero),
        padding: MaterialStateProperty.all(
          padding ??
              const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 15,
              ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: borderColor ?? Colors.transparent),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          onPressed != null ? color : AppColors.greyColor,
        ),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: labelWidget ??
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              suffixIcon ?? const Offstage(),
              const SizedBox(
                width: 12,
              ),
              preffixIcon != null ? const Spacer() : const Offstage(),
              Text(
                label,
                maxLines: 1,
                style: onPressed != null
                    ? (textStyle ??
                        AppTextStyle.blackBodyTextStyle.copyWith(
                          color: textColor,
                          fontSize: 16,
                        ))
                    : AppTextStyle.greyBodyTextStyle.copyWith(
                        color: AppColors.greyColor,
                        fontSize: 16,
                      ),
                textAlign: isFilled ? TextAlign.center : TextAlign.start,
              ),
              preffixIcon != null ? const Spacer() : const Offstage(),
              preffixIcon ?? const Offstage(),
              const SizedBox(
                width: 12,
              )
            ],
          ),
    );
  }
}
