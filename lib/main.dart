import 'package:flutter/material.dart';
import 'package:flutter_learn/screens/description.dart';
import 'package:flutter_learn/screens/description/widgets/absorb_pointer.dart';
import 'package:flutter_learn/screens/homepage/homepage.dart';

import 'models/card_info_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case Homepage.routeName:
            return MaterialPageRoute(
              builder: (context) => const Homepage(),
            );
          case Description.routeName:
            return MaterialPageRoute(
              builder: (context) => Description(
                cardInfo: settings.arguments as CardInfo,
              ),
            );
          case LearnAbsorbPointer.routeName:
            return MaterialPageRoute(
              builder: (context) => const LearnAbsorbPointer(),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => const Center(
                child: Text("No route found"),
              ),
            );
        }
      },
      home: const Homepage(),
    );
  }
}
