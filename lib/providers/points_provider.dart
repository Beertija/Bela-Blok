import 'package:bela_blok/helpers/points_calculator.dart';
import 'package:bela_blok/models/BelaTile.dart';
import 'package:flutter/material.dart';

class PointsProvider with ChangeNotifier {
  final BelaTile _belaTile = BelaTile(
      pointsFirstTeam: "0",
      contractFirstTeam: "0",
      pointsSecondTeam: "0",
      contractSecondTeam: "0");

  BelaTile get belaTile => _belaTile;

  String insert(String original, String addition) {
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

  void calculate(String keyPoint) {
    switch (keyPoint) {
      case "C":
        if (PointsCalculator.firstTeamActive) {
          if (PointsCalculator.pointsActive) {
            _belaTile.pointsFirstTeam = clear(_belaTile.pointsFirstTeam);
          } else {
            _belaTile.contractFirstTeam = clear(_belaTile.contractFirstTeam);
          }
        } else {
          if (PointsCalculator.pointsActive) {
            _belaTile.pointsSecondTeam = clear(_belaTile.pointsSecondTeam);
          } else {
            _belaTile.contractSecondTeam = clear(_belaTile.contractSecondTeam);
          }
        }
        break;
      case "CE":
        if (PointsCalculator.firstTeamActive) {
          if (PointsCalculator.pointsActive) {
            _belaTile.pointsFirstTeam = clearAll();
          } else {
            _belaTile.contractFirstTeam = clearAll();
          }
        } else {
          if (PointsCalculator.pointsActive) {
            _belaTile.pointsSecondTeam = clearAll();
          } else {
            _belaTile.contractSecondTeam = clearAll();
          }
        }
        break;
      default:
        if (PointsCalculator.firstTeamActive) {
          if (PointsCalculator.pointsActive) {
            _belaTile.pointsFirstTeam = insert(_belaTile.pointsFirstTeam, keyPoint);
          } else {
            _belaTile.contractFirstTeam = insert(_belaTile.contractFirstTeam, keyPoint);
          }
        } else {
          if (PointsCalculator.pointsActive) {
            _belaTile.pointsSecondTeam = insert(_belaTile.pointsSecondTeam, keyPoint);
          } else {
            _belaTile.contractSecondTeam = insert(_belaTile.contractSecondTeam, keyPoint);
          }
        }
    }
    notifyListeners();
  }
}
