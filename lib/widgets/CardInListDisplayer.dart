import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keyforgery/data/models/Card/Card/RetrievedCard.dart';
import 'package:keyforgery/utilities/style.dart';

class CardInListDisplayer extends StatelessWidget {
  const CardInListDisplayer(
      {Key? key, required this.card, required this.callback})
      : super(key: key);

  final RetrievedCard card;
  final double size = 30;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/images/${card.rarity}.svg',
              width: size,
              height: size,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                card.card_title,
                style: textFontCard,
              ),
            ),
            card.is_maverick
                ? SvgPicture.asset(
                    'assets/images/maverick.svg',
                    width: size,
                    height: size,
                  )
                : Container(),
            card.is_legacy
                ? SvgPicture.asset(
                    'assets/images/legacy.svg',
                    width: size,
                    height: size,
                  )
                : Container(),
            card.is_anomaly
                ? SvgPicture.asset(
                    'assets/images/anomaly.svg',
                    width: size,
                    height: size,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
