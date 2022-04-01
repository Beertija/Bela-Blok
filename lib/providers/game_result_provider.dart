import 'package:bela_blok/models/BelaGame.dart';
import 'package:flutter/material.dart';

class BelaGamesProvider with ChangeNotifier {
  int counter = 1;
  final Map<int, BelaGame> _belaGames = {};

  Map<int, BelaGame> get belaGames => _belaGames;

  void add(BelaGame belaGame) {
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