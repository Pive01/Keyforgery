import 'dart:io';

import 'package:flutter/material.dart';
import 'package:keyforgery/utilities/DataMantainer.dart';

class HouseLogoDisplay extends StatefulWidget {
  const HouseLogoDisplay({super.key, required this.name, required this.size});

  final String name;
  final double size;

  @override
  State<HouseLogoDisplay> createState() => _HouseLogoDisplayState();
}

class _HouseLogoDisplayState extends State<HouseLogoDisplay> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10000.0),
        child: Image.file(
          File(
              '${DataMantainer.getAssetController().assetsDir}/KeyforgeryAssets/${widget.name}.png'),
          width: widget.size,
          height: widget.size,
        ));
  }
}
