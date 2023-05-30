import 'dart:ui';

class Category {
  final String id;
  final String title;
  final Color color;
  final String imageURL;

  const Category(
      {required this.imageURL,
      required this.id,
      required this.title,
      required this.color});
}
