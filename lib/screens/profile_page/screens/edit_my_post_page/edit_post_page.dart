import 'package:art_market/constance/colors.dart';
import 'package:art_market/constance/text_style.dart';
import 'package:art_market/screens/art_page/screens/art_detail_page/widget/art_detail_page_widget.dart';
import 'package:art_market/screens/profile_page/model/profile_model.dart';
import 'package:art_market/screens/profile_page/model/profile_post_model.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class EditPostPage extends StatefulWidget {
  const EditPostPage(
      {required this.postModelType, required this.userModelType, Key? key})
      : super(key: key);

  final ProfilePostModel postModelType;
  final ProfileUser userModelType;

  @override
  State<EditPostPage> createState() => _EditPostPageState();
}

class _EditPostPageState extends State<EditPostPage> {
  PageController pageController = PageController(initialPage: 0);
  int _count = 0;
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    descriptionController.text = widget.postModelType.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
        ),
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
                      itemCount: widget.postModelType.imageUrl.length,
                      onPageChanged: (index) {
                        setState(() {
                          _count = index;
                        });
                      },
                      itemBuilder: (context, index) => ArtDetailWidget(
                          imagePath: widget.postModelType.imageUrl[index]),
                    ),
                  ],
                ),
              ),
            ),
            widget.postModelType.imageUrl.length == 1
                ? const SizedBox()
                : Padding(
                    // Positioner part
                    padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 0, vertical: 0),
                    child: DotsIndicator(
                        mainAxisAlignment: MainAxisAlignment.center,
                        position: _count,
                        dotsCount: widget.postModelType.imageUrl.length,
                        decorator: DotsDecorator(
                            color: Colors.grey,
                            activeColor: AppColors.mainColor,
                            size: const Size.square(8.0),
                            activeSize: const Size(8.0, 8.0),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0))))),
            Expanded(
                // Content part
                flex: 2,
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 30),
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
                                  border:
                                      Border.all(color: AppColors.mainColor),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          widget.userModelType.avatar),
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
                                          widget.userModelType.phone,
                                          style:
                                              AppTextStyle.blackBodyTextStyle,
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
                                          widget.userModelType.email,
                                          style:
                                              AppTextStyle.blackBodyTextStyle,
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
                              padding:
                                  const EdgeInsets.only(top: 5, bottom: 15),
                              child: Text(widget.userModelType.name)),
                          const Text("Price:"), // price part
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
                                  widget.postModelType.price,
                                  style: AppTextStyle.blackBodyTextStyle,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),

                          Container(
                              // location part
                              padding: const EdgeInsets.only(top: 10),
                              child: const Text("Location:")),
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
                                      widget.userModelType.country,
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
                                    margin: const EdgeInsets.only(
                                        left: 5, right: 10),
                                    child: Text(
                                      textAlign: TextAlign.start,
                                      widget.userModelType.city,
                                      style: AppTextStyle.blackBodyTextStyle,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Art property:"),
                          Row(
                            // Art information
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  const Text("Size (cm):"),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.height,
                                            color: AppColors.blackColor,
                                            size: 20.0,
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 5),
                                            child: Text(
                                              textAlign: TextAlign.start,
                                              widget.postModelType.hight,
                                              style: AppTextStyle
                                                  .blackBodyTextStyle,
                                              maxLines: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/icons/width.png',
                                            width: 18,
                                            height: 18,
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 5, right: 10),
                                            child: Text(
                                              textAlign: TextAlign.start,
                                              widget.postModelType.width,
                                              style: AppTextStyle
                                                  .blackBodyTextStyle,
                                              maxLines: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text("Pano Material:"),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.panorama,
                                        color: AppColors.blackColor,
                                        size: 20.0,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 5, right: 10),
                                        child: Text(
                                          textAlign: TextAlign.start,
                                          widget.postModelType.pano,
                                          style:
                                              AppTextStyle.blackBodyTextStyle,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text("Color Type:"),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.color_lens,
                                        color: AppColors.blackColor,
                                        size: 20.0,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 5, right: 10),
                                        child: Text(
                                          textAlign: TextAlign.start,
                                          widget.postModelType.color,
                                          style:
                                              AppTextStyle.blackBodyTextStyle,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                              padding: const EdgeInsets.only(top: 10),
                              child: const Text("Art description:")),
                          TextField(
                            controller: descriptionController,
                            

                            // onChanged: (value) {
                            //   value = widget.postModelType.description;
                            // },
                          )
                          // Text(widget.postModelType.description),
                        ],
                      ),
                    )
                  ],
                )),
            Container(
              height: 5,
              color: AppColors.transparentColor,
            )
          ],
        ));
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
