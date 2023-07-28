
import 'package:equatable/equatable.dart';

import 'category_model.dart';
import 'opening_hours_model.dart';
import 'place_model.dart';
import 'product_model.dart';

import 'menu_item_model.dart';

class Restaurant extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final String description;
  final List<String> tags;
  final List<Category> categories;
  final List<Product> products;
  final List<OpeningHours> openingHours;
  final int deliveryTime;
  final String priceCategory;
  final double deliveryFee;
  final double distance;
  final Place address;

  const Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.tags,
    required this.categories,
    required this.products,
    required this.openingHours,
    required this.address,
    this.deliveryTime = 10,
    this.priceCategory = '\$',
    this.deliveryFee = 10,
    this.distance = 15,
  });



  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      imageUrl,
      tags,
      categories,
      products,
      openingHours,
      deliveryTime,
      priceCategory,
      deliveryFee,
      distance,
    ];
  }
}
