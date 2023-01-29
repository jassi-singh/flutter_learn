enum DescriptionScreens {
  homepage,
  learnAbsorbPointer,
  learnAlign,
  learnImage,
  razorpayDemo,
  notificationDemo,
  firebaseAuthDemo,
}

class CardInfo {
  String title;
  DescriptionScreens screen;
  CardInfo({
    required this.title,
    required this.screen,
  });
}
