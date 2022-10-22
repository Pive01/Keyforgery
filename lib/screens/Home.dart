import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyforgery/widgets/DeckDisplayer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keyforgery'),
      ),
      // body:  // ListView.builder()
      body: const DeckDisplayer(),
      floatingActionButton: FloatingActionButton(
        elevation: 12,
        onPressed: () {
          print('ciao');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}