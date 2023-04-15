import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyforgery/data/models/Wrappers/ExpansionWrapper/ExpansionWrapper.dart';
import 'package:keyforgery/utilities/utils.dart';

import '../data/api/Api.dart';
import '../data/models/Wrappers/HouseWrapper/HouseWrapper.dart';
import '../data/models/Wrappers/TheCrucibleWrapper/TokenWrapper/RefreshTokenWrapper.dart';
import '../data/storage/Database/DecksDatabase.dart';
import '../utilities/DataMantainer.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onInitializationComplete;

  const SplashScreen({
    required Key key,
    required this.onInitializationComplete,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _initializeAsyncDependencies();
  }

  Future<void> _initializeAsyncDependencies() async {
    Future<HouseWrapper> houses = Api.getAllHouses();
    Future<ExpansionWrapper> expansions = Api.getAllExpansions();
    LogoConverter.init(await houses, await expansions);
    await DecksDatabase.initDatabase();
    var refreshToken = await SharedPrefs.getRefreshToken();
    if(refreshToken.id != 0){
      try { // TODO remove try catch and add proper handling... also figure out how exactly this refresh token stuff works
        var newToken = await Api.sendRefreshToken(RefreshTokenWrapper(refreshToken));
        var newList = await Api.getCrucibleDecks(newToken.token);
        var oldList = await SharedPrefs.getCruciblePrevious();
        await updateDifferences(oldList.decks, newList.decks);
        await SharedPrefs.setCruciblePrevious(newList);
      } catch (e) {}
    }
    widget.onInitializationComplete();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
