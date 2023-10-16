import 'package:art_market/constance/colors.dart';
import 'package:art_market/constance/text_style.dart';
import 'package:art_market/screens/art_detail/widget/art_detail_page_widget.dart';
import 'package:art_market/screens/art_page/model/order_model.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class ArtDetail extends StatefulWidget {
  const ArtDetail({
    Key? key, 
    required this.artModelType, 
    }) : super(key: key);

  final ArtModel artModelType;

  @override
  State<ArtDetail> createState() => _ArtDetailState();
}

class _ArtDetailState extends State<ArtDetail> {
  PageController pageController = PageController(initialPage: 0);
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                    itemCount: widget.artModelType.imageUrl.length,
                    onPageChanged: (index) {
                      setState(() {
                        _count = index;
                      });
                      
                    },
                    itemBuilder: (context, index) => ArtDetailWidget(
                      imagePath: widget.artModelType.imageUrl[index]
                    ),
                  ),
                ],
              ),
            ),
          ), widget.artModelType.imageUrl.length == 1 ? 
          const SizedBox() :
          Padding(// Positioner part
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 0, vertical: 0),
            child: DotsIndicator( 
              mainAxisAlignment: MainAxisAlignment.center,
              position: _count,
              dotsCount: widget.artModelType.imageUrl.length,
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
                                image: NetworkImage(widget.artModelType.avatar),
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
                                    widget.artModelType.phone,
                                    style: AppTextStyle.blackBodyTextStyle,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              // email
                              children: [
                                const Icon(
                                  Icons.mail,
                                  color: AppColors.blackColor,
                                  size: 20.0,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    textAlign: TextAlign.start,
                                    widget.artModelType.email,
                                    style: AppTextStyle.blackBodyTextStyle,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                        // Owner Name
                        padding: const EdgeInsets.only(top: 5, bottom: 15),
                        child: Text(widget.artModelType.name)),
                    const Text("Price:"),  // price part
                    Row(
                      children: [
                        const Icon(
                          Icons.attach_money,
                          color: AppColors.blackColor,
                          size: 20.0,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            textAlign: TextAlign.start,
                            widget.artModelType.price,
                            style: AppTextStyle.blackBodyTextStyle,
                            maxLines: 1,
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
                        Row(
                          children: [
                            const Icon(
                              Icons.public,
                              color: AppColors.blackColor,
                              size: 20.0,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: Text(
                                textAlign: TextAlign.start,
                                widget.artModelType.country,                                  
                                style: AppTextStyle.blackBodyTextStyle,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: AppColors.blackColor,
                              size: 20.0,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 5, right: 10),
                              child: Text(
                                textAlign: TextAlign.start,
                                widget.artModelType.city,
                                style: AppTextStyle.blackBodyTextStyle,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    const Text("Art property:"),
                    Row(  // Art information
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            const Text("Size (cm):"),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.height,
                                  color: AppColors.blackColor,
                                  size: 20.0,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    textAlign: TextAlign.start,
                                    widget.artModelType.hight,
                                    style: AppTextStyle.blackBodyTextStyle,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset('assets/icons/width.png',
                                width: 18,
                                height: 18,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 5, right: 10),
                                  child: Text(
                                    textAlign: TextAlign.start,
                                    widget.artModelType.width,
                                    style: AppTextStyle.blackBodyTextStyle,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        ],
                        ),


                        Column(children: [
                          const Text("Pano Material:"),
                    Row(
                              children: [
                                const Icon(
                                  Icons.panorama,
                                  color: AppColors.blackColor,
                                  size: 20.0,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 5, right: 10),
                                  child: Text(
                                    textAlign: TextAlign.start,
                                    widget.artModelType.pano,
                                    style: AppTextStyle.blackBodyTextStyle,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                        ],
                          
                        ),


                        Column(children: [
                          const Text("Color Type:"),
                    Row(
                              children: [
                                const Icon(
                                  Icons.color_lens,
                                  color: AppColors.blackColor,
                                  size: 20.0,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 5, right: 10),
                                  child: Text(
                                    textAlign: TextAlign.start,
                                    widget.artModelType.color,
                                    style: AppTextStyle.blackBodyTextStyle,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                        ],),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: const Text("Art description:")
                    ),
                    Text(widget.artModelType.description),
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