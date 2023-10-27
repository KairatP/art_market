import 'package:art_market/constance/colors.dart';
import 'package:flutter/material.dart';

Widget digetTextField({required validator}) {
  return SizedBox(
    width: 50,
    height: 50,
    child: TextFormField(
      validator: validator,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
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
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal)
    ),
  );
}
