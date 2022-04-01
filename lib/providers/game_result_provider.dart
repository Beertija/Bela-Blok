import 'package:bela_blok/models/BelaGame.dart';
import 'package:flutter/material.dart';

class BelaGamesProvider with ChangeNotifier {
  int counter = 1;
  int _numberOfPointsFirstTeam = 0, _numberOfPointsSecondTeam = 0;
  final Map<int, BelaGame> _belaGames = {};

  Map<int, BelaGame> get belaGames => _belaGames;

  int get numberOfPointsFirstTeam => _numberOfPointsFirstTeam;

  int get numberOfPointsSecondTeam => _numberOfPointsSecondTeam;

  void add(BelaGame belaGame) {
    _numberOfPointsSecondTeam += int.parse(belaGame.pointsSecondTeam) +
        int.parse(belaGame.contractSecondTeam);
    _numberOfPointsFirstTeam += int.parse(belaGame.pointsFirstTeam) +
        int.parse(belaGame.contractFirstTeam);
    belaGame.mainScoreSecondTeam = (int.parse(belaGame.pointsSecondTeam) +
            int.parse(belaGame.contractSecondTeam))
        .toString();
    belaGame.mainScoreFirstTeam = (int.parse(belaGame.pointsFirstTeam) +
            int.parse(belaGame.contractFirstTeam))
        .toString();
    _belaGames.putIfAbsent(counter++, () => belaGame);
    notifyListeners();
  }
}