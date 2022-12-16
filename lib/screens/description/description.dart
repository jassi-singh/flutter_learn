import 'package:flutter/material.dart';
import 'package:flutter_learn/screens/description/widgets/image.dart';

import '../../models/card_info_model.dart';
import 'widgets/absorb_pointer.dart';
import 'widgets/align.dart';

class Description extends StatelessWidget {
  final CardInfo cardInfo;
  const Description({Key? key, required this.cardInfo}) : super(key: key);

  static const routeName = '/description';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cardInfo.title),
      ),
      body: _showBody(),
    );
  }

  _showBody() {
    switch (cardInfo.screen) {
      case Screens.learnAbsorbPointer:
        return const LearnAbsorbPointer();
      case Screens.learnAlign:
        return const LearnAlign();
      case Screens.learnImage:
        return const LearnImage();
      default:
        return const Center(child: Text("No route found"));
    }
  }
}
