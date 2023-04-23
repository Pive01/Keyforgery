import 'package:download_assets/download_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyforgery/data/models/Wrappers/ExpansionWrapper/ExpansionWrapper.dart';
import 'package:keyforgery/utilities/utils.dart';

import '../data/api/Api.dart';
import '../data/models/Wrappers/HouseWrapper/HouseWrapper.dart';
import '../data/models/Wrappers/TheCrucibleWrapper/TokenWrapper/RefreshTokenWrapper.dart';
import '../data/storage/Database/DecksDatabase.dart';
import '../utilities/DataMantainer.dart';
import '../utilities/style.dart';

class SplashScreen extends StatefulWidget {
  final Function onInitializationComplete;

  const SplashScreen({
    required Key key,
    required this.onInitializationComplete,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  DownloadAssetsController downloadAssetsController =
      DownloadAssetsController();
  bool downloaded = false;
  String message = 'Getting latest information';
  double progressValue = 0;

  @override
  void initState() {
    super.initState();
    _initializeAsyncDependencies();
  }

  Future<void> _initializeAsyncDependencies() async {
    await downloadAssetsController.init(assetDir: 'KeyforgeryAssets');
    downloaded = await downloadAssetsController.assetsDirAlreadyExists();
    if (!downloaded) {
      await _downloadAssets();
    }

    Future<HouseWrapper> houses = Api.getAllHouses();
    Future<ExpansionWrapper> expansions = Api.getAllExpansions();
    DataMantainer.init(
        await houses, await expansions, downloadAssetsController);
    await DecksDatabase.initDatabase();
    var refreshToken = await SharedPrefs.getRefreshToken();
    if (refreshToken.id != 0) {
      try {
        // TODO remove try catch and add proper handling... also figure out how exactly this refresh token stuff works
        var newToken =
            await Api.sendRefreshToken(RefreshTokenWrapper(refreshToken));
        var newList = await Api.getCrucibleDecks(newToken.token);
        var oldList = await SharedPrefs.getCruciblePrevious();
        await updateDifferences(oldList.decks, newList.decks);
        await SharedPrefs.setCruciblePrevious(newList);
      } catch (e) {}
    }
    widget.onInitializationComplete();
  }

  Future _downloadAssets() async {
    try {
      await downloadAssetsController.startDownload(
        zippedFile: 'KeyforgeryAssets.zip',
        assetsUrl:
            'https://github.com/Pive01/Keyforgery_Runtime_assets/raw/main/KeyforgeryAssets.zip',
        onProgress: (progressValue) {
          downloaded = false;
          setState(() {
            this.progressValue = progressValue / 100;
            if (progressValue < 100) {
              downloaded = true;
            }
          });
        },
      );
    } on DownloadAssetsException catch (e) {
      print(e.toString());
      setState(() {
        downloaded = false;
        message = 'Error: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.deepOrange,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      home: Center(
          child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultTextStyle(
              style: textFontBold,
              child: Text(message),
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: downloaded ? progressValue : null,
            ),
          ],
        ),
      )),
    );
  }
}
