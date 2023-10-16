import 'package:art_market/constance/colors.dart';
import 'package:art_market/constance/text_style.dart';
import 'package:art_market/router/router_structure.dart';
import 'package:art_market/screens/art_page/model/order_model.dart';
import 'package:flutter/material.dart';

class ArtCell extends StatelessWidget {
  const ArtCell({
    Key? key,
    required this.artModelType,
    required this.index,
  }) : super(key: key);

  final ArtModel artModelType;
  final int index;

  @override
  Widget build(BuildContext context) {
    // bool isChanged = false;
    return 
    InkWell(
      splashColor: AppColors.transparentColor,
      onTap: () {
        Navigator.pushNamed(
          context,
          RouterStructure.artDetail,
          arguments: artModelType
        );
      },
      child: 
      Column(
        children: [
          Container(
            height: 200,
            margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.mainColor),
              borderRadius: BorderRadius.circular(3),
              image: DecorationImage(
                image: NetworkImage(artModelType.imageUrl.first),
                fit: BoxFit.cover
              ),
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
                          Icons.public,
                          color: AppColors.blackColor,
                          size: 20.0,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 2, right: 10),
                          child: Text(
                            textAlign: TextAlign.start, 
                            artModelType.country,
                            style: AppTextStyle.blackBodyTextStyle,
                            maxLines: 1,
                          ),
                        ),
                        const Icon(
                          Icons.location_on,
                          color: AppColors.blackColor,
                          size: 20.0,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 2, right: 10),
                          child: Text(
                            textAlign: TextAlign.start, 
                            artModelType.city,
                            style: AppTextStyle.blackBodyTextStyle,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
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
                            artModelType.price,
                            style: AppTextStyle.blackBodyTextStyle,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: AppColors.mainColor),
                    image: DecorationImage(
                      image: NetworkImage(artModelType.avatar),
                      fit: BoxFit.cover
                    ),
                    color: AppColors.transparentColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
