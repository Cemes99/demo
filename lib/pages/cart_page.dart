import 'package:demo/models/food_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:demo/constants.dart';
import 'package:demo/widgets/food_card.dart';
import 'package:demo/database/database.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool hasData = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: DatabaseHelper.instance.getFood(),
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                return buildFoodCard(context, snapshot);
              }
              return const CircularProgressIndicator();
            },
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(mainColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: mainColor, width: 2)
                      )
                  )
              ),
              onPressed: () {
                if(hasData) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Mua hàng thành công'),
                        content: const Text('Bạn có đồng ý mua hàng?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                DatabaseHelper.instance.clearCart();
                              });
                              Navigator.pop(context, 'OK');
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      )
                  );
                }
              },
              child: const Text('     Mua hàng     ', style: titleStyle,),
            ),
          )
        ],
      )

    );
  }

  Widget buildFoodCard(BuildContext context, AsyncSnapshot snapshot) {
    List<Food> values = snapshot.data;

    if(values.isNotEmpty) {
      return ListView.builder(
        itemCount: values.length,
        itemBuilder:(context, index) {
          if(values[index].id != '' && values[index].carted == 1) {
            hasData = true;
            return FoodCard(values[index]);
          }
          if(index == values.length - 1 && !hasData) {
            return const Center(
              heightFactor: 25.0,
              child: Text('NO FOOD IN CART', style: noData),
            );
          }
          return const SizedBox(height: 0);
        },
      );
    }
    return const SizedBox(height: 0);
  }
}