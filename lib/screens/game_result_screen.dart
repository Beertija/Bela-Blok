import 'package:bela_blok/components/number_plate_template.dart';
import 'package:bela_blok/helpers/points_calculator.dart';
import 'package:bela_blok/models/BelaTile.dart';
import 'package:bela_blok/providers/points_provider.dart';
import 'package:flutter/material.dart';

import '../components/team_score_template.dart';
import '../helpers/media_query.dart';
import 'package:provider/provider.dart';

class GameResultScreen extends StatefulWidget {
  const GameResultScreen({Key? key}) : super(key: key);

  @override
  _GameResultScreenState createState() => _GameResultScreenState();
}

class _GameResultScreenState extends State<GameResultScreen> {
  String teamFirst = "Team 1";
  String teamSecond = "Team 2";
  String done = "Done";
  String loss = "Loss";
  String points = "Points";
  String contract = "Contract";
  String whichTeam = "Which team lost?";
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

  @override
  void initState() {
    super.initState();
    Provider.of<PointsProvider>(context, listen: false).reset();
  }

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
                        teamPoints: int.parse(Provider.of<PointsProvider>(
                                    context,
                                    listen: true)
                                .belaTile
                                .pointsFirstTeam) +
                            int.parse(Provider.of<PointsProvider>(context,
                                    listen: true)
                                .belaTile
                                .contractFirstTeam),
                        teamContract: int.parse(
                            Provider.of<PointsProvider>(context, listen: true)
                                .belaTile
                                .contractFirstTeam),
                        firstTeamActive: true,
                        onPointsPressed: setActiveButton),
                    TeamScore(
                        teamName: teamSecond,
                        teamPoints: int.parse(Provider.of<PointsProvider>(
                                    context,
                                    listen: true)
                                .belaTile
                                .pointsSecondTeam) +
                            int.parse(Provider.of<PointsProvider>(context,
                                    listen: true)
                                .belaTile
                                .contractSecondTeam),
                        teamContract: int.parse(
                            Provider.of<PointsProvider>(context, listen: true)
                                .belaTile
                                .contractSecondTeam),
                        firstTeamActive: false,
                        onPointsPressed: setActiveButton),
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
                            PointsCalculator.pointsActive = true;
                          });
                        },
                        style: PointsCalculator.pointsActive
                            ? ElevatedButton.styleFrom(primary: Colors.green)
                            : ElevatedButton.styleFrom(primary: Colors.grey),
                        child: Text(points,
                            style: TextStyle(fontSize: fontSize(context) * 28)),
                      )),
                  Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            PointsCalculator.pointsActive = false;
                          });
                        },
                        style: PointsCalculator.pointsActive
                            ? ElevatedButton.styleFrom(primary: Colors.grey)
                            : ElevatedButton.styleFrom(primary: Colors.green),
                        child: Text(contract,
                            style: TextStyle(fontSize: fontSize(context) * 28)),
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
                        NumberPad(keyPoint: listOfKeypads[1]),
                        NumberPad(keyPoint: listOfKeypads[2]),
                        NumberPad(keyPoint: listOfKeypads[3])
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        NumberPad(keyPoint: listOfKeypads[4]),
                        NumberPad(keyPoint: listOfKeypads[5]),
                        NumberPad(keyPoint: listOfKeypads[6])
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        NumberPad(keyPoint: listOfKeypads[7]),
                        NumberPad(keyPoint: listOfKeypads[8]),
                        NumberPad(keyPoint: listOfKeypads[9])
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        NumberPad(keyPoint: listOfKeypads[11]),
                        NumberPad(keyPoint: listOfKeypads[0]),
                        NumberPad(keyPoint: listOfKeypads[10])
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    title: Text(whichTeam),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Provider.of<PointsProvider>(context,
                                                    listen: false)
                                                .loss(true);
                                            lostGame();
                                          },
                                          child: Text(teamFirst,
                                              style: TextStyle(
                                                  fontSize:
                                                      fontSize(context) * 20))),
                                      TextButton(
                                          onPressed: () {
                                            Provider.of<PointsProvider>(context,
                                                    listen: false)
                                                .loss(false);
                                            lostGame();
                                          },
                                          child: Text(teamSecond,
                                              style: TextStyle(
                                                  fontSize:
                                                      fontSize(context) * 20)))
                                    ],
                                    elevation: 24,
                                  ),
                              barrierDismissible: true);
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        child: Text(loss,
                            style: TextStyle(fontSize: fontSize(context) * 28)),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: saveGame,
                        child: Text(done,
                            style: TextStyle(fontSize: fontSize(context) * 28)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  setActiveButton(bool value) {
    setState(() {
      PointsCalculator.firstTeamActive = value;
    });
  }

  lostGame() {
    BelaTile belaTile =
        Provider.of<PointsProvider>(context, listen: false).belaTile;
    PointsCalculator.numberOfGames
        .putIfAbsent(PointsCalculator.counter, () => belaTile);
    Navigator.pop(context);
    Navigator.pop(context);
  }

  saveGame() {
    BelaTile belaTile =
        Provider.of<PointsProvider>(context, listen: false).belaTile;
    PointsCalculator.numberOfGames
        .putIfAbsent(PointsCalculator.counter, () => belaTile);
    Navigator.pop(context);
  }
}
