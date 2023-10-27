import 'package:art_market/constance/colors.dart';
import 'package:art_market/constance/text_style.dart';
import 'package:art_market/screens/profile_page/bloc/profile_bloc.dart';
import 'package:art_market/screens/profile_page/model/profile_model.dart';
import 'package:flutter/material.dart';

AppBar profileAppBar(
    BuildContext context, ProfileBloc bloc, ProfileUser profileData) {
  return AppBar(
    centerTitle: true,
    backgroundColor: AppColors.whiteColor,
    title: GestureDetector(
      onTap: () {
        bloc.add(EditProfileButtonNavigateEvent());
      },
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.transparentColor,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: AppColors.mainColor),
              image: DecorationImage(                  
                image: NetworkImage(profileData.avatar), 
                fit: BoxFit.cover
              ),  
            ),
          ),
          Text(
            profileData.name,
            style: AppTextStyle.appBarTextStyle,
          ),
        ],
      ),
    ),
    // leading: GestureDetector(
    //   onTap: () {
    //   },
    //   child: const Icon(
    //     Icons.edit,  // add custom icons also
    //   ),
    // ),
    actions: [
      IconButton(
          onPressed: () {
            bloc.add(AddPostButtonNavigateEvent());
          },
          icon: const Icon(Icons.add,
          color: AppColors.mainColor,)),
      // IconButton(
      //   onPressed: () {
      //       // Navigator.pushNamed(context, RouterStructure.artFilter);
      //   },
      //   icon: const Icon(Icons.edit)
      // ),
    ],
  );
}
