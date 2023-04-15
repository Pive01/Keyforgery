import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HouseLogoDisplay extends StatefulWidget {
  const HouseLogoDisplay({super.key, required this.link, required this.size});

  final String link;
  final double size;

  @override
  State<HouseLogoDisplay> createState() => _HouseLogoDisplayState();
}

class _HouseLogoDisplayState extends State<HouseLogoDisplay> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 7.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10000.0),
          child: CachedNetworkImage(
            width: widget.size,
            height: widget.size,
            imageUrl: widget.link,
            placeholder: (context, url) => const CircularProgressIndicator(),
          )),
    );
  }
}
