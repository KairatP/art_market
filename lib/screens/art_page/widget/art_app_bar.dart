import 'package:art_market/constance/colors.dart';
import 'package:art_market/constance/text_style.dart';
import 'package:art_market/screens/art_page/bloc/art_bloc.dart';
import 'package:flutter/material.dart';

AppBar artAppBar(BuildContext context, ArtBloc bloc) {
  return AppBar(
    centerTitle: false,
    backgroundColor: AppColors.whiteColor,
    title: const Text(
      "Art Gallery",
      style: AppTextStyle.appBarTextStyle,
    ),
    actions: [
      IconButton(
          onPressed: () {
            bloc.add(FilterButtonNavigateEvent());
            // Navigator.pushNamed(context, RouterStructure.artFilter);
          },
          icon: const Icon(Icons.filter_list_alt,
          color: AppColors.mainColor,
          ))
    ],
  );
}
