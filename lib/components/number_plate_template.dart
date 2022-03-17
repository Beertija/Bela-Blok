import 'package:flutter/material.dart';

class NumberPad extends StatelessWidget {
  const NumberPad({Key? key, required this.keyPoint_value, required this.keyPoint}) : super(key: key);
  final int keyPoint_value;
  final String keyPoint;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: ElevatedButton(
          onPressed: () {},
          style:
          ElevatedButton.styleFrom(primary: Colors.grey),
          child: Text(keyPoint),
        ));
  }
}
