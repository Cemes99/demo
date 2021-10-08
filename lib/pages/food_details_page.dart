import 'package:demo/database/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'package:demo/models/food_model.dart';

class FoodDetails extends StatefulWidget {
  final Food food;
  const FoodDetails(this.food, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  int loved = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.white,
        ),
        backgroundColor: mainColor,
      ),
      body: ListView(
        children: [
          Image(
            image: AssetImage(widget.food.imagePath!),
            fit: BoxFit.fill,
          ),
          spaceV,
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      widget.food.name!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if(widget.food.loved == 0) {
                            widget.food.loved = 1;
                          } else {
                            widget.food.loved = 0;
                          }
                          DatabaseHelper.instance.addFoodToFavorite(widget.food);
                        });
                      },
                      icon: Icon(widget.food.loved == 1 ? Icons.favorite : Icons.favorite_border),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                spaceV,
                spaceV,
                Row(
                  children: [
                    const Text(
                      'Giá cả: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(widget.food.price.toString() + " VND"),
                  ],
                ),
                spaceV,
                Row(
                  children: [
                    const Text(
                      'Tên cửa hàng: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(widget.food.shop!),
                  ],
                ),
              ],
            ),
          ),
          spaceV,
          TextButton(
            onPressed: () {
              widget.food.carted = 1;
              DatabaseHelper.instance.addFoodToCart(widget.food);
            },
            child: const Text(
              'Thêm vào giỏ hàng',
              style: TextStyle(color: mainTextColor),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(mainColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: mainColor, width: 2)
                )
              )
            ),
          )
        ],
      ),
    );
  }


}