import 'package:flutter_learn/screens/description/widgets/razorpay_demo.dart';

import '../models/card_info_model.dart';
import '../screens/description/widgets/absorb_pointer.dart';
import '../screens/description/widgets/align.dart';
import '../screens/description/widgets/image.dart';

List<CardInfo> cardsList = [
  CardInfo(
    title: 'Absorb Pointer',
    routeName: LearnAbsorbPointer.routeName,
    screen: Screens.learnAbsorbPointer,
  ),
  CardInfo(
    title: 'Align',
    routeName: LearnAlign.routeName,
    screen: Screens.learnAlign,
  ),
  CardInfo(
    title: 'Image',
    routeName: LearnImage.routeName,
    screen: Screens.learnImage,
  ),
  CardInfo(
    title: 'Razorpay',
    routeName: RazorpayDemo.routeName,
    screen: Screens.razorpayDemo,
  ),
  // CardInfo(
  //   title: 'Agora',
  //   routeName: AgoraDemo.routeName,
  //   screen: Screens.agoraDemo,
  // ),
];
