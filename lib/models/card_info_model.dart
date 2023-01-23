enum Screens {
  homepage,
  learnAbsorbPointer,
  learnAlign,
  learnImage,
  razorpayDemo,
  agoraDemo
}

class CardInfo {
  String title;
  String routeName;
  Screens screen;
  CardInfo({
    required this.title,
    required this.routeName,
    required this.screen,
  });
}
