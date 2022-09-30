import 'package:flutter/material.dart';
import 'package:flutter_learn/screens/description/widgets/absorb_pointer.dart';
import 'package:flutter_learn/screens/homepage/homepage.dart';

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
      routes: {
        Homepage.routeName: (context) => const Homepage(),
        LearnAbsorbPointer.routeName: (context) => const LearnAbsorbPointer(),
      },
      home: const Homepage(),
    );
  }
}
