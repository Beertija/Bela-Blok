import 'package:flutter/material.dart';

class TeamScore extends StatelessWidget {
  const TeamScore({
    Key? key,
    required this.teamName,
    required this.teamPoints,
    required this.teamContract,
  }) : super(key: key);

  final String teamName;
  final int teamPoints;
  final int teamContract;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Text(teamName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(teamPoints.toString(), style: const TextStyle(fontSize: 70)),
        Text("Contract: " + teamContract.toString(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
      ],
    ));
  }
}
