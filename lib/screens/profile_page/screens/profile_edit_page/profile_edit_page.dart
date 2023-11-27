import 'package:art_market/constance/colors.dart';
import 'package:art_market/constance/text_style.dart';
import 'package:art_market/screens/art_page/bloc/art_bloc.dart';
import 'package:art_market/screens/profile_page/bloc/profile_bloc.dart';
import 'package:art_market/screens/profile_page/screens/profile_edit_page/bloc/profile_edit_bloc.dart';
import 'package:art_market/screens/profile_page/screens/profile_edit_page/data/profile_edit_page_data.dart';
import 'package:art_market/screens/profile_page/screens/profile_edit_page/select_photo_options_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProfileEditBloc>(context);
    return BlocListener<ProfileEditBloc, ProfileEditState>(
      listener: (context, state) {
        if (state is ProfileUpdateState) {
          artFirstLoad = true;
          profileFirstLoad = true;
          Navigator.pop(context);
        }
      },
      child: BlocBuilder<ProfileEditBloc, ProfileEditState>(
        builder: (context, state) {
          if (state is EditProfileLoadingState) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                color: AppColors.mainColor,)));
          }
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
                    'Update',
                    style: AppTextStyle.blackBodyTextStyle,
                  ),
                  onPressed: () {
                    if (productBloc.state.images!.path.isEmpty &&
                            productBloc.state.imagesURL.isEmpty ||
                        productBloc.state.name.isEmpty ||
                        productBloc.state.phoneNumber.isEmpty ||
                        productBloc.state.country.isEmpty ||
                        productBloc.state.city.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => CupertinoAlertDialog(
                          title: const Text('Error'),
                          content: const Text(
                              'Please enter all required information'),
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
                      productBloc.add(UpdateEditProfileEvent(
                          productBloc.state.images!,
                          productBloc.state.name,
                          productBloc.state.phoneNumber,
                          productBloc.state.country,
                          productBloc.state.city));
                    }
                  },
                )
              ],
            ),
            body: ListView(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        state.images!.path.isEmpty
                            ? Container(
                                margin: const EdgeInsets.only(right: 10),
                                width: 140,
                                height: 140,
                                decoration: BoxDecoration(
                                  color: AppColors.transparentColor,
                                  borderRadius: BorderRadius.circular(70),
                                  border:
                                      Border.all(color: AppColors.mainColor),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(state
                                              .imagesURL.isEmpty
                                          ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSItZEIqi-mJMnPpWOBUzEGvkE3gsACe19W2Np1neYZyI0PlTv6_WNzFByxz0EkV7equPQ&usqp=CAU'
                                          : state.imagesURL)),
                                ),
                              )
                            : Container(
                                width: 140,
                                height: 140,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.blackColor),
                                  color: AppColors.transparentColor,
                                  borderRadius: BorderRadius.circular(70.0),
                                ),
                                child:
                                    // state.images == null
                                    // ?
                                    // Image.network(state.imagesURL,
                                    // width: 100,
                                    // height: 100,
                                    // fit: BoxFit.cover,
                                    // )
                                    // const Icon(
                                    //     Icons.person,
                                    //     size: 100,
                                    //     color: Colors.grey,
                                    //   )
                                    // :
                                    CircleAvatar(
                                  // add image form backend
                                  backgroundImage: FileImage(state.images!),
                                ),
                              ),
                        Container(
                            margin: const EdgeInsets.only(left: 100, top: 100),
                            child: InkWell(
                                overlayColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25.0),
                                      ),
                                    ),
                                    builder: (context) =>
                                        DraggableScrollableSheet(
                                            initialChildSize: 0.28,
                                            maxChildSize: 0.4,
                                            minChildSize: 0.28,
                                            expand: false,
                                            builder:
                                                (context, scrollController) {
                                              return SingleChildScrollView(
                                                controller: scrollController,
                                                child: SelectPhotoOptionsScreen(
                                                  imageFile: (image) {
                                                    productBloc.add(
                                                        SelectImageProfileEvent(
                                                      name: state.name,
                                                      phoneNumber:
                                                          state.phoneNumber,
                                                      country: state.country,
                                                      city: state.city,
                                                      images: image,
                                                    ));
                                                  },
                                                ),
                                              );
                                            }),
                                  );
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.greyColor),
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
                              productBloc.add(SelectImageProfileEvent(
                                name: text,
                                phoneNumber: state.phoneNumber,
                                country: state.country,
                                city: state.city,
                                images: state.images!,
                              ));
                            },
                            maxLength: 30,
                            initialValue: state.name,
                            keyboardType: TextInputType.text,
                            minLines: 1,
                            maxLines: 1,
                            style: AppTextStyle.blackBodyTextStyle,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              labelText: "Name",
                              hintStyle:
                                  const TextStyle(color: AppColors.mainColor),
                              // hintText: "Enter your name",
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
                              productBloc.add(SelectImageProfileEvent(
                                name: state.name,
                                phoneNumber: text,
                                country: state.country,
                                city: state.city,
                                images: state.images!,
                              ));
                            },
                            maxLength: 33,
                            initialValue: state.phoneNumber,
                            keyboardType: TextInputType.number,
                            minLines: 1,
                            maxLines: 1,
                            style: AppTextStyle.blackBodyTextStyle,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.phone),
                              labelText: "Phone number",
                              hintStyle:
                                  const TextStyle(color: AppColors.mainColor),
                              // hintText: "Enter your phone number",
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
                          DropdownButtonFormField(
                              items: coutry.map((valueIrem) {
                                return DropdownMenuItem(
                                  value: valueIrem,
                                  child: Text(valueIrem),
                                );
                              }).toList(),
                              onChanged: (choseValue) {
                                productBloc.add(SelectImageProfileEvent(
                                  name: state.name,
                                  phoneNumber: state.phoneNumber,
                                  country: choseValue.toString(),
                                  city: state.city,
                                  images: state.images!,
                                ));
                              },
                              hint: Text(state.country),
                              style: AppTextStyle.blackBodyTextStyle,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.public),
                                labelText: "Country",
                                hintStyle:
                                    const TextStyle(color: AppColors.mainColor),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              )),

                          // TextFormField(
                          //   onChanged: (text) {
                          //     productBloc.add(SelectImageProfileEvent(
                          //       name: state.name,
                          //       phoneNumber: state.phoneNumber,
                          //       country: text,
                          //       city: state.city,
                          //       images: state.images!,
                          //     ));
                          //   },
                          //   maxLength: 50,
                          //   initialValue: state.country,
                          //   keyboardType: TextInputType.text,
                          //   minLines: 1,
                          //   maxLines: 2,
                          //   style: AppTextStyle.blackBodyTextStyle,
                          //   decoration: InputDecoration(
                          //     prefixIcon: const Icon(Icons.public),
                          //     labelText: "Country",
                          //     hintStyle: const TextStyle(color: AppColors.mainColor),
                          //     border: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(10)),
                          //   ),
                          // ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            onChanged: (text) {
                              productBloc.add(SelectImageProfileEvent(
                                name: state.name,
                                phoneNumber: state.phoneNumber,
                                country: state.country,
                                city: text,
                                images: state.images!,
                              ));
                            },
                            maxLength: 50,
                            initialValue: state.city,
                            keyboardType: TextInputType.text,
                            minLines: 1,
                            maxLines: 2,
                            style: AppTextStyle.blackBodyTextStyle,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.location_on),
                              labelText: "City",
                              hintStyle:
                                  const TextStyle(color: AppColors.mainColor),
                              border: OutlineInputBorder(
                                  // borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
