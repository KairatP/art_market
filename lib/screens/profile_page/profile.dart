import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      backgroundColor: Colors.blueAccent,
      body: const Center(child: Text("Profile")),
    );
  }
}