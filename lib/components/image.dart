import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final VoidCallback socialClicks;
  final String images;
  const ImageView({super.key, required this.socialClicks, required this.images});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: socialClicks,
      child: Image.asset(
        images,
        fit: BoxFit.cover,
        width: 24,
        height: 24,
      ),
    );
  }
}
