import 'package:bela_blok/helpers/points_calculator.dart';
import 'package:flutter/material.dart';

class NumberPad extends StatelessWidget {
  const NumberPad(
      {Key? key, required this.keyPoint_value, required this.keyPoint})
      : super(key: key);
  final int keyPoint_value;
  final String keyPoint;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: ElevatedButton(
          onPressed: Calculate,
          style: ElevatedButton.styleFrom(primary: Colors.grey),
          child: Text(keyPoint),
        ));
  }

  void Calculate() {
    //TODO Fix calculating and formating numbers pressed by keypads
    //TODO edit static or use BelaTile model
    PointsCalculator.insert("1", keyPoint);
  }
}
