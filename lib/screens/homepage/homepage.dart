import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_learn/data/card_list.dart';

import 'package:flutter_learn/screens/description/widgets/absorb_pointer.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);
  static const routeName = '/homepage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn Flutter"),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: cardsList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: InkWell(
              onTap: (() =>
                  Navigator.pushNamed(context, cardsList[index].routeName)),
              child: Center(
                child: Text(cardsList[index].title),
              ),
            ),
          );
        },
      ),
    );
  }
}
