import 'dart:io';

import 'package:art_market/constance/colors.dart';
import 'package:art_market/constance/text_style.dart';
import 'package:art_market/screens/art_page/bloc/art_bloc.dart';
import 'package:art_market/screens/profile_page/bloc/profile_bloc.dart';
import 'package:art_market/screens/profile_page/screens/add_post/bloc/add_post_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({Key? key}) : super(key: key);

  // final IAuthor artModelType;

  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<AddPostBloc>(context);
    return BlocListener<AddPostBloc, AddPostState>(
      listener: (context, state) {
        if (state is SaveNewPostState) {
          artFirstLoad = true;
          profileFirstLoad = true;
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
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
                if (productBloc.state.images == null ||
                    productBloc.state.price.isEmpty ||
                    productBloc.state.height.isEmpty ||
                    productBloc.state.width.isEmpty ||
                    productBloc.state.panoType.isEmpty ||
                    productBloc.state.colorType.isEmpty ||
                    productBloc.state.description.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => CupertinoAlertDialog(
                      title: const Text('Error'),
                      content:
                          const Text('Please enter all required information'),
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
                  productBloc.add(SavePostEvent());
                }
              },
            )
          ],
        ),
        body: BlocBuilder<AddPostBloc, AddPostState>(
          builder: (context, state) {
            if (state is AddPostLoadingState) {
              return const Center(
                    child: CircularProgressIndicator(
                  color: AppColors.mainColor,
                ));
            }
            return ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: InkWell(
                    onTap: () async {
                      if (state.images == null || state.images!.isEmpty) {
                        final ImagePicker picker = ImagePicker();
                        final List<XFile> images =
                            await picker.pickMultiImage();
                        if (images.isNotEmpty) {
                          productBloc.add(SelectImagePostEvent(images));
                        }
                      }
                    },
                    child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 110,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: state.images == null || state.images!.isEmpty
                            ? const Icon(
                                Icons.photo_camera,
                                size: 80,
                                color: Colors.grey,
                              )
                            : ListView.builder(
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
                                              left: 3.0, right: 3.0),
                                          child: i != state.images!.length
                                              ? Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    image: DecorationImage(
                                                      image: FileImage(File(
                                                          state.images![i]
                                                              .path)),
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
                                                        final ImagePicker
                                                            picker =
                                                            ImagePicker();
                                                        final List<XFile>
                                                            images =
                                                            await picker
                                                                .pickMultiImage();
                                                        if (images.isNotEmpty) {
                                                          productBloc.add(
                                                              SelectImagePostEvent(
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
                                                      productBloc.add(
                                                          UnSelectImagePostEvent(
                                                              i));
                                                    },
                                                    child: const Icon(
                                                      Icons.close,
                                                      color:
                                                          AppColors.blackColor,
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                )
                                              : const SizedBox(),
                                        ),
                                      ],
                                    ))),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        onChanged: (text) {
                          productBloc.add(SetPricePostEvent(text));
                        },
                        maxLength: 30,
                        keyboardType: TextInputType.number,
                        minLines: 1,
                        maxLines: 1,
                        style: AppTextStyle.mainBodyTextStyle,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.attach_money),
                          labelText: "Price USD",
                          hintStyle:
                              const TextStyle(color: AppColors.mainColor),
                          hintText: "Enter your price",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const Text("Art property:"),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("Size (cm):"),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        onChanged: (text) {
                          productBloc.add(SetHeightPostEvent(text));
                        },
                        maxLength: 30,
                        keyboardType: TextInputType.number,
                        minLines: 1,
                        maxLines: 1,
                        style: AppTextStyle.mainBodyTextStyle,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.height),
                          labelText: "Height",
                          hintStyle:
                              const TextStyle(color: AppColors.mainColor),
                          hintText: "Enter your art height",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        onChanged: (text) {
                          productBloc.add(SetWidthPostEvent(text));
                        },
                        maxLength: 30,
                        keyboardType: TextInputType.number,
                        minLines: 1,
                        maxLines: 1,
                        style: AppTextStyle.mainBodyTextStyle,
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
                          hintStyle:
                              const TextStyle(color: AppColors.mainColor),
                          hintText: "Enter your art width",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const Text("Pano Material:"),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        onChanged: (text) {
                          productBloc.add(SetPanoTypePostEvent(text));
                        },
                        maxLength: 150,
                        keyboardType: TextInputType.text,
                        minLines: 1,
                        maxLines: 5,
                        style: AppTextStyle.mainBodyTextStyle,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.panorama),
                          labelText: "Pano material description",
                          hintStyle:
                              const TextStyle(color: AppColors.mainColor),
                          hintText: "Enter your pano material",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const Text("Color Type:"),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        onChanged: (text) {
                          productBloc.add(SetColorTypePostEvent(text));
                        },
                        maxLength: 150,
                        keyboardType: TextInputType.text,
                        minLines: 1,
                        maxLines: 5,
                        style: AppTextStyle.mainBodyTextStyle,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.color_lens),
                          labelText: "Color type description",
                          hintStyle:
                              const TextStyle(color: AppColors.mainColor),
                          hintText: "Enter your art color type",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const Text("Art description"),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        onChanged: (text) {
                          productBloc.add(SetDescriptionPostEvent(text));
                        },
                        maxLength: 1000,
                        keyboardType: TextInputType.text,
                        minLines: 1,
                        maxLines: 30,
                        style: AppTextStyle.mainBodyTextStyle,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.description),
                          labelText: "Art description",
                          hintStyle:
                              const TextStyle(color: AppColors.mainColor),
                          hintText: "Enter your art description",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
