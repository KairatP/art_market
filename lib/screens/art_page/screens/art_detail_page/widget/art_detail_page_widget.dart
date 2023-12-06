import 'package:flutter/material.dart';

class ArtDetailWidget extends StatelessWidget {
  final String imagePath;
  const ArtDetailWidget({
    Key? key,
    required this.imagePath,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imagePath),
          fit: BoxFit.cover
        )
      )

    );
  }
}


