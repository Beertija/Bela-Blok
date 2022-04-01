import 'package:bela_blok/helpers/points_calculator.dart';
import 'package:bela_blok/models/BelaGame.dart';
import 'package:flutter/material.dart';

class PointsProvider with ChangeNotifier {
  final int maxPoints = 162;
  final int maxContract = 1001;

  BelaGame _belaGame = BelaGame(
      pointsFirstTeam: "0",
      contractFirstTeam: "0",
      pointsSecondTeam: "0",
      contractSecondTeam: "0",
      mainScoreFirstTeam: "0",
      mainScoreSecondTeam: "0");

  BelaGame get belaGame => _belaGame;

  void reset() {
    _belaGame = BelaGame(
        pointsFirstTeam: "0",
        contractFirstTeam: "0",
        pointsSecondTeam: "0",
        contractSecondTeam: "0",
        mainScoreFirstTeam: "0",
        mainScoreSecondTeam: "0");
  }

  String insert(String original, String addition) {
    if (PointsCalculator.pointsActive) {
      if (int.parse(original + addition) > maxPoints) {
        return original;
      }
    } else {
      if (int.parse(original + addition) > maxContract) {
        return original;
      }
    }
    if (original == "0") {
      return addition;
    } else {
      original += addition;
      return original;
    }
  }

  String clear(String original) {
    if (original.length == 1) {
      return "0";
    } else {
      return original.substring(0, original.length - 1);
    }
  }

  String clearAll() {
    return "0";
  }

  void loss(bool firstTeamLoss) {
    switch (firstTeamLoss) {
      case true:
        _belaGame.pointsFirstTeam = clearAll();
        _belaGame.contractSecondTeam =
            (int.parse(_belaGame.contractSecondTeam) +
                    int.parse(_belaGame.contractFirstTeam))
                .toString();
        _belaGame.contractFirstTeam = clearAll();
        _belaGame.pointsSecondTeam = maxPoints.toString();
        break;
      case false:
        _belaGame.pointsSecondTeam = clearAll();
        _belaGame.contractFirstTeam = (int.parse(_belaGame.contractFirstTeam) +
                int.parse(_belaGame.contractSecondTeam))
            .toString();
        _belaGame.contractSecondTeam = clearAll();
        _belaGame.pointsFirstTeam = maxPoints.toString();
        break;
    }
    notifyListeners();
  }

  void calculate(String keyPoint) {
    switch (keyPoint) {
      case "C":
        if (PointsCalculator.firstTeamActive) {
          if (PointsCalculator.pointsActive) {
            _belaGame.pointsFirstTeam = clear(_belaGame.pointsFirstTeam);
            _belaGame.pointsSecondTeam =
                (maxPoints - int.parse(_belaGame.pointsFirstTeam)).toString();
          } else {
            _belaGame.contractFirstTeam = clear(_belaGame.contractFirstTeam);
          }
        } else {
          if (PointsCalculator.pointsActive) {
            _belaGame.pointsSecondTeam = clear(_belaGame.pointsSecondTeam);
            _belaGame.pointsFirstTeam =
                (maxPoints - int.parse(_belaGame.pointsSecondTeam)).toString();
          } else {
            _belaGame.contractSecondTeam = clear(_belaGame.contractSecondTeam);
          }
        }
        break;
      case "CE":
        if (PointsCalculator.firstTeamActive) {
          if (PointsCalculator.pointsActive) {
            _belaGame.pointsFirstTeam = clearAll();
            _belaGame.pointsSecondTeam = maxPoints.toString();
          } else {
            _belaGame.contractFirstTeam = clearAll();
          }
        } else {
          if (PointsCalculator.pointsActive) {
            _belaGame.pointsSecondTeam = clearAll();
            _belaGame.pointsFirstTeam = maxPoints.toString();
          } else {
            _belaGame.contractSecondTeam = clearAll();
          }
        }
        break;
      default:
        if (PointsCalculator.firstTeamActive) {
          if (PointsCalculator.pointsActive) {
            _belaGame.pointsFirstTeam =
                insert(_belaGame.pointsFirstTeam, keyPoint);
            _belaGame.pointsSecondTeam =
                (maxPoints - int.parse(_belaGame.pointsFirstTeam)).toString();
          } else {
            _belaGame.contractFirstTeam =
                insert(_belaGame.contractFirstTeam, keyPoint);
          }
        } else {
          if (PointsCalculator.pointsActive) {
            _belaGame.pointsSecondTeam =
                insert(_belaGame.pointsSecondTeam, keyPoint);
            _belaGame.pointsFirstTeam =
                (maxPoints - int.parse(_belaGame.pointsSecondTeam)).toString();
          } else {
            _belaGame.contractSecondTeam =
                insert(_belaGame.contractSecondTeam, keyPoint);
          }
        }
    }
    notifyListeners();
  }
}
