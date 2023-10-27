import 'package:art_market/constance/colors.dart';
import 'package:flutter/material.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: const Text("Post add page"),
        backgroundColor: AppColors.whiteColor,
        
      ),
      body: const Center(child: Text("Post add page")),
    );
  }
}