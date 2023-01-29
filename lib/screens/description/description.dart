import 'package:flutter/material.dart';
import 'package:flutter_learn/screens/description/widgets/firebase_auth_demo.dart';
import 'package:flutter_learn/screens/description/widgets/image.dart';
import 'package:flutter_learn/screens/description/widgets/notification_demo.dart';
import 'package:flutter_learn/screens/description/widgets/razorpay_demo.dart';

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
      case DescriptionScreens.learnAbsorbPointer:
        return const LearnAbsorbPointer();
      case DescriptionScreens.learnAlign:
        return const LearnAlign();
      case DescriptionScreens.learnImage:
        return const LearnImage();
      case DescriptionScreens.razorpayDemo:
        return const RazorpayDemo();
      case DescriptionScreens.notificationDemo:
        return NotificationDemo();
      case DescriptionScreens.firebaseAuthDemo:
        return FirebaseAuthDemo();
      default:
        return const Center(
          child: Text("No route found"),
        );
    }
  }
}
