import 'package:art_market/constance/colors.dart';
import 'package:art_market/constance/text_style.dart';
import 'package:art_market/screens/profile_page/screens/profile_edit_page/bloc/profile_edit_bloc.dart';
import 'package:art_market/screens/profile_page/screens/profile_edit_page/select_photo_options_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String sendText = "";
    final productBloc = BlocProvider.of<ProfileEditBloc>(context);
    return Scaffold(
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
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: BlocBuilder<ProfileEditBloc, ProfileEditState>(
        builder: (context, state) {
          return ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.blackColor),
                      color: AppColors.transparentColor,
                      borderRadius: BorderRadius.circular(70.0),
                    ),
                    child: state.images == null
                        ? const Icon(
                            Icons.person,
                            size: 100,
                            color: Colors.grey,
                          )
                        : CircleAvatar(
                            // add image form backend
                            backgroundImage: FileImage(state.images!),
                          ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 100, top: 100),
                      child: InkWell(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          onTap: () {
                            showModalBottomSheet(context: context,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25.0),
                                ),
                              ),
                              builder: (context) => DraggableScrollableSheet(
                                initialChildSize: 0.28,
                                maxChildSize: 0.4,
                                minChildSize: 0.28,
                                expand: false,
                                builder: (context, scrollController) {
                                  return SingleChildScrollView(
                                    controller: scrollController,
                                    child: SelectPhotoOptionsScreen(
                                      productBloc: productBloc
                                    ),
                                  );
                                }
                              ),
                            );
                            //   final ImagePicker picker = ImagePicker();
                            //   final images =
                            //       await picker.pickImage(source: ImageSource.gallery);
                            //   if (images != null) {
                            //     File? img = File(images.path);
                            //     productBloc.add(SelectImageProfileEvent(img));
                            //   }
                          },
                          child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.greyColor),
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: const Icon(
                                Icons.photo_camera,
                                size: 35,
                                color: Colors.grey,
                              )))),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      onChanged: (text) {
                        sendText = text;
                      },
                      maxLength: 30,
                      initialValue: "Initial Text",
                      keyboardType: TextInputType.text,
                      minLines: 1,
                      maxLines: 1,
                      style: AppTextStyle.mainBodyTextStyle,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        labelText: "Name",
                        hintStyle: const TextStyle(color: AppColors.mainColor),
                        hintText: "Enter your name",
                        // filled: true,
                        // fillColor: Colors.blueAccent,
                        border: OutlineInputBorder(
                            // borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      onChanged: (text) {
                        sendText = text;
                      },
                      maxLength: 50,
                      // initialValue: "Initial Text",
                      keyboardType: TextInputType.emailAddress,
                      minLines: 1,
                      maxLines: 2,
                      style: AppTextStyle.mainBodyTextStyle,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        labelText: "Email",
                        hintStyle: const TextStyle(color: AppColors.mainColor),
                        hintText: "Enter your email adress",
                        // filled: true,
                        // fillColor: Colors.blueAccent,
                        border: OutlineInputBorder(
                            // borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      onChanged: (text) {
                        sendText = text;
                      },
                      maxLength: 33,
                      // initialValue: "Initial Text",
                      keyboardType: TextInputType.number,
                      minLines: 1,
                      maxLines: 1,
                      style: AppTextStyle.mainBodyTextStyle,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.phone),
                        labelText: "Phone number",
                        hintStyle: const TextStyle(color: AppColors.mainColor),
                        hintText: "Enter your phone number",
                        // filled: true,
                        // fillColor: Colors.blueAccent,
                        border: OutlineInputBorder(
                            // borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      onChanged: (text) {
                        sendText = text;
                      },
                      maxLength: 50,
                      // initialValue: "Initial Text",
                      keyboardType: TextInputType.text,
                      minLines: 1,
                      maxLines: 2,
                      style: AppTextStyle.mainBodyTextStyle,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.public),
                        labelText: "Country",
                        hintStyle: const TextStyle(color: AppColors.mainColor),
                        hintText: "Enter your country",
                        // filled: true,
                        // fillColor: Colors.blueAccent,
                        border: OutlineInputBorder(
                            // borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      onChanged: (text) {
                        sendText = text;
                      },
                      maxLength: 50,
                      // initialValue: "Initial Text",
                      keyboardType: TextInputType.text,
                      minLines: 1,
                      maxLines: 2,
                      style: AppTextStyle.mainBodyTextStyle,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.location_on),
                        labelText: "City",
                        hintStyle: const TextStyle(color: AppColors.mainColor),
                        hintText: "Enter your city",
                        // filled: true,
                        // fillColor: Colors.blueAccent,
                        border: OutlineInputBorder(
                            // borderSide: BorderSide.none,
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
    );
  }
}
