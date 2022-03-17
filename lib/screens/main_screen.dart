import 'package:bela_blok/screens/game_result_screen.dart';
import 'package:flutter/material.dart';

import '../models/BelaTile.dart';

class BelaBlokMainScreen extends StatefulWidget {
  const BelaBlokMainScreen({Key? key}) : super(key: key);

  @override
  _BelaBlokMainScreenState createState() => _BelaBlokMainScreenState();
}

class _BelaBlokMainScreenState extends State<BelaBlokMainScreen> {
  List<BelaTile>? listOfBelaPlays;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bela Blok", style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          const Expanded(
            child: Text("broj"),
            flex: 8,
          ),
          Expanded(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: openGame,
                  child: const Text("New game"),
                ),
              )
          ),
        ],
      ),
    );
  }

  void openGame() {
    openGameResultScreen();
  }

  Future<void> openGameResultScreen() async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const GameResultScreen()));
  }
}
