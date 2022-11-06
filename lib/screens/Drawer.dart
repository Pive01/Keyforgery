import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utilities/style.dart';
import 'Settings.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 60),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.only(
                                top: 5, bottom: 5, left: 10, right: 15)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                    onPressed: () => {},
                    child: Wrap(
                      spacing: 15,
                      children: const [
                        Icon(Icons.login),
                        Text(
                          "Log-in to DoK",
                          style: textFontBold,
                        ),
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: MaterialButton(
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Settings()),
                          )
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 23, bottom: 23),
                              child: Wrap(
                                spacing: 15,
                                children: const [
                                  Icon(Icons.settings_outlined),
                                  Text(
                                    "Settings",
                                    style: textFontBold,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ]),
          ),
        ) // Populate the Drawer in the next step.
    );
  }
}
