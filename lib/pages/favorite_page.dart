import 'package:demo/database/database.dart';
import 'package:demo/models/food_model.dart';
import 'package:demo/widgets/food_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: DatabaseHelper.instance.getFood(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildFoodCard(context, snapshot);
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  Widget buildFoodCard(BuildContext context, AsyncSnapshot snapshot) {
    List<Food> values = snapshot.data;

    bool hasData = false;

    if (values.isNotEmpty) {
      return ListView.builder(
        itemCount: values.length,
        itemBuilder: (context, index) {
          if(values[index].id != '' && values[index].loved == 1) {
            hasData = true;
            return FoodCard(values[index]);
          }
          if(index == values.length - 1 && !hasData) {
            return const Center(
              heightFactor: 25.0,
              child: Text('NO FOOD IN FAVORITE', style: noData),
            );
          }
          return const SizedBox(height: 0);
        },
      );
    }
    return const SizedBox(height: 0);
  }
}