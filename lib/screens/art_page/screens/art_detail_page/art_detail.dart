import 'package:art_market/constance/colors.dart';
import 'package:art_market/constance/text_style.dart';
import 'package:art_market/screens/art_page/screens/art_detail_page/widget/art_detail_page_widget.dart';
import 'package:art_market/model/art/art_model.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class ArtDetail extends StatefulWidget {
  const ArtDetail({
    Key? key, 
    required this.artModelType, 
    }) : super(key: key);

  final ArtData artModelType;

  @override
  State<ArtDetail> createState() => _ArtDetailState();
}

class _ArtDetailState extends State<ArtDetail> {
  PageController pageController = PageController(initialPage: 0);
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.whiteColor,),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.zero,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: pageController,
                    itemCount: widget.artModelType.urls.length,
                    onPageChanged: (index) {
                      setState(() {
                        _count = index;
                      });
                      
                    },
                    itemBuilder: (context, index) => ArtDetailWidget(
                      imagePath: widget.artModelType.urls[index]
                    ),
                  ),
                ],
              ),
            ),
          ), widget.artModelType.urls.length == 1 ? 
          const SizedBox() :
          Padding(// Positioner part
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 0, vertical: 0),
            child: DotsIndicator( 
              mainAxisAlignment: MainAxisAlignment.center,
              position: _count,
              dotsCount: widget.artModelType.urls.length,
              decorator: DotsDecorator(
                color: Colors.grey,
                activeColor: AppColors.mainColor,
                size: const Size.square(8.0),
                activeSize: const Size(8.0, 8.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)
                )
              )
            )
          ), 
          Expanded( // Content part
            flex: 2,
            child: ListView(
              children: [
                Container(
                  margin:const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 30),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          // Avatar
                          margin: const EdgeInsets.only(right: 10),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: AppColors.mainColor),
                            image: DecorationImage(
                                image:  widget.artModelType.author.avaUrl.isEmpty ?
                                const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSItZEIqi-mJMnPpWOBUzEGvkE3gsACe19W2Np1neYZyI0PlTv6_WNzFByxz0EkV7equPQ&usqp=CAU')
                                :
                                NetworkImage(widget.artModelType.author.avaUrl),
                                fit: BoxFit.cover),
                            color: AppColors.transparentColor,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Contacts
                            Row(
                              // Phone
                              children: [
                                const Icon(
                                  Icons.call,
                                  color: AppColors.blackColor,
                                  size: 20.0,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    widget.artModelType.author.phoneNumber,
                                    style: AppTextStyle.blackBodyTextStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            // Row(
                            //   // email
                            //   children: [
                            //     const Icon(
                            //       Icons.mail,
                            //       color: AppColors.blackColor,
                            //       size: 20.0,
                            //     ),
                            //     Container(
                            //       margin: const EdgeInsets.only(left: 5),
                            //       child: Text(
                            //         textAlign: TextAlign.start,
                            //         widget.artModelType.author.,
                            //         style: AppTextStyle.blackBodyTextStyle,
                            //         maxLines: 1,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        )
                      ],
                    ),
                    
                      Container(
                          // Owner Name
                          padding: const EdgeInsets.only(top: 5, bottom: 15),
                          child: Text(
                            widget.artModelType.author.name,
                            style: AppTextStyle.blackBodyTextStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            )
                    ),
                    const Text("Price:"),  // price part
                    Row(
                      children: [
                        const Icon(
                          Icons.attach_money,
                          color: AppColors.blackColor,
                          size: 20.0,
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              textAlign: TextAlign.start,
                              widget.artModelType.price.toString(),
                              style: AppTextStyle.blackBodyTextStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      // location part
                      padding: const EdgeInsets.only(top: 10),
                      child: const Text("Location:")
                    ), 
                    Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.public,
                              color: AppColors.blackColor,
                              size: 20.0,
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 5),
                                child: Text(
                                  textAlign: TextAlign.start,
                                  widget.artModelType.author.country,                                  
                                  style: AppTextStyle.blackBodyTextStyle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                     
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: AppColors.blackColor,
                              size: 20.0,
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 5, right: 10),
                                child: Text(
                                  textAlign: TextAlign.start,
                                  widget.artModelType.author.city,
                                  style: AppTextStyle.blackBodyTextStyle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                    const SizedBox(height: 10,),
                    const Text("Art property:"),
                    const SizedBox(height: 5,),
                    const Text("Size (cm):"),
                    Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.height,
                                  color: AppColors.blackColor,
                                  size: 20.0,
                                ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      textAlign: TextAlign.start,
                                      widget.artModelType.height.toString(),
                                      style: AppTextStyle.blackBodyTextStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset('assets/icons/width.png',
                                width: 18,
                                height: 18,
                                ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 5, right: 10),
                                    child: Text(
                                      textAlign: TextAlign.start,
                                      widget.artModelType.width.toString(),
                                      style: AppTextStyle.blackBodyTextStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            const Text("Pano Material:"),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.panorama,
                                  color: AppColors.blackColor,
                                  size: 20.0,
                                ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 5, right: 10),
                                    child: Text(
                                      textAlign: TextAlign.start,
                                      widget.artModelType.pano,
                                      style: AppTextStyle.blackBodyTextStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            const Text("Color Type:"),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.color_lens,
                                  color: AppColors.blackColor,
                                  size: 20.0,
                                ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 5, right: 10),
                                    child: Text(
                                      textAlign: TextAlign.start,
                                      widget.artModelType.color,
                                      style: AppTextStyle.blackBodyTextStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: const Text("Art description:")
                    ),

                    Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // const Icon(
                                //   Icons.description,
                                //   color: AppColors.blackColor,
                                //   size: 20.0,
                                // ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 5, right: 10),
                                    child: Text(
                                      textAlign: TextAlign.start,
                                      widget.artModelType.description,
                                      style: AppTextStyle.blackBodyTextStyle,
                                      maxLines: 10,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            
                  ],
                ),
              )
              ],
            )
          ),
          Container(
            height: 5,
            color: AppColors.transparentColor,
          )
        ],
      )
    );
  }
}

// Text("language"),
//                     Text("gps fixed"),
//                     Text("flag"),
//                     Text("explore"),
//                     Text("email"),
//                     Text("call"),
//                     Text("height straight"), 
//                     Text("language"),
//                     Text("gps fixed"),
//                     Text("flag"),
//                     Text("explore"),
//                     Text("email"),
//                     Text("call"),
//                     Text("height straight"), 