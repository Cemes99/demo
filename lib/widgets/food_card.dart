import 'package:demo/models/food_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:demo/pages/food_details_page.dart';

class FoodCard extends StatefulWidget {
  final Food food;

  const FoodCard(this.food, {Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _FoodCard();
}

class _FoodCard extends State<FoodCard>{
  @override
  Widget build(BuildContext context) {
    if(widget.food.id == '') {
      return const SizedBox(height: 0.0,);
    }
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        side: BorderSide(color: Colors.black12, width: 1)
      ),
      child: ListTile(
          leading: SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(widget.food.imagePath!, fit: BoxFit.cover)
          ),
          title: Text(widget.food.name!),
          subtitle: Text(widget.food.price.toString() + " VND"),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => FoodDetails(widget.food)
          )),
      ),
    );
  }
}