import 'package:flutter/material.dart';
import 'package:socialvolks/src/widgets/post.dart';

class ImageViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String imagen = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: Post([imagen])
    );
  }
}