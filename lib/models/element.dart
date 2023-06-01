import 'package:flutter_markdown/flutter_markdown.dart';

class ElementOfList {
  final int id;
  bool checkBox;
  final String title;
  final int cost;
  final String description;

  ElementOfList(
      {required this.id,
      required this.checkBox,
      required this.title,
      required this.cost,
      this.description = ""});
}
