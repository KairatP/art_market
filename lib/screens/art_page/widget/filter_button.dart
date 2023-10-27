import 'package:art_market/constance/colors.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    Key? key,
    required this.content,
    this.contentPadding = const EdgeInsets.all(20),
    // this.defaultWidget,
  }) : super(key: key);

  final Widget content;
  // final Widget? defaultWidget;
  final EdgeInsets contentPadding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          isDismissible: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => Container(
            padding: contentPadding,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.mainColor.withOpacity(.1),
                  blurRadius: 50,
                  spreadRadius: 0,
                  offset: const Offset(-30, 30),
                ),
              ],
            ),
            child: content,
          ),
        );
      },
      // child: widget.defaultWidget
    );
  }
}
