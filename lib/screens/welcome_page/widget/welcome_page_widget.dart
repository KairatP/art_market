import 'package:flutter/material.dart';

class WelcomePageWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imagePath;
  // final String buttonName;
  const WelcomePageWidget(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.imagePath,
      // required this.buttonName
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 375,
          height: 375,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          // width: 375,
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          // width: 375,
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            maxLines: 3,
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
