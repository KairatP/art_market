import 'package:flutter/material.dart';

class ArtFilter extends StatefulWidget {
  const ArtFilter({Key? key}) : super(key: key);

  @override
  State<ArtFilter> createState() => _ArtFilterState();
}

class _ArtFilterState extends State<ArtFilter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        title: const Text("Filter"),
        
      ),
      body: const Center(child: Text("filter page")),
    );
  }
}