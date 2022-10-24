import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HouseLogoDisplay extends StatefulWidget {
  const HouseLogoDisplay({super.key, required this.link});

  final String link;

  @override
  State<HouseLogoDisplay> createState() => _HouseLogoDisplayState();
}

class _HouseLogoDisplayState extends State<HouseLogoDisplay> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10000.0),
        child: CachedNetworkImage(
          width: 46,
          height: 46,
          imageUrl: widget.link,
          placeholder: (context, url) => const CircularProgressIndicator(),
        ));
  }
}
