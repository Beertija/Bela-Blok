import 'package:bela_blok/helpers/media_query.dart';
import 'package:bela_blok/helpers/points_calculator.dart';
import 'package:flutter/material.dart';

class TeamScore extends StatefulWidget {
  const TeamScore(
      {Key? key,
      required this.teamName,
      required this.teamPoints,
      required this.teamContract,
      required this.firstTeamActive,
      required this.onPointsPressed})
      : super(key: key);

  final String teamName;
  final int teamPoints;
  final int teamContract;
  final bool firstTeamActive;
  final Function(bool) onPointsPressed;

  @override
  State<TeamScore> createState() => _TeamScoreState();
}

class _TeamScoreState extends State<TeamScore> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Text(widget.teamName,
            style: TextStyle(
                fontSize: fontSize(context) * 26, fontWeight: FontWeight.bold)),
        ElevatedButton(
          onPressed: () => widget.onPointsPressed(widget.firstTeamActive ? true : false),
          style: widget.firstTeamActive == PointsCalculator.firstTeamActive
              ? ElevatedButton.styleFrom(
                  primary: Colors.grey, onPrimary: Colors.black)
              : ElevatedButton.styleFrom(
                  primary: Colors.white, onPrimary: Colors.black),
          child: Text(widget.teamPoints.toString(),
              style: TextStyle(fontSize: fontSize(context) * 80)),
        ),
        Text("Contract: " + widget.teamContract.toString(),
            style: TextStyle(
                fontSize: fontSize(context) * 18, fontWeight: FontWeight.bold))
      ],
    ));
  }
}
