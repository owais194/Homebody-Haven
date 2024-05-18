import 'package:decor_home/models/home_decor_colors.dart';

class HomeDecore {
  String title;
  String description;
  double price;
  int quantity;
  double score;
  List<String> images;
  bool isFavorite;
  List<HomeDecoreColor> colors;

  HomeDecore({
    required this.title,
    required this.description,
    required this.price,
    this.quantity = 1,
    required this.score,
    required this.images,
    this.isFavorite = false,
    required this.colors,
  });
}
