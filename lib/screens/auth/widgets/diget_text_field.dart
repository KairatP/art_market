import 'package:art_market/constance/colors.dart';
import 'package:flutter/material.dart';

Widget digetTextField() {
  return const SizedBox(
    width: 50,
    height: 50,
    child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.mainColor),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.mainColor)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.mainColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.mainColor)),
        ),
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
  );
}
