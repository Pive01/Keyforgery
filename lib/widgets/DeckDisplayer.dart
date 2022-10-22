import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utilities/style.dart';

class DeckDisplayer extends StatelessWidget {
  const DeckDisplayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 124,
        child: Card(
            color: Theme.of(context).primaryColor,
            elevation: 8,
            margin: const EdgeInsets.only(top: 2, left: 5, right: 5),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(7)),
            ),
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Expanded(
                              flex: 1,
                              child: Text(
                                'Petra il Povero, Ufficiale della Vegetazione',
                                textAlign: TextAlign.left,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: textFontBold,
                              )),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 1, left: 20),
                              child: Row(
                                children: const [
                                  CircleAvatar(
                                    radius: 23, // Image radius
                                    backgroundImage: NetworkImage(
                                        'https://decksofkeyforge.com/static/media/logos.484392e1.png'),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: CircleAvatar(
                                      radius: 23, // Image radius
                                      backgroundImage: NetworkImage(
                                          'https://decksofkeyforge.com/static/media/dis.35644fd3.png'),
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 23, // Image radius
                                    backgroundImage: NetworkImage(
                                        'https://decksofkeyforge.com/static/media/untamed.7db4a2fb.png'),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    'Call Of The Archons',
                                    textAlign: TextAlign.right,
                                    overflow: TextOverflow.ellipsis,
                                    style: textFontLow,
                                  )),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 18),
                                                child: Column(children: const [
                                                  Text(
                                                    '102',
                                                    textAlign: TextAlign.right,
                                                    style: textFontBold,
                                                  ),
                                                  Text(
                                                    'SAS',
                                                    textAlign: TextAlign.right,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: textFontLow,
                                                  )
                                                ])),
                                            Column(children: const [
                                              Text(
                                                '20',
                                                textAlign: TextAlign.right,
                                                style: textFontBold,
                                              ),
                                              Text(
                                                'Æmber',
                                                textAlign: TextAlign.right,
                                                overflow: TextOverflow.ellipsis,
                                                style: textFontLow,
                                              )
                                            ])
                                          ]))),
                            ]))
                  ],
                ))));
  }
}
