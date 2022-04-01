import 'package:bela_blok/helpers/points_calculator.dart';
import 'package:bela_blok/models/BelaTile.dart';
import 'package:flutter/material.dart';

class PointsProvider with ChangeNotifier {
  int maxPoints = 162;
  final BelaTile _belaTile = BelaTile(
      pointsFirstTeam: "0",
      contractFirstTeam: "0",
      pointsSecondTeam: "0",
      contractSecondTeam: "0");

  BelaTile get belaTile => _belaTile;

  void reset() {
    _belaTile.pointsFirstTeam = "0";
    _belaTile.contractFirstTeam = "0";
    _belaTile.pointsSecondTeam = "0";
    _belaTile.contractSecondTeam = "0";
  }
}