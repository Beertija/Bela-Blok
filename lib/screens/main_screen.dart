import 'package:bela_blok/providers/game_result_provider.dart';
import 'package:bela_blok/screens/game_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BelaBlokMainScreen extends StatefulWidget {
  const BelaBlokMainScreen({Key? key}) : super(key: key);

  @override
  _BelaBlokMainScreenState createState() => _BelaBlokMainScreenState();
}

class _BelaBlokMainScreenState extends State<BelaBlokMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bela Blok", style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: ListView.builder(
                itemCount: Provider.of<BelaGamesProvider>(context, listen: true)
                    .belaGames
                    .length,
                itemBuilder: (context, index) {
                  int key =
                      Provider.of<BelaGamesProvider>(context, listen: true)
                          .belaGames
                          .keys
                          .elementAt(index);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(Provider.of<BelaGamesProvider>(context, listen: true)
                          .belaGames[key]!
                          .mainScoreFirstTeam),
                      Text(Provider.of<BelaGamesProvider>(context, listen: true)
                          .belaGames[key]!
                          .mainScoreSecondTeam),
                    ],
                  );
                  // return Card(myDevice: PointsCalculator.Games[key]!);
                }),
          ),
          Expanded(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: openGame,
                  child: const Text("New game"),
                ),
              )),
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
