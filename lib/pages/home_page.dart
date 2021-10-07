import 'package:flutter/material.dart';
import 'package:demo/constants.dart';

import 'package:demo/widgets/top_home_page.dart';
import 'package:demo/widgets/search_bar.dart';
import 'package:demo/widgets/food_card.dart';

import 'package:demo/models/food_model.dart';
import 'package:demo/data/food_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Food> _list = foods;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: background,
        child: ListView(
          padding: appMargin,
          children: <Widget>[
            const HomeTopWidget(),
            space,
            SearchBar(),
            space,
            Column(
              children: _list.map(buildFoodCard).toList(),
              mainAxisSize: MainAxisSize.min,
            )
          ],
        ),
      )
    );
  }

  Widget buildFoodCard(Food food) {
    return FoodCard(food);
  }
}