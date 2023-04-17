import 'package:flutter/material.dart';

import '../../utilities/style.dart';

class RatioController extends StatelessWidget {
  const RatioController(
      {Key? key,
      required this.text,
      required this.data,
      required this.onPlusClick,
      required this.onMinusClick,
      required this.borderColor})
      : super(key: key);

  final String text;
  final String data;
  final Function onPlusClick;
  final Function onMinusClick;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: textFontBig,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: borderColor,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Row(
            children: [
              IconButton(
                  onPressed: () => onMinusClick(),
                  icon: const Icon(Icons.remove)),
              SizedBox(
                width: 40,
                child: Text(
                  data,
                  textAlign: TextAlign.center,
                  style: textFontBold,
                ),
              ),
              IconButton(
                  onPressed: () => onPlusClick(), icon: const Icon(Icons.add)),
            ],
          ),
        )
      ],
    );
  }
}
