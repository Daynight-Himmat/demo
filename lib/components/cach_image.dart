import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/components/loader.dart';
import 'package:flutter/material.dart';

class CacheImage extends StatefulWidget {
  final String? url;
  const CacheImage({super.key, this.url});

  @override
  State<CacheImage> createState() => _CacheImageState();
}

class _CacheImageState extends State<CacheImage> {

  final String url = "https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2022-03/plant-based-food-mc-220323-02-273c7b.jpg";
  @override
  Widget build(BuildContext context) {
    return  CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) =>
      const Loader(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
