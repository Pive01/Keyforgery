import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExpansionLogoDisplay extends StatefulWidget {
  const ExpansionLogoDisplay(
      {super.key, required this.link, required this.size});

  final String link;
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
          child: SvgPicture.network(
            widget.link,
            width: widget.size,
            height: widget.size,
            placeholderBuilder: (BuildContext context) => SizedBox(
                height: widget.size,
                width: widget.size,
                child: const CircularProgressIndicator()),
          )),
    );
  }
}
