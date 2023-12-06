import 'package:art_market/constance/colors.dart';
import 'package:art_market/constance/text_style.dart';
import 'package:art_market/router/router_structure.dart';
import 'package:art_market/model/art/art_model.dart';
import 'package:flutter/material.dart';

class ArtCell extends StatelessWidget {
  const ArtCell({
    Key? key,
    required this.artModelType,
    required this.index,
  }) : super(key: key);

  final ArtData artModelType;
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
              image:  artModelType.urls.isNotEmpty ?
               DecorationImage(
                image: NetworkImage(artModelType.urls.first),
                fit: BoxFit.cover
              )
              :
              null,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
            child: Row(
              children: [
                Expanded(
                  child: Column(
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
                              artModelType.author.country,
                              style: AppTextStyle.blackBodyTextStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Icon(
                            Icons.location_on,
                            color: AppColors.blackColor,
                            size: 20.0,
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 2, right: 10),
                              child: Text(
                                textAlign: TextAlign.start, 
                                artModelType.author.city,
                                style: AppTextStyle.blackBodyTextStyle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
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
                              artModelType.price.toString(),
                              style: AppTextStyle.blackBodyTextStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: AppColors.mainColor),
                    image: DecorationImage(
                      image: artModelType.author.avaUrl.isEmpty ?
                      const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSItZEIqi-mJMnPpWOBUzEGvkE3gsACe19W2Np1neYZyI0PlTv6_WNzFByxz0EkV7equPQ&usqp=CAU')
                      :
                      NetworkImage(artModelType.author.avaUrl),
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
