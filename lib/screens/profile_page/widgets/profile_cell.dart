import 'package:art_market/constance/colors.dart';
import 'package:art_market/constance/text_style.dart';
import 'package:art_market/model/art/my_art_model.dart';
import 'package:art_market/router/router_structure.dart';
import 'package:flutter/material.dart';

class ProfileCell extends StatelessWidget {
  const ProfileCell({
    Key? key,
    required this.profileModelType,
    required this.index,
    required this.updatePost,
  }) : super(key: key);

  final MyArtData profileModelType;
  final int index;
  final Function updatePost;

  @override
  Widget build(BuildContext context) {
    // bool isChanged = false;
    return InkWell(
      splashColor: AppColors.transparentColor,
      onTap: () {        
        Navigator.pushNamed(
            context, RouterStructure.editPostPage,
            arguments: profileModelType).then((value) => (
              updatePost()
            ));
      },
      child: Column(
        children: [
          Container(
            height: 200,
            margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.mainColor),
              borderRadius: BorderRadius.circular(3),
              image: DecorationImage(
                  image: NetworkImage(profileModelType.urls.first),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.attach_money,
                          color: AppColors.blackColor,
                          size: 20.0,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 2, right: 10),
                          child: Text(
                            textAlign: TextAlign.start,
                            profileModelType.price.toString(),
                            style: AppTextStyle.blackBodyTextStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
