import 'package:art_market/constance/colors.dart';
import 'package:art_market/constance/text_style.dart';
import 'package:flutter/material.dart';

class BrCheckBox extends StatefulWidget {
  final String title;
  final Widget? titleWidget;
  final bool isChecked;
  final Function(bool)? onChanged;

  const BrCheckBox({
    Key? key,
    this.isUnderlined = true,
    this.readOnly = false,
    required this.title,
    this.isChecked = false,
    this.onChanged,
  })  : titleWidget = null,
        super(key: key);

  const BrCheckBox.custom({
    Key? key,
    required Widget title,
    this.readOnly = false,
    this.isChecked = false,
    this.onChanged,
  })  : title = '',
        titleWidget = title,
        isUnderlined = false,
        super(key: key);

  final bool isUnderlined;
  final bool readOnly;

  @override
  State<BrCheckBox> createState() => _BrCheckBoxState();
}

class _BrCheckBoxState extends State<BrCheckBox> {
  bool checkBoxValue = false;

  @override
  void initState() {
    checkBoxValue = widget.isChecked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.readOnly) {
          return;
        }
        setState(() {
          checkBoxValue = !checkBoxValue;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(checkBoxValue);
        }
      },
      child: LimitedBox(
        maxWidth: 200,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                value: checkBoxValue,
                splashRadius: 0,
                activeColor: AppColors.mainColor,
                onChanged: (bool? newValue) {
                  if (widget.readOnly) {
                    return;
                  }
                  setState(() {
                    checkBoxValue = !checkBoxValue;
                  });
                  if (widget.onChanged != null) {
                    widget.onChanged!(newValue ?? false);
                  }
                },
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: widget.titleWidget ??
                  Text(
                    widget.title,
                    softWrap: false,
                    style: widget.isUnderlined
                        ? AppTextStyle.appBarTextStyle.copyWith(
                            decoration: TextDecoration.underline,
                          )
                        : AppTextStyle.appBarTextStyle,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
