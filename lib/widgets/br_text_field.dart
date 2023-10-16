import 'package:art_market/constance/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BrTextField extends StatefulWidget {
  const BrTextField({
    Key? key,
    required this.placeholder,
    required this.lableText,
    this.prefixIcon,
    this.suffixIcon,
    this.iconPressed,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.onChanged,
    this.borderColor,
    this.enableBorderColor,
    this.labelStyle,
    this.inputFormatters,
    this.textInputType,
    this.backgroundColor,
  }) : super(key: key);

  final String placeholder;
  final Color? backgroundColor;
  final String lableText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final Function()? iconPressed;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String? text)? validator;
  final Color? borderColor;
  final Color? enableBorderColor;
  final TextStyle? labelStyle;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;

  @override
  State<BrTextField> createState() => _BrTextFieldState();
}

class _BrTextFieldState extends State<BrTextField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          cursorColor: AppColors.blueColor,
          keyboardType: widget.textInputType,
          inputFormatters: widget.inputFormatters,
          scrollPadding: EdgeInsets.zero,
          validator: widget.validator,
          controller: widget.controller,
          obscureText: widget.obscureText,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 15),
            enabledBorder: OutlineInputBorder(
                gapPadding: 2,
                borderSide: BorderSide(
                  color: widget.enableBorderColor ?? AppColors.greyColor,
                ),
                borderRadius: BorderRadius.circular(10)),
            prefixIconColor: AppColors.blackColor,
            suffixIconColor: AppColors.blackColor,
            focusedBorder: OutlineInputBorder(
              gapPadding: 2,
              borderSide:
                  BorderSide(color: widget.borderColor ?? AppColors.blackColor),
              borderRadius: BorderRadius.circular(10),
            ),
            focusColor: AppColors.blackColor,
            iconColor: AppColors.blackColor,
            hoverColor: AppColors.blackColor,
            labelText: widget.lableText,
            labelStyle:
                widget.labelStyle ?? const TextStyle(color: AppColors.greyColor),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            border: OutlineInputBorder(
              gapPadding: 2,
              borderSide: const BorderSide(
                color: AppColors.blackColor,
              ),
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            fillColor: Colors.black,
            hintText: widget.placeholder,
          ),
        ),
      ),
    );
  }
}
