import 'dart:convert';

class CardInfo {
  String title;
  String routeName;
  CardInfo({
    required this.title,
    required this.routeName,
  });

  Map<String, dynamic> toMap() {
    final result = <String, String>{};

    result.addAll({'title': title});
    result.addAll({'routeName': routeName});

    return result;
  }

  factory CardInfo.fromMap(Map<String, dynamic> map) {
    return CardInfo(
      title: map['title'] ?? '',
      routeName: map['routeName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CardInfo.fromJson(String source) =>
      CardInfo.fromMap(json.decode(source));
}