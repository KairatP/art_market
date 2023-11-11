import 'dart:io';

import 'package:art_market/screens/profile_page/screens/profile_edit_page/bloc/profile_edit_bloc.dart';
import 'package:art_market/screens/profile_page/screens/profile_edit_page/widget/re_usable_select_photo_button.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class SelectPhotoOptionsScreen extends StatelessWidget {
  final ProfileEditBloc productBloc;
  // final Function(ImageSource source) onTap;
  const SelectPhotoOptionsScreen({
    Key? key,
    required this.productBloc,
    // required this.onTap,
  }) : super(key: key);

  Future _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final images = await picker.pickImage(source: source);
    if (images != null) {
      File? img = File(images.path);
      img = await _cropImage(imageFile: img);
      productBloc.add(SelectImageProfileEvent(img!));
    }

    // try {
    //   final image = await ImagePicker().pickImage(source: source);
    //   if (image == null) return;
    //   File? img = File(image.path);
    //   img = await _cropImage(imageFile: img);
    //   setState(() {
    //     _image = img;
    //     Navigator.of(context).pop();
    //   });
    // } on PlatformException catch (e) {
    //   return e;
    //   // Navigator.of(context).pop();
    // }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  // void _showSelectPhotoOptions(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(
  //         top: Radius.circular(25.0),
  //       ),
  //     ),
  //     builder: (context) => DraggableScrollableSheet(
  //         initialChildSize: 0.28,
  //         maxChildSize: 0.4,
  //         minChildSize: 0.28,
  //         expand: false,
  //         builder: (context, scrollController) {
  //           return SingleChildScrollView(
  //             controller: scrollController,
  //             child: SelectPhotoOptionsScreen(
  //               onTap: _pickImage,
  //             ),
  //           );
  //         }),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey.shade300,
      padding: const EdgeInsets.all(20),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -35,
            child: Container(
              width: 50,
              height: 6,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.5),
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(children: [
            SelectPhoto(
              onTap: () {
                _pickImage(ImageSource.gallery);
                Navigator.of(context).pop();
              },
              icon: Icons.image,
              textLabel: 'Browse Gallery',
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'OR',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SelectPhoto(
              onTap: () {
                _pickImage(ImageSource.camera);
                Navigator.of(context).pop();
              },
              icon: Icons.camera_alt_outlined,
              textLabel: 'Use a Camera',
            ),
          ])
        ],
      ),
    );
  }
}
