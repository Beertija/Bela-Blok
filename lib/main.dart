import 'package:bela_blok/providers/game_result_provider.dart';
import 'package:bela_blok/providers/points_provider.dart';
import 'package:bela_blok/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => PointsProvider()),
      ChangeNotifierProvider(create: (_) => BelaGamesProvider()),
    ], child: const FlutterBlueApp()),
  );
}

class FlutterBlueApp extends StatefulWidget {
  const FlutterBlueApp({Key? key}) : super(key: key);

  @override
  State<FlutterBlueApp> createState() => _FlutterBlueAppState();
}

class _FlutterBlueAppState extends State<FlutterBlueApp> {
  @override
  MaterialApp build(BuildContext context) {
    return MaterialApp(
        title: 'Parking Show',
        theme: ThemeData(primarySwatch: Colors.green),
        home: const BelaBlokMainScreen());
  }
}
