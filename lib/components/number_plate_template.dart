import 'package:bela_blok/helpers/media_query.dart';
import 'package:provider/provider.dart';
import 'package:bela_blok/providers/points_provider.dart';
import 'package:flutter/material.dart';

class NumberPad extends StatelessWidget {
  const NumberPad({Key? key, required this.keyPoint}) : super(key: key);
  final String keyPoint;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: ElevatedButton(
          onPressed: () => Provider.of<PointsProvider>(context, listen: false)
              .calculate(keyPoint),
          style: ElevatedButton.styleFrom(primary: Colors.grey),
          child: Text(keyPoint,
              style: TextStyle(fontSize: fontSize(context) * 30)),
        ));
  }
}
