import 'package:art_market/constance/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchFieald extends StatefulWidget {
  const SearchFieald({
    Key? key,
    required this.lableText,
    this.prefixIcon,
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

  final String lableText;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final Function(String)? onChanged;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String? text)? validator;
  final Color? borderColor;
  final Color? enableBorderColor;
  final TextStyle? labelStyle;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;

  @override
  State<SearchFieald> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<SearchFieald> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.fillCollor,
        borderRadius: BorderRadius.circular(7),
      ),
      child: TextFormField(
        cursorColor: AppColors.blackColor,
        keyboardType: widget.textInputType,
        inputFormatters: widget.inputFormatters,
        scrollPadding: EdgeInsets.zero,
        validator: widget.validator,
        controller: widget.controller,
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
              gapPadding: 0,
              borderSide: const BorderSide(
                color: AppColors.transparentColor,
              ),
              borderRadius: BorderRadius.circular(10)),
          prefixIconColor: AppColors.greyColor,
          focusedBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide:
                const BorderSide(color:AppColors.transparentColor),
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: widget.lableText,
          labelStyle: const TextStyle(color: AppColors.greyColor),
          prefixIcon: widget.prefixIcon,
        ),
      ),
    );
  }
}

// class SearchFieald extends StatelessWidget {
//   const SearchFieald({
//     Key? key, 
//     required this.tiile,
//     this.enableBorderColor,
//   }) : super(key: key);

//   final String tiile;
//   final Color? enableBorderColor;

//   @override
//   Widget build(BuildContext context) {
//     return const Padding(
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       child: TextField(
//         textAlign: TextAlign.left,
//         maxLines: 1,
//         style: TextStyles.search,
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.zero,
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             gapPadding: 2,
//             borderSide: BorderSide(
//               color: AppColors.grey1,
//             ),
//             // borderRadius: BorderRadius.circular(10),
//           ),
//             prefixIconColor: AppColors.black,
//             suffixIconColor: AppColors.black,
//             focusedBorder: OutlineInputBorder(
//               gapPadding: 2,
//               borderSide: BorderSide(color: AppColors.black),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             focusColor: AppColors.black,
//             iconColor: AppColors.black,
//             hoverColor: AppColors.black,
//             labelText: widget.lableText,
//             labelStyle:
//                 widget.labelStyle ?? const TextStyle(color: AppColors.grey),
//             prefixIcon: widget.prefixIcon ?? const SizedBox(),
//             suffixIcon: widget.suffixIcon,
//             border: OutlineInputBorder(
//               gapPadding: 2,
//               borderSide: const BorderSide(
//                 color: AppColors.black,
//               ),
//               borderRadius: BorderRadius.circular(
//                 10,
//               ),
//             ),
//             fillColor: Colors.black,
//             hintText: widget.placeholder,
//           ),
//       )
//     );
//   }
// }