import 'dart:io';

import 'package:art_market/constance/colors.dart';
import 'package:art_market/constance/text_style.dart';
import 'package:art_market/screens/art_page/screens/art_detail_page/widget/art_detail_page_widget.dart';
import 'package:art_market/screens/profile_page/model/profile_model.dart';
import 'package:art_market/screens/profile_page/model/profile_post_model.dart';
import 'package:art_market/screens/profile_page/screens/edit_my_post_page/bloc/edit_post_bloc.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditPostPage extends StatelessWidget {
  const EditPostPage(
      {required this.postModelType, required this.userModelType, Key? key})
      : super(key: key);

  final ProfilePostModel postModelType;
  final ProfileUser userModelType;

  @override
  Widget build(BuildContext context) {
    final editProductBloc = BlocProvider.of<EditPostBloc>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          actions: [
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              child: const Text(
                'Save',
                style: AppTextStyle.blackBodyTextStyle,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
        body: BlocBuilder<EditPostBloc, EditPostState>(
          builder: (context, state) {
            return Column(
              children: [
                
                  state.images == null || state.images!.isEmpty ?
                  Expanded(
                      flex: 1,
                      child: 
                      // state.images == null || state.images!.isEmpty ?
                        Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.zero,
                                  child: Stack(
                                    children: [
                                      PageView.builder(
                                        itemCount: postModelType.imageUrl.length,
                                        onPageChanged: (index) {
                                          editProductBloc
                                              .add(DotIndicatorEvent(index));
                                        },
                                        itemBuilder: (context, index) =>
                                            ArtDetailWidget(
                                                imagePath: postModelType
                                                    .imageUrl[index]),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                    margin:
                                        const EdgeInsets.only(left: 10, top: 10),
                                    child: InkWell(
                                        overlayColor: MaterialStateProperty.all(
                                            Colors.transparent),
                                        onTap: () async {
                                          if (state.images == null ||
                                              state.images!.isEmpty) {
                                            final ImagePicker picker =
                                                ImagePicker();
                                            final List<XFile> images =
                                                await picker.pickMultiImage();
                                            if (images.isNotEmpty) {
                                              editProductBloc.add(
                                                  SelectImageEditPostEvent(
                                                      images));
                                            }
                                          }
                                        },
                                        child: Container(
                                            alignment: Alignment.center,
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: AppColors.greyColor),
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                            child: const Icon(
                                              Icons.photo_camera,
                                              size: 35,
                                              color: Colors.grey,
                                            )))),
                              ],
                            )
                              )
                                  :
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    height: 110,
                                    child: ListView.builder(
                                                                scrollDirection: Axis.horizontal,
                                                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                                                itemCount: state.images!.length + 1,
                                                                itemBuilder: (_, i) => Stack(
                                      children: [
                                        Container(
                                          height: 100,
                                          width: 120,
                                          margin: const EdgeInsets.only(
                                              left: 3.0, right: 3.0, top: 5),
                                          child: i != state.images!.length
                                              ? Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                    image: DecorationImage(
                                                      image: FileImage(File(
                                                          state.images![i].path)),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                )
                                              : Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(10),
                                                      color: AppColors.whiteColor),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      if (state
                                                          .images!.isNotEmpty) {
                                                        final ImagePicker picker =
                                                            ImagePicker();
                                                        final List<XFile> images =
                                                            await picker
                                                                .pickMultiImage();
                                                        if (images.isNotEmpty) {
                                                          editProductBloc.add(
                                                              SelectImageEditPostEvent(
                                                                  images));
                                                        }
                                                      }
                                                    },
                                                    child: const Icon(
                                                      Icons.photo_camera,
                                                      size: 80,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                        ),
                                        Container(
                                          child: i != state.images!.length
                                              ? Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 3),
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey[200],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: InkWell(
                                                    onTap: () {
                                                      editProductBloc.add(
                                                          UnSelectImageEditPostEvent(
                                                              i));
                                                    },
                                                    child: const Icon(
                                                      Icons.close,
                                                      color: AppColors.blackColor,
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                )
                                              : const SizedBox(),
                                        ),
                                      ],
                                    )
                                                  ),
                                  ),
                postModelType.imageUrl.length == 1 || state.images!.isNotEmpty
                    ? const SizedBox()
                    : Padding(
                        // Positioner part
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 0, vertical: 0),
                        child: DotsIndicator(
                            mainAxisAlignment: MainAxisAlignment.center,
                            position: state.dotIndicator,
                            dotsCount: postModelType.imageUrl.length,
                            decorator: DotsDecorator(
                                color: Colors.grey,
                                activeColor: AppColors.mainColor,
                                size: const Size.square(8.0),
                                activeSize: const Size(8.0, 8.0),
                                activeShape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(5.0))))),
                Expanded(
                    // Content part
                    flex: 2,
                    child: ListView(children: [
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
                                      color: AppColors.transparentColor,
                                      border: Border.all(
                                          color: AppColors.mainColor),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            NetworkImage(userModelType.avatar),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            margin:
                                                const EdgeInsets.only(left: 5),
                                            child: Text(
                                              userModelType.phone,
                                              style: AppTextStyle
                                                  .blackBodyTextStyle,
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
                                            margin:
                                                const EdgeInsets.only(left: 5),
                                            child: Text(
                                              textAlign: TextAlign.start,
                                              userModelType.email,
                                              style: AppTextStyle
                                                  .blackBodyTextStyle,
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
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  child: Text(userModelType.name)),
                              const Text("Location:"), // Location part
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                      userModelType.country,
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
                                      userModelType.city,
                                      style: AppTextStyle.blackBodyTextStyle,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                // price part
                                onChanged: (text) {
                                  // call bloc event
                                },
                                textAlignVertical: TextAlignVertical.center,
                                textAlign: TextAlign.start,
                                maxLength: 30,
                                initialValue: postModelType.price,
                                keyboardType: TextInputType.number,
                                minLines: 1,
                                maxLines: 1,
                                style: AppTextStyle.blackBodyTextStyle,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.attach_money,
                                    size: 20.0,
                                  ),
                                  labelText: "Price USD",
                                  hintStyle: const TextStyle(
                                      color: AppColors.mainColor),
                                  hintText: "Enter your price",
                                  // filled: true,
                                  // fillColor: Colors.blueAccent,
                                  border: OutlineInputBorder(
                                      // borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              // Art information
                              TextFormField(
                                // hight
                                onChanged: (text) {
                                  // call bloc event
                                },
                                textAlignVertical: TextAlignVertical.center,
                                textAlign: TextAlign.start,
                                maxLength: 30,
                                initialValue: postModelType.hight,
                                keyboardType: TextInputType.number,
                                minLines: 1,
                                maxLines: 1,
                                style: AppTextStyle.blackBodyTextStyle,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.height,
                                    size: 20.0,
                                  ),
                                  labelText: "Hight",
                                  hintStyle: const TextStyle(
                                      color: AppColors.mainColor),
                                  hintText: "Enter your art hight",
                                  // filled: true,
                                  // fillColor: Colors.blueAccent,
                                  border: OutlineInputBorder(
                                      // borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              TextFormField(
                                //  width
                                onChanged: (text) {},
                                maxLength: 30,
                                initialValue: postModelType.width,
                                keyboardType: TextInputType.number,
                                minLines: 1,
                                maxLines: 1,
                                style: AppTextStyle.blackBodyTextStyle,
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(13.0),
                                    child: Image.asset(
                                      'assets/icons/width.png',
                                      width: 18,
                                      height: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  labelText: "Width",
                                  hintStyle: const TextStyle(
                                      color: AppColors.mainColor),
                                  hintText: "Enter your art width",
                                  // filled: true,
                                  // fillColor: Colors.blueAccent,
                                  border: OutlineInputBorder(
                                      // borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              TextFormField(
                                // Pano part
                                onChanged: (text) {},
                                maxLength: 150,
                                initialValue: postModelType.pano,
                                keyboardType: TextInputType.text,
                                minLines: 1,
                                maxLines: 5,
                                style: AppTextStyle.blackBodyTextStyle,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.panorama),
                                  labelText: "Pano material description",
                                  hintStyle: const TextStyle(
                                      color: AppColors.mainColor),
                                  hintText: "Enter your pano material",
                                  // filled: true,
                                  // fillColor: Colors.blueAccent,
                                  border: OutlineInputBorder(
                                      // borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              TextFormField(
                                // Color part
                                onChanged: (text) {},
                                maxLength: 150,
                                initialValue: postModelType.color,
                                keyboardType: TextInputType.text,
                                minLines: 1,
                                maxLines: 5,
                                style: AppTextStyle.blackBodyTextStyle,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.color_lens),
                                  labelText: "Color type description",
                                  hintStyle: const TextStyle(
                                      color: AppColors.mainColor),
                                  hintText: "Enter your art color type",
                                  // filled: true,
                                  // fillColor: Colors.blueAccent,
                                  border: OutlineInputBorder(
                                      // borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              TextFormField(
                                // Description part
                                onChanged: (text) {},
                                maxLength: 1000,
                                initialValue: postModelType.description,
                                keyboardType: TextInputType.text,
                                minLines: 1,
                                maxLines: 30,
                                style: AppTextStyle.blackBodyTextStyle,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.description),
                                  labelText: "Art description",
                                  hintStyle: const TextStyle(
                                      color: AppColors.mainColor),
                                  hintText: "Enter your art description",
                                  // filled: true,
                                  // fillColor: Colors.blueAccent,
                                  border: OutlineInputBorder(
                                      // borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 5,
                      )
                    ]))
              ],
            );
          },
        ));
  }
}
