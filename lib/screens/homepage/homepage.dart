import 'package:flutter/material.dart';
import 'package:flutter_learn/data/card_list.dart';
import 'package:flutter_learn/screens/description.dart';

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
              onTap: (() => Navigator.pushNamed(
                    context,
                    Description.routeName,
                    arguments: cardsList[index],
                  )),
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
