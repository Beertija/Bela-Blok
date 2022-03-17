import 'package:bela_blok/components/number_plate_template.dart';
import 'package:flutter/material.dart';

import '../components/team_score_template.dart';

class GameResultScreen extends StatefulWidget {
  const GameResultScreen({Key? key}) : super(key: key);

  @override
  _GameResultScreenState createState() => _GameResultScreenState();
}

class _GameResultScreenState extends State<GameResultScreen> {
  bool pointsActive = true;
  String teamFirst = "Team 1";
  String teamSecond = "Team 2";
  String done = "Done";
  String points = "Points";
  String contract = "Contract";
  final listOfKeypads = <String>[
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "C",
    "CE"
  ];
  int pointsFirstTeam = 0;
  int contractFirstTeam = 0;
  int pointsSecondTeam = 0;
  int contractSecondTeam = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TeamScore(
                      teamName: teamFirst,
                      teamPoints: pointsFirstTeam,
                      teamContract: contractFirstTeam,
                    ),
                    TeamScore(
                      teamName: teamSecond,
                      teamPoints: pointsSecondTeam,
                      teamContract: contractSecondTeam,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            pointsActive = true;
                          });
                        },
                        style: pointsActive
                            ? ElevatedButton.styleFrom(primary: Colors.green)
                            : ElevatedButton.styleFrom(primary: Colors.grey),
                        child: Text(points),
                      )),
                  Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            pointsActive = false;
                          });
                        },
                        style: pointsActive
                            ? ElevatedButton.styleFrom(primary: Colors.grey)
                            : ElevatedButton.styleFrom(primary: Colors.green),
                        child: Text(contract),
                      ))
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        NumberPad(
                            keyPoint_value: 0, keyPoint: listOfKeypads[1]),
                        NumberPad(
                            keyPoint_value: 1, keyPoint: listOfKeypads[2]),
                        NumberPad(keyPoint_value: 2, keyPoint: listOfKeypads[3])
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        NumberPad(
                            keyPoint_value: 0, keyPoint: listOfKeypads[4]),
                        NumberPad(
                            keyPoint_value: 1, keyPoint: listOfKeypads[5]),
                        NumberPad(keyPoint_value: 2, keyPoint: listOfKeypads[6])
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        NumberPad(
                            keyPoint_value: 0, keyPoint: listOfKeypads[7]),
                        NumberPad(
                            keyPoint_value: 1, keyPoint: listOfKeypads[8]),
                        NumberPad(keyPoint_value: 2, keyPoint: listOfKeypads[9])
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        NumberPad(
                            keyPoint_value: 0, keyPoint: listOfKeypads[11]),
                        NumberPad(
                            keyPoint_value: 1, keyPoint: listOfKeypads[0]),
                        NumberPad(
                            keyPoint_value: 2, keyPoint: listOfKeypads[10])
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: saveGame,
                  child: Text(done),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveGame() {
    //TODO save the score and add a new tile to the mainscreen
    Navigator.pop(context);
  }
}
