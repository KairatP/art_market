import 'package:art_market/constance/colors.dart';
import 'package:art_market/constance/text_style.dart';
import 'package:art_market/model/user/user_profile_model.dart';
import 'package:art_market/router/router_structure.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar profileAppBar(BuildContext context, UserProfileModel profileData,
    Function updateProfile, Function addPost) {
      // Function(String) updatePost,
  return AppBar(
    centerTitle: true,
    backgroundColor: AppColors.whiteColor,
    title: GestureDetector(
      onTap: () {
        Navigator.pushNamed(
            context, RouterStructure.profileEditPage,
            arguments: profileData).then((value) => (
              updateProfile()
            ));
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
                fit: BoxFit.cover,
                image: profileData.data.avaUrl.isEmpty
                    ? const NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSItZEIqi-mJMnPpWOBUzEGvkE3gsACe19W2Np1neYZyI0PlTv6_WNzFByxz0EkV7equPQ&usqp=CAU')
                    : NetworkImage(profileData.data.avaUrl),
              ),
            ),
          ),
          Expanded(
            child: Text(
              profileData.data.name,
              style: AppTextStyle.appBarTextStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ),
    actions: [
      IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
            if (profileData.data.city.isEmpty ||
                profileData.data.country.isEmpty ||
                profileData.data.name.isEmpty ||
                profileData.data.phoneNumber.isEmpty ||
                profileData.data.avaUrl.isEmpty) {
                  
              Navigator.pushNamed(context, RouterStructure.profileEditPage,
                  arguments: profileData);
              showDialog(
                context: context,
                builder: (BuildContext context) => CupertinoAlertDialog(
                  title: const Text('Attention'),
                  content: const Text(
                      'Please before create a post need to apply profile information'),
                  actions: [
                    CupertinoDialogAction(
                      isDefaultAction: true,
                      onPressed: () => {Navigator.pop(context)},
                      child: const Text('Ok'),
                    )
                  ],
                ),
              );
            } else {
               Navigator.pushNamed( context,
                RouterStructure.addPostPage,
              ).then((value) => (
              addPost()
            ));
            }
          },
          icon: const Icon(
            Icons.add,
            color: AppColors.mainColor,
          )),
    ],
  );
}
