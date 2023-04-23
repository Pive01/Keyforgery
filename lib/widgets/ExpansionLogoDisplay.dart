import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyforgery/utilities/DataMantainer.dart';

class ExpansionLogoDisplay extends StatefulWidget {
  const ExpansionLogoDisplay(
      {super.key, required this.name, required this.size});

  final String name;
  final double size;

  @override
  State<ExpansionLogoDisplay> createState() => _ExpansionLogoDisplayState();
}

class _ExpansionLogoDisplayState extends State<ExpansionLogoDisplay> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10000.0),
            child: SvgPicture.file(
              File(
                  '${DataMantainer.getAssetController().assetsDir}/KeyforgeryAssets/${widget.name}.svg'),
              width: widget.size,
              height: widget.size,
              color: Colors.white,
            )));
  }
}
