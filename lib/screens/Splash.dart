import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/api/Api.dart';
import '../data/models/Wrappers/HouseWrapper/HouseWrapper.dart';
import '../data/storage/Database/DecksDatabase.dart';
import '../utilities/LogoConverte.dart';

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
    HouseWrapper houses = await Api.getAllHouses();
    LogoConverter.init(houses);
    await DecksDatabase.initDatabase();
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
