import 'package:demo/data/food_data.dart';
import 'package:demo/database/database.dart';

class Food {
  final String id;
  String? name;
  String? imagePath;
  String? category;
  int? price;
  String? shop;
  int? carted;
  int? loved;

  Food({required this.id, this.name, this.imagePath,
    this.category, this.price, this.shop, this.carted, this.loved});

  factory Food.fromMap(Map<String, dynamic> m) => Food(
    id: m['id'],
    name: m['name'],
    imagePath: m['imagePath'],
    category: m['category'],
    price: m['price'],
    shop: m['shop'],
    carted: m['carted'],
    loved: m['loved']
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imagePath': imagePath,
      'category': category,
      'price': price,
      'shop': shop,
      'carted': carted,
      'loved': loved
    };
  }

  static void initFood() async {
    for(var x in foods) {
      await DatabaseHelper.instance.addFoodToFood(x);
    }
  }

  void setCarted() {
    carted = 1;
  }
}

