import 'dart:io';

import 'package:art_market/constance/colors.dart';
import 'package:art_market/constance/text_style.dart';
import 'package:art_market/screens/art_page/bloc/art_bloc.dart';
import 'package:art_market/screens/art_page/screens/art_detail_page/widget/art_detail_page_widget.dart';
import 'package:art_market/screens/profile_page/bloc/profile_bloc.dart';
import 'package:art_market/screens/profile_page/screens/edit_my_post_page/bloc/edit_post_bloc.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditPostPage extends StatelessWidget {
  const EditPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editProductBloc = BlocProvider.of<EditPostBloc>(context);
    return BlocListener<EditPostBloc, EditPostState>(
      listener: (context, state) {
        if (state is PostUpdateActionState) {
          artFirstLoad = true;
          profileFirstLoad = true;
           Navigator.pop(context);

        }
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.whiteColor,
            actions: [
              TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                child: const Text(
                  'Update',
                  style: AppTextStyle.blackBodyTextStyle,
                ),
                onPressed: () {
                  editProductBloc.add(UpdateEditPostEvent());
                },
              )
            ],
          ),
          body: BlocBuilder<EditPostBloc, EditPostState>(
            builder: (context, state) {
              if (state is EditPostLoadingState) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: AppColors.mainColor,
                ));
              }
              return Column(
                children: [
                  state.images == null || state.images!.isEmpty
                      ? Expanded(
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
                                      itemCount: state.imagesUrls.length,
                                      onPageChanged: (index) {
                                        editProductBloc
                                            .add(DotIndicatorEvent(index));
                                      },
                                      itemBuilder: (context, index) =>
                                          ArtDetailWidget(
                                              imagePath:
                                                  state.imagesUrls[index]),
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
                          ))
                      : Container(
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
                                                        BorderRadius.circular(
                                                            10),
                                                    color:
                                                        AppColors.whiteColor),
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
                                  )),
                        ),
                  state.imagesUrls.length == 1 || state.images!.isNotEmpty
                      ? const SizedBox()
                      : Padding(
                          // Positioner part
                          padding: const EdgeInsetsDirectional.symmetric(
                              horizontal: 0, vertical: 0),
                          child: DotsIndicator(
                              mainAxisAlignment: MainAxisAlignment.center,
                              position: state.dotIndicator,
                              dotsCount: state.imagesUrls.length,
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
                                          image: NetworkImage(state.avaUrl),
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
                                                margin: const EdgeInsets.only(
                                                    left: 5),
                                                child: Text(
                                                  state.phoneNumber,
                                                  style: AppTextStyle
                                                      .blackBodyTextStyle,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
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
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5),
                                      child: Text(
                                        state.name,
                                        style: AppTextStyle.blackBodyTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        ),
                                    ),
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
                                        state.country,
                                        style: AppTextStyle.blackBodyTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
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
                                        state.city,
                                        style: AppTextStyle.blackBodyTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
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
                                    editProductBloc
                                        .add(EditPosPriceEvent(price: text));
                                  },
                                  textAlignVertical: TextAlignVertical.center,
                                  textAlign: TextAlign.start,
                                  maxLength: 30,
                                  initialValue: state.price,
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                                // Art information
                                TextFormField(
                                  // hight
                                  onChanged: (text) {
                                    editProductBloc
                                        .add(EditPosHeightEvent(height: text));
                                  },
                                  textAlignVertical: TextAlignVertical.center,
                                  textAlign: TextAlign.start,
                                  maxLength: 30,
                                  initialValue: state.height,
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                                TextFormField(
                                  //  width
                                  onChanged: (text) {
                                    editProductBloc
                                        .add(EditPosWidthEvent(width: text));
                                  },
                                  maxLength: 30,
                                  initialValue: state.width,
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                                TextFormField(
                                  // Pano part
                                  onChanged: (text) {
                                    editProductBloc
                                        .add(EditPosPanoEvent(pano: text));
                                  },
                                  maxLength: 150,
                                  initialValue: state.panoType,
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                                TextFormField(
                                  // Color part
                                  onChanged: (text) {
                                    editProductBloc
                                        .add(EditPosColorEvent(color: text));
                                  },
                                  maxLength: 150,
                                  initialValue: state.colorType,
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                                TextFormField(
                                  // Description part
                                  onChanged: (text) {
                                    editProductBloc.add(EditPosDescriptionEvent(
                                        description: text));
                                  },
                                  maxLength: 1000,
                                  initialValue: state.description,
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                                const SizedBox(height: 5),

                                Center(
                                  child: TextButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              CupertinoAlertDialog(
                                            title: const Text('Are you sure?'),
                                            content: const Text(
                                                'Do you want to delete post?'),
                                            actions: [
                                              CupertinoDialogAction(
                                                isDefaultAction: true,
                                                onPressed: () =>
                                                    {Navigator.pop(context)},
                                                child: const Text('Cancel'),
                                              ),
                                              CupertinoDialogAction(
                                                isDefaultAction: true,
                                                onPressed: () {
                                                  editProductBloc.add(
                                                      DeletePostEvent(
                                                          postId:
                                                              state.postId));
                                                  Navigator.pop(context);
                                                },
                                                child:
                                                    const Text('Yes, delete'),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        style: AppTextStyle.redBodyTextStyle,
                                        'Delete post',
                                      )),
                                ),
                                const SizedBox(height: 5),
                              ],
                            )),
                        const SizedBox(
                          height: 5,
                        )
                      ]))
                ],
              );
            },
          )),
    );
  }
}
